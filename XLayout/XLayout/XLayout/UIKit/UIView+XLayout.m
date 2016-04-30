//
//  UIView+XLayout.m
//  XLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UIView+XLayout.h"
#import <objc/runtime.h>

@implementation UIView (XLayout)

- (NSString *)layout_id {
    return objc_getAssociatedObject(self, _cmd);
}

- (id)layout {
    return objc_getAssociatedObject(self, _cmd);
}

- (XLayoutViewService *)viewService {
    return objc_getAssociatedObject(self, _cmd);
}

@end


#pragma mark - Private

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

