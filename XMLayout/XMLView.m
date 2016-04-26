//
//  XMLView.m
//  XMLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XMLView.h"

#import "HexColors.h"
#import "ONOXMLDocument.h"
#import "UIView+XMLayout.h"

@implementation XMLView

+ (id)viewFromXML:(NSString *)xml {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"xml" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithData:data error:&error];
    
    NSAssert(!error, error.description);
    
    UIView *contentView = [[UIView alloc] init];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self parserSubViewWithParent:contentView children:document.rootElement.children];
    
    return contentView;
}

+ (void)parserSubViewWithParent:(UIView *)parentView children:(NSArray *)children {
    
    for (ONOXMLElement *element in children) {
        
        id currentView = [[NSClassFromString(element.tag) alloc] init];
        
        id layout = nil;
        
        if ([[element.attributes allKeys] containsObject:@"Class"]) {
            
            NSString *className = [element.attributes objectForKey:@"Class"];
            NSAssert(className, @"The class name cannot be empty");
            
            layout = [[NSClassFromString(className) alloc] initWithRelationshipView:currentView];
            [currentView setLayout:layout];
        }else {
            
            layout = [[XMLayout alloc] initWithRelationshipView:currentView];
            [currentView setLayout:layout];
        }
        
        [currentView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [parentView addSubview:currentView];
        
        [element.attributes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            NSString *initial = [[key substringToIndex:1] uppercaseString];
            NSString *remanent = [key substringFromIndex:1];
            NSString *methodName = [NSString stringWithFormat:@"set%@%@:",initial,remanent];
            
            id target = nil;
            
            if ([currentView respondsToSelector:NSSelectorFromString(methodName)]) {
                target = currentView;
            }else if ([layout respondsToSelector:NSSelectorFromString(methodName)]) {
                target = layout;
            }
            
            if (target) {
                
                NSMethodSignature *signature = [[target class] instanceMethodSignatureForSelector:NSSelectorFromString(methodName)];
                NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
                
                const char *type = [signature getArgumentTypeAtIndex:2];
                
                if (strcmp(type, "d") == 0) {
                    
                    CGFloat argument = [obj floatValue];
                    [invocation setArgument:&argument atIndex:2];
                }else {
                    
                    if ([key rangeOfString:@"color" options:NSCaseInsensitiveSearch].location != NSNotFound) {
                        
                        obj = [UIColor hx_colorWithHexRGBAString:obj];
                    }
                    [invocation setArgument:&obj atIndex:2];
                }
                
                [invocation setSelector:NSSelectorFromString(methodName)];
                [invocation setTarget:target];
                [invocation invoke];
            }
        }];
        
        if (element.children.count > 0) {
            [self parserSubViewWithParent:currentView children:element.children];
        }
    }
}















@end
