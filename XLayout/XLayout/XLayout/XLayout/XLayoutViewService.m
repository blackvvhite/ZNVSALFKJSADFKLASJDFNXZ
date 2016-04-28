//
//  XMLView.m
//  XLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XLayoutViewService.h"

#import <objc/runtime.h>

#import "ONOXMLDocument.h"

#import "UIView+XLayout.h"
#import "UIColor+XLayout.h"
#import "XLayoutRelative.h"

NSString *const XLayout_ROOT_VIEW_ID       = @"XLayout_ROOT_VIEW_ID";
NSString *const XLayout_CONTENT_VIEW_ID    = @"XLayout_CONTENT_VIEW_ID";

@interface XLayoutViewService ()

@property (nonatomic, copy) NSURL *viewDataURL;
@property (nonatomic, readwrite, strong) id eventHandler;
@property (nonatomic, readwrite, strong) UIView *contentView;
@property (nonatomic, strong) NSMutableDictionary *viewMap;

@end

@implementation XLayoutViewService

/* NSURL or XML file name */
+ (instancetype)serviceFromXML:(id)XML eventHandler:(id)eventHandler {
    
    NSAssert(XML, @"The XML cannot be empty");
    
    XLayoutViewService *service = [[XLayoutViewService alloc] init];
    service.eventHandler = eventHandler;
    
    if ([XML isKindOfClass:[NSString class]]) {
        
        NSURL *URL = [[NSBundle mainBundle] URLForResource:XML withExtension:@"xml"];
        
        NSAssert(URL, @"The XML is invalid");
        
        service.viewDataURL = URL;
        
    }else if ([XML isKindOfClass:[NSURL class]]) {
        
        service.viewDataURL = XML;
    }
    
    return service;
}

- (UIView *)contentView {
    
    if (!_contentView) {
        
        _contentView = [[UIView alloc] init];
        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
        _contentView.layout_id = XLayout_CONTENT_VIEW_ID;
        
        [self createView];
    }
    
    return _contentView;
}

- (NSMutableDictionary *)viewMap {
    
    if (!_viewMap) {
        
        _viewMap = [[NSMutableDictionary alloc] init];
    }
    return _viewMap;
}

- (UIView *(^)(NSString *layoutId))viewWithLayoutId {
    
    return ^(NSString *layoutId){
        return [self.viewMap objectForKey:layoutId];
    };
}

- (void)createView {
    
    NSError *error;
    NSString *pretreatment = [NSString stringWithContentsOfURL:self.viewDataURL
                                                      encoding:NSUTF8StringEncoding
                                                         error:&error];
    NSAssert(!error, error.description);
    
    pretreatment = [pretreatment stringByReplacingOccurrencesOfString:@">=" withString:@"&gt;="];
    pretreatment = [pretreatment stringByReplacingOccurrencesOfString:@"<=" withString:@"&lt;="];
    
    NSData *data = [NSData dataWithData:[pretreatment dataUsingEncoding:NSUTF8StringEncoding]];
    
    ONOXMLDocument *document = [ONOXMLDocument XMLDocumentWithData:data error:&error];
    
    NSAssert(!error, error.description);
    
    [self createSubViewWithParent:self.contentView children:document.rootElement.children];
    [self activateLayout];
}

- (void)createSubViewWithParent:(UIView *)parentView children:(NSArray *)children {
    
    for (ONOXMLElement *element in children) {
        
        id currentView = [NSClassFromString(element.tag) xLayoutInit];
        
        id layoutId = [element valueForAttribute:@"layout_id"];
        
        if (layoutId) {
            
            [currentView setLayout_id:layoutId];
            [self.viewMap setObject:currentView forKey:layoutId];
            
        }else {
            
            [self.viewMap setObject:currentView forKey:@(element.lineNumber)];
        }
        
        id layout = nil;
        
        if ([[element.attributes allKeys] containsObject:@"layout_class"]) {
            
            NSString *className = [element.attributes objectForKey:@"layout_class"];
            NSAssert(className, @"The class name cannot be empty");
            
            layout = [[NSClassFromString(className) alloc] initWithRelationshipView:currentView];
            
        }else {
            
            layout = [[XLayoutRelative alloc] initWithRelationshipView:currentView];
        }
        
        [parentView addSubview:currentView];
        [currentView setLayout:layout];
        [currentView setViewService:self];
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
                
            }else if ([currentView respondsToSelector:NSSelectorFromString(key)]){
                
                target = currentView;
                methodName = key;
                
            }else {
                
                methodName = [key stringByAppendingString:@":"];
                
                if ([currentView respondsToSelector:NSSelectorFromString(methodName)]){
                    
                    target = currentView;
                }
            }

            if (target) {
                
                [self invocationWithTarget:target methodName:methodName argumentsObject:obj];
            }
        }];
        
        if (element.children.count > 0) {
            
            [self createSubViewWithParent:currentView children:element.children];
        }
    }
}

- (void)invocationWithTarget:(id)target methodName:(NSString *)methodName argumentsObject:(id)argumentsObject {
    
    SEL selector = NSSelectorFromString(methodName);
    
    NSMethodSignature *signature = [[target class] instanceMethodSignatureForSelector:NSSelectorFromString(methodName)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:argumentsObject];
    
    const char *type = [signature getArgumentTypeAtIndex:2];
    
    if (strcmp(type, "c") == 0) {
        
        char arguments = [number charValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "i") == 0) {
        
        CGFloat arguments = [number intValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "s") == 0) {
        
        CGFloat arguments = [number shortValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "l") == 0) {
        
        long arguments = [number longValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "q") == 0) {
        
        long long arguments = [number longLongValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "C") == 0) {
        
        unsigned char arguments = [number unsignedCharValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "I") == 0) {
        
        unsigned int arguments = [number unsignedIntValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "S") == 0) {
        
        unsigned short arguments = [number unsignedShortValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "L") == 0) {
        
        unsigned long arguments = [number unsignedLongValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "Q") == 0) {
        
        unsigned long long arguments = [number unsignedLongLongValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "f") == 0) {
        
        float arguments = [number floatValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "d") == 0) {
        
        double arguments = [number doubleValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "B") == 0) {
        
        BOOL arguments = [number boolValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "*") == 0) {
        
        const char *arguments = [argumentsObject UTF8String];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "#") == 0) {
        
        Class arguments = NSClassFromString(argumentsObject);
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, ":") == 0) {
        
        SEL arguments = NSSelectorFromString(argumentsObject);
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "f") == 0) {
        
        float arguments = [number floatValue];
        [invocation setArgument:&arguments atIndex:2];
        
    }else if (strcmp(type, "@") == 0) {
        
        id arguments;
        [self transformationParameterTypeWithArguments:argumentsObject output:&arguments];
        
        [invocation setArgument:&arguments atIndex:2];
    }
    
    [invocation setSelector:selector];
    [invocation setTarget:target];
    [invocation invoke];
}

- (void)transformationParameterTypeWithArguments:(id)arguments output:(id *)output {
    
    NSRange type = [arguments rangeOfString:@"^@color:" options:NSRegularExpressionSearch];
    
    id(^getValue)(NSRange r) = ^(NSRange r){
        NSUInteger location = r.location + r.length;
        NSString *value = [arguments substringFromIndex:location];
        return value;
    };
    
    if (type.location != NSNotFound && type.length != 0) {
        
        UIColor *arguments = [UIColor colorWithString:getValue(type)];
        
        *output = arguments;
        
        return;
    }
    
    type = [arguments rangeOfString:@"^@img:" options:NSRegularExpressionSearch];
    
    if (type.location != NSNotFound && type.length != 0) {
        
        UIImage *arguments = [UIImage imageNamed:getValue(type)];
        
        *output = arguments;
        
        return;
    }
    
    *output = arguments;
}

- (void)activateLayout {
    
    [self.viewMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [[obj layout] activate];
    }];
}

- (NSArray *)relativeLayoutProperties {
    
    static NSArray *propertie = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        u_int count;
        objc_property_t *properties = class_copyPropertyList([XLayoutRelative class], &count);
        
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
