//
//  NSLayoutConstraint+XLayout.m
//  XLayout
//
//  Created by admin on 16/4/28.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "NSLayoutConstraint+XLayout.h"

#import <objc/runtime.h>
#import "UIView+XLayout.h"

@implementation NSLayoutConstraint (XLayout)

- (void)setLayoutPosition:(NSString *)layoutPosition {
    objc_setAssociatedObject(self, @selector(layoutPosition), layoutPosition, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)layoutPosition {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLayoutAttribute:(NSString *)layoutAttribute {
    objc_setAssociatedObject(self, @selector(layoutAttribute), layoutAttribute, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)layoutAttribute {
    return objc_getAssociatedObject(self, _cmd);
}

- (NSString *)description {
    NSMutableString *description = [[NSMutableString alloc] init];
    [description appendString:@"\n===>\n"];
    [description appendFormat:@"    Exception view:%@",[self.firstItem layout_id]];
    [description appendString:@"    |    "];
    [description appendFormat:@"layout position:%@",self.layoutPosition];
    [description appendString:@"    |    "];
    [description appendFormat:@"attribute:%@",self.layoutAttribute];
    [description appendString:@"\n===>"];
    return description;
}

@end
