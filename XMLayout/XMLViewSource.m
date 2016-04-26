//
//  XMLView.m
//  XMLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XMLViewSource.h"

#import "HexColors.h"
#import "ONOXMLDocument.h"
#import "UIView+XMLayout.h"
#import "XMLRelativeLayout.h"
#import "UIView+XMLayoutExtension.h"

#import <objc/runtime.h>

@implementation XMLViewSource

+ (id)viewFromXML:(NSString *)xml {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:xml ofType:@"xml"];
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
    
    NSMutableDictionary *siblingViews = [[NSMutableDictionary alloc] initWithCapacity:children.count];
    for (ONOXMLElement *element in children) {
    
        id view = [[NSClassFromString(element.tag) alloc] init];
        id layoutId = [element valueForAttribute:@"layout_id"];
        
        if (layoutId) {
            [view setLayout_id:layoutId];
        }
        [siblingViews setObject:view forKey:element];
        [parentView addSubview:view];
    }
    
    for (ONOXMLElement *element in children) {
        
        id currentView = [siblingViews objectForKey:element];
        id layout = nil;
        
        if ([[element.attributes allKeys] containsObject:@"layout_class"]) {
            
            NSString *className = [element.attributes objectForKey:@"layout_class"];
            NSAssert(className, @"The class name cannot be empty");
            
            layout = [[NSClassFromString(className) alloc] initWithRelationshipView:currentView];
            [currentView setLayout:layout];
        }else {
            
            __block NSString *layoutClass = NSStringFromClass([XMLBaseLayout class]);
            [element.attributes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                
                if ([[self relativeLayoutProperties] containsObject:key]) {
                    layoutClass = NSStringFromClass([XMLRelativeLayout class]);
                    *stop = YES;
                }
            }];
            
            layout = [[NSClassFromString(layoutClass) alloc] initWithRelationshipView:currentView];
            [currentView setLayout:layout];
        }
        
        [currentView setSiblingView:[siblingViews allValues]];
        [currentView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
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

+ (NSArray *)relativeLayoutProperties {
    
    static NSArray *propertie = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        u_int count;
        objc_property_t *properties = class_copyPropertyList([XMLRelativeLayout class], &count);
        
        if (count == 0) {
            propertie = @[];
        }
        
        NSMutableArray *tempPropertie = [[NSMutableArray alloc] initWithCapacity:count];
        
        for (int i = 0; i < count; i++) {
            [tempPropertie addObject:[NSString stringWithUTF8String:property_getName(properties[i])]];
        }
        
        free(properties);
        
        propertie = tempPropertie;
    });
    
    return propertie;
}











@end
