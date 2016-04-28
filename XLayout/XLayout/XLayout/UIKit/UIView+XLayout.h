//
//  UIView+XLayout.h
//  XLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XLayoutBase.h"

@class XLayoutViewService;
@interface UIView (XLayout)

+ (instancetype)xLayoutInit;

@property (nonatomic, copy  ) NSString *layout_id;
@property (nonatomic, strong) XLayoutBase *layout;
@property (nonatomic, weak  ) XLayoutViewService *viewService;


@end
