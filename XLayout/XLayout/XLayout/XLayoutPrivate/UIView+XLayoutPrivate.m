//
//  UIView+XLayoutPrivate.m
//  XLayout
//
//  Created by admin on 16/5/1.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UIView+XLayoutPrivate.h"
#import <objc/runtime.h>
#import "UIView+XLayout.h"

@implementation UIView (XLayoutPrivate)

+ (instancetype)viewWithXMLElementObject:(id)element {
    return [[self alloc] init];
}

- (void)layout_id:(NSString *)layout_id {
    objc_setAssociatedObject(self, @selector(layout_id), layout_id, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)layout:(id)layout {
    objc_setAssociatedObject(self, @selector(layout), layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)viewService:(XLayoutViewService *)viewService {
    objc_setAssociatedObject(self, @selector(viewService), viewService, OBJC_ASSOCIATION_ASSIGN);
}

- (void)setEventHandler:(id)eventHandler {
    objc_setAssociatedObject(self, @selector(eventHandler), eventHandler, OBJC_ASSOCIATION_ASSIGN);
}

- (XLayoutViewService *)eventHandler {
    return objc_getAssociatedObject(self, _cmd);
}

@end
