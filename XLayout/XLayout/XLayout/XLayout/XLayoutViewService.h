//
//  XMLView.h
//  XLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const XLAYOUT_CONTROLLER_VIEW_ID;
extern NSString *const XLAYOUT_TABLE_VIEW_CELL_ID;
extern NSString *const XLAYOUT_COLLECTION_VIEW_CELL_ID;
extern NSString *const XLAYOUT_COLLECTION_REUSABLE_VIEW_ID;

@class UIView;
@interface XLayoutViewService : NSObject

@property (nonatomic, readonly, strong) UIView *contentView;
@property (nonatomic, readonly, strong) id eventHandler;

+ (instancetype)serviceFromXMLName:(NSString *)name eventHandler:(id)eventHandler;

- (void)activateLayout;
- (NSDictionary *)viewMap;
- (id(^)(NSString *layoutId))viewById;

@end
