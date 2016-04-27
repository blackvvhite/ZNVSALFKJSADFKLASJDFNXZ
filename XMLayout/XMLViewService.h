//
//  XMLView.h
//  XMLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const XMLAYOUT_ROOT_VIEW_ID;
extern NSString *const XMLAYOUT_CONTENT_VIEW_ID;

@class UIView;
@interface XMLViewService : NSObject

+ (instancetype)serviceFromXML:(id/* NSURL or XML file name */)XML;

@property (nonatomic, readonly, strong) UIView *contentView;

- (UIView *(^)(NSString *layoutId))viewWithLayoutId;

@end
