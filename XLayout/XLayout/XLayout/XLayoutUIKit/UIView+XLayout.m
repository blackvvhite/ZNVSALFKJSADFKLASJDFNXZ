//
//  UIView+XLayout.m
//  XLayout
//
//  Created by B&W on 16/4/26.
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


