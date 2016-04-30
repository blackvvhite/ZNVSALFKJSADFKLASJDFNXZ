//
//  XMLView.h
//  XLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const XLAYOUT_ROOT_VIEW_ID;

@class UIView;
@interface XLayoutViewService : NSObject

@property (nonatomic, weak) UIView *rootView;
@property (nonatomic, readonly, strong) UIView *contentView;
@property (nonatomic, readonly, strong) id eventHandler;

+ (instancetype)serviceFromXMLURL:(NSURL *)URL eventHandler:(id)eventHandler;
+ (instancetype)serviceFromXMLName:(NSString *)name eventHandler:(id)eventHandler;

- (UIView *(^)(NSString *layoutId))viewWithLayoutId;

@end
