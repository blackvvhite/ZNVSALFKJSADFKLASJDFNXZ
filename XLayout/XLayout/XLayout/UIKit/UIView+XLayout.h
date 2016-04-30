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

@property (nonatomic, copy, readonly) NSString *layout_id;
@property (nonatomic, strong, readonly) XLayoutBase *layout;
@property (nonatomic, weak, readonly) XLayoutViewService *viewService;

@end

@interface UIView (XLayoutPrivate)

+ (instancetype)viewWithXMLElementObject:(id)element;
- (void)layout_id:(NSString *)layout_id;
- (void)layout:(id)layout;
- (void)viewService:(XLayoutViewService *)viewService;
@property (nonatomic, weak) id eventHandler;

@end