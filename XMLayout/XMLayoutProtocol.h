//
//  XMLBaseProtocol.h
//  XMLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <CoreGraphics/CGBase.h>
#import <UIKit/UIView.h>

@protocol XMLayoutProtocol <NSObject>

@property (nonatomic, readonly, weak) UIView *relationshipView;

@property (nonatomic, assign) CGFloat layout_marginTop;
@property (nonatomic, assign) CGFloat layout_marginBottom;
@property (nonatomic, assign) CGFloat layout_marginLeft;
@property (nonatomic, assign) CGFloat layout_marginRight;
@property (nonatomic, assign) CGFloat layout_width;
@property (nonatomic, assign) CGFloat layout_height;

@end
