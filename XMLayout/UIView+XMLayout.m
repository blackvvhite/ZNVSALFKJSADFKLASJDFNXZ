//
//  UIView+XMLayout.m
//  XMLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UIView+XMLayout.h"

#import <objc/runtime.h>

@implementation UIView (XMLayout)

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

- (void)setViewService:(XMLViewService *)viewService {
    
    objc_setAssociatedObject(self, @selector(viewService), viewService, OBJC_ASSOCIATION_ASSIGN);
}

- (XMLViewService *)viewService {
    
    return objc_getAssociatedObject(self, _cmd);
}

@end
