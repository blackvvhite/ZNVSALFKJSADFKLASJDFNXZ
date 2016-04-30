//
//  XLayoutBase.h
//  XLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIGeometry.h>

@class UIView;
@interface XLayoutBase : NSObject

- (instancetype)initWithView:(UIView *)view;

@property (nonatomic, readonly, weak) UIView *view;
@property (nonatomic, assign) BOOL deleteEexistingWhenUpdating;

@property (nonatomic, copy) NSString *layout_top;
@property (nonatomic, copy) NSString *layout_bottom;
@property (nonatomic, copy) NSString *layout_left;
@property (nonatomic, copy) NSString *layout_right;
@property (nonatomic, copy) NSString *layout_origin;
@property (nonatomic, copy) NSString *layout_destination;
@property (nonatomic, copy) NSString *layout_top_bottom;
@property (nonatomic, copy) NSString *layout_left_right;

@property (nonatomic, copy) NSString *layout_width;
@property (nonatomic, copy) NSString *layout_height;
@property (nonatomic, copy) NSString *layout_size;
//@property (nonatomic, assign) BOOL layout_width_height_equal;

@property (nonatomic, copy) NSString *layout_above;
@property (nonatomic, copy) NSString *layout_below;
@property (nonatomic, copy) NSString *layout_in_leading;
@property (nonatomic, copy) NSString *layout_in_trailing;

@property (nonatomic, copy) NSString *layout_baseline;

@property (nonatomic, copy) NSString *layout_center;
@property (nonatomic, copy) NSString *layout_centerX;
@property (nonatomic, copy) NSString *layout_centerY;

@property (nonatomic, copy) NSString *layout_equal;
@property (nonatomic, copy) NSString *layout_edge;

- (void)activate;
- (void)deactivate;

@end
