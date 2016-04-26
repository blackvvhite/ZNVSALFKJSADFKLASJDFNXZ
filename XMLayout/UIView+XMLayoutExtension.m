//
//  UIView+XMLayoutExtension.m
//  XMLayout
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UIView+XMLayoutExtension.h"

#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic, strong) NSArray *siblingView;

@end

@implementation UIView (XMLayoutExtension)

#pragma mark - Private Getter / Setter

- (void)setSiblingView:(NSArray *)siblingView {
    objc_setAssociatedObject(self, @selector(siblingView), siblingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)siblingView {
    
    return objc_getAssociatedObject(self, _cmd);
}
#pragma mark - Public Getter / Setter

- (void)setLayout_id:(NSString *)layout_id {
    
    objc_setAssociatedObject(self, @selector(layout_id), layout_id, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)layout_id {
    
    return objc_getAssociatedObject(self, _cmd);
}
- (UIView *)viewByLayoutId:(NSString *)layoutId {

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"layout_id = %@",layoutId];
    return [[self.siblingView filteredArrayUsingPredicate:predicate] firstObject];
}

@end
