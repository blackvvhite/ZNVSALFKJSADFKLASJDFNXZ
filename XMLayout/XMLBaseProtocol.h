//
//  XMLBaseProtocol.h
//  XMLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <CoreGraphics/CGBase.h>
#import <UIKit/UIView.h>

@protocol XMLBaseProtocol <NSObject>

@property (nonatomic, readonly, weak) UIView *relationshipView;

@property (nonatomic, assign) CGFloat margin_top;
@property (nonatomic, assign) CGFloat margin_bottom;
@property (nonatomic, assign) CGFloat margin_left;
@property (nonatomic, assign) CGFloat margin_right;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@end
