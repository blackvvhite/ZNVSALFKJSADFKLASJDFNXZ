//
//  UIView+XMLayoutExtension.h
//  XMLayout
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XMLayoutExtension)

@property (nonatomic, copy) NSString *layout_id;

- (void)setSiblingView:(NSArray *)siblingView;

- (UIView *)viewByLayoutId:(NSString *)layoutId;

@end
