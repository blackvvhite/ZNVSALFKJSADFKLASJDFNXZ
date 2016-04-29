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

#pragma mark - Public Getter / Setter

- (void)setLayout_id:(NSString *)layout_id {
    objc_setAssociatedObject(self, @selector(layout_id), layout_id, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)layout_id {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLayout:(id)layout {
    objc_setAssociatedObject(self, @selector(layout), layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)layout {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setViewService:(XLayoutViewService *)viewService {
    objc_setAssociatedObject(self, @selector(viewService), viewService, OBJC_ASSOCIATION_ASSIGN);
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

@end

