//
//  UIView+XLayout.h
//  XLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XLayoutBase;
@class XLayoutViewService;
@interface UIView (XLayout)

@property (nonatomic, copy  ) NSString *layout_id;
@property (nonatomic, strong) XLayoutBase *layout;
@property (nonatomic, weak  ) XLayoutViewService *viewService;

@end

@interface UIView (XLayoutPrivate)

+ (instancetype)viewWithXMLElementObject:(id)element;
@property (nonatomic, weak) id eventHandler;

@end