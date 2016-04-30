//
//  UIViewController+XLayoutExtension.m
//  XLayout
//
//  Created by admin on 16/4/27.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UIViewController+XLayout.h"
#import "UIView+XLayout.h"
#import "XLayoutBase.h"
#import "XLayoutViewService.h"
#import <objc/runtime.h>

@implementation UIViewController (XLayout)

- (void)setViewService:(XLayoutViewService *)viewService {
    objc_setAssociatedObject(self, @selector(viewService), viewService, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (XLayoutViewService *)viewService {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)loadViewFromXML:(id/* NSURL or XML file name */)XML {
    XLayoutViewService *service = [XLayoutViewService serviceFromXMLName:XML eventHandler:self];
    [self.view addSubview:service.contentView];
    [self.view layout_id:XLAYOUT_CONTROLLER_VIEW_ID];
    [self.view viewService:service];
    [self setViewService:service];
    [service activateLayout];
}

@end
