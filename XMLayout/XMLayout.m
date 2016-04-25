//
//  XMLayout.m
//  XMLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XMLayout.h"

#import "HexColors.h"

#import "ONOXMLDocument.h"

@implementation XMLayout

+ (id)viewFromXML:(NSString *)xml {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"xml" ofType:@"xml"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *error;
    
    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithData:data error:&error];
    
    if (error) {
        NSLog(@"%@",error);
        return nil;
    }
    
    NSArray *childrens = document.rootElement.children;
    
    UIView *parentView = [[UIView alloc] init];
    parentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    for (ONOXMLElement *element in childrens) {
        
        NSLog(@"%@",element.tag);
        
        id subView = [[NSClassFromString(element.tag) alloc] init];
        
        [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [parentView addSubview:subView];
        
        [element.attributes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            NSString *methodName = [NSString stringWithFormat:@"set%@%@:",[[key substringToIndex:1] uppercaseString],[key substringFromIndex:1]];
            
            
            
            NSMethodSignature *signature = [[subView class] instanceMethodSignatureForSelector:NSSelectorFromString(methodName)];
            
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            [invocation setSelector:NSSelectorFromString(methodName)];
            
            
            const char *type = [signature getArgumentTypeAtIndex:2];
            
            
            NSLog(@"\n%@\n%@\n%@\n%s\n%@",element.tag,key,methodName,type,obj);
            
            if (strcmp(type, "d") == 0) {
                CGFloat argument = [obj floatValue];
                [invocation setArgument:&argument atIndex:2];
            }else {
                
                [invocation setArgument:&obj atIndex:2];
            }
            
            [invocation setTarget:subView];
            [invocation invoke];
        }];
    }
    return parentView;
}

@end
