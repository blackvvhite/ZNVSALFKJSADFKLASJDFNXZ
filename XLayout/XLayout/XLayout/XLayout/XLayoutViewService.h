//
//  XMLView.h
//  XLayout
//
//  Created by B&W on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>

extern NSString *const XLAYOUT_CONTROLLER_VIEW_ID;
extern NSString *const XLAYOUT_TABLE_VIEW_CELL_ID;
extern NSString *const XLAYOUT_COLLECTION_VIEW_CELL_ID;
extern NSString *const XLAYOUT_COLLECTION_REUSABLE_VIEW_ID;

@class XLayoutBase;
@class XLayoutViewService;
@interface UIView (XLayoutBase)

@property (nonatomic, copy, readonly) NSString *layout_id;
@property (nonatomic, strong, readonly) XLayoutBase *layout;
@property (nonatomic, weak, readonly) XLayoutViewService *viewService;

@end

@interface XLayoutViewService : NSObject

@property (nonatomic, readonly, strong) UIView *contentView;
@property (nonatomic, readonly, strong) id eventHandler;

+ (instancetype)serviceFromXMLName:(NSString *)name eventHandler:(id)eventHandler;

- (void)activateLayout;
- (id(^)(NSString *layoutId))viewById;

@end
