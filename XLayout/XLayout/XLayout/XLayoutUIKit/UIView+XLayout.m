//
//  UIView+XLayout.m
//  XLayout
//
//  Created by B&W on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UIView+XLayout.h"
#import "UIColor+XLayoutPrivate.h"
#import <objc/runtime.h>


@implementation UIView (XLayout)

- (void)setCornerBorder:(NSString *)cornerBorder {
    NSRange r = [cornerBorder rangeOfString:@"^\\{.+\\}$" options:NSRegularExpressionSearch];
    NSArray *component = nil;
    if (r.location != NSNotFound && r.length != 0) {
        r.location += 1;
        r.length -= 2;
        component = [[cornerBorder substringWithRange:r] componentsSeparatedByString:@","];
    }
    NSAssert((component.count > 0 && [component count] <= 3), @"Parameter format error. attribute:%@",cornerBorder);
    
    self.layer.cornerRadius = [[component firstObject] floatValue];
    if (component.count >= 2) {
        self.layer.borderWidth = [[component objectAtIndex:1] floatValue];
    }
    if (component.count == 3) {
        self.layer.borderColor = [[UIColor colorWithString:[component lastObject]] CGColor];
    }
}

- (NSString *)cornerBorder {
    return objc_getAssociatedObject(self, _cmd);
}

@end


