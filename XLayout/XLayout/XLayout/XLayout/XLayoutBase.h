//
//  XLayoutBase.H
//  XLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIView;
@interface XLayoutBase : NSObject

- (instancetype)initWithView:(UIView *)view;

@property (nonatomic, readonly, weak) UIView *view;
@property (nonatomic, assign) BOOL deleteEexistingWhenUpdating;

@property (nonatomic, copy) NSString *layout_top;
@property (nonatomic, copy) NSString *layout_bottom;
@property (nonatomic, copy) NSString *layout_left;
@property (nonatomic, copy) NSString *layout_right;

@property (nonatomic, copy) NSString *layout_width;
@property (nonatomic, copy) NSString *layout_height;

@property (nonatomic, copy) NSString *layout_above;
@property (nonatomic, copy) NSString *layout_below;
@property (nonatomic, copy) NSString *layout_baseline;

@property (nonatomic, copy) NSString *layout_center;
@property (nonatomic, copy) NSString *layout_centerX;
@property (nonatomic, copy) NSString *layout_centerY;

- (void)assert;
- (void)activate;
- (void)deactivate;

@end
