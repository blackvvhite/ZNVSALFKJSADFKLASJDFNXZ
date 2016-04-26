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

- (void)setLayout:(XMLayout *)layout {
    objc_setAssociatedObject(self, _cmd, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (XMLayout *)layout {
    return objc_getAssociatedObject(self, @selector(setLayout:));
}

@end
