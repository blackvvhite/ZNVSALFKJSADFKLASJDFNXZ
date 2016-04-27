//
//  XMLView.m
//  XMLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XMLViewService.h"

#import <objc/runtime.h>

#import "HexColors.h"
#import "ONOXMLDocument.h"
#import "UIView+XMLayout.h"
#import "XMLRelativeLayout.h"


NSString *const XMLAYOUT_ROOT_VIEW_ID       = @"XMLAYOUT_ROOT_VIEW_ID";
NSString *const XMLAYOUT_CONTENT_VIEW_ID    = @"XMLAYOUT_CONTENT_VIEW_ID";

@interface XMLViewService ()

@property (nonatomic, copy) NSURL *viewDataURL;
@property (nonatomic, readwrite, strong) UIView *contentView;
@property (nonatomic, strong) NSMutableDictionary *viewMap;

@end

@implementation XMLViewService

+ (instancetype)serviceFromXML:(id/* NSURL or XML file name */)XML; {
    
    NSAssert(XML, @"The XML cannot be empty");
    
    XMLViewService *service = [[XMLViewService alloc] init];
    
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
        _contentView.layout_id = XMLAYOUT_CONTENT_VIEW_ID;
        
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
    
    return ^id(NSString *layoutId){
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
    [self configSubViewWithXMLDataObject:document.rootElement.children];
}

- (void)createSubViewWithParent:(UIView *)parentView children:(NSArray *)children {
    
    for (ONOXMLElement *element in children) {
    
        id view = [[NSClassFromString(element.tag) alloc] init];
        id layoutId = [element valueForAttribute:@"layout_id"];
        
        if (layoutId) {
            
            [view setLayout_id:layoutId];
            [self.viewMap setObject:view forKey:layoutId];
            
        }else {
            
            [self.viewMap setObject:view forKey:@(element.lineNumber)];
        }
        
        [parentView addSubview:view];
        
        if (element.children.count > 0) {
            [self createSubViewWithParent:view children:element.children];
        }
    }
}

- (void)configSubViewWithXMLDataObject:(NSArray *)XMLData {
    
    for (ONOXMLElement *element in XMLData) {
    
        id currentView = nil;
        id layout = nil;
        
        id layoutId = [element valueForAttribute:@"layout_id"];
        
        if (layoutId) {
            
            currentView = [self.viewMap objectForKey:layoutId];
            
        }else {
            
            currentView = [self.viewMap objectForKey:@(element.lineNumber)];
        }
        
        if ([[element.attributes allKeys] containsObject:@"layout_class"]) {
            
            NSString *className = [element.attributes objectForKey:@"layout_class"];
            NSAssert(className, @"The class name cannot be empty");
            
            layout = [[NSClassFromString(className) alloc] initWithRelationshipView:currentView];
            
        }else {
            
            layout = [[XMLRelativeLayout alloc] initWithRelationshipView:currentView];
        }
        
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
            }
            
            if (target) {
                
                NSMethodSignature *signature = [[target class] instanceMethodSignatureForSelector:NSSelectorFromString(methodName)];
                NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
                
                const char *type = [signature getArgumentTypeAtIndex:2];
                
                if (strcmp(type, "d") == 0) {
                    
                    CGFloat argument = [obj floatValue];
                    [invocation setArgument:&argument atIndex:2];
                    
                } else if (strcmp(type, "B") == 0) {
                    
                    BOOL argument = [obj boolValue];
                    [invocation setArgument:&argument atIndex:2];
                    
                } else {
                    
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
            
            [self configSubViewWithXMLDataObject:element.children];
        }
    }
}

- (NSArray *)relativeLayoutProperties {
    
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
