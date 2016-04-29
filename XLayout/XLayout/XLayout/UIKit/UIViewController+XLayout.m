//
//  UIViewController+XLayoutExtension.m
//  XLayout
//
//  Created by admin on 16/4/27.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UIViewController+XLayout.h"

#import <objc/runtime.h>

#import "XLayoutViewService.h"
#import "UIView+XLayout.h"

@implementation UIViewController (XLayout)

- (void)setViewService:(XLayoutViewService *)viewService {
    objc_setAssociatedObject(self, @selector(viewService), viewService, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (XLayoutViewService *)viewService {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)loadViewFromXML:(id/* NSURL or XML file name */)XML {
    XLayoutViewService *service = [XLayoutViewService serviceFromXML:XML eventHandler:self];
    
    [self.view addSubview:service.contentView];
    [self.view setLayout_id:XLayout_ROOT_VIEW_ID];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:nil views:@{@"view":service.contentView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view":service.contentView}]];
    
//    [service.view.layout setLayout_marginTop:@"@id:XLayout_ROOT_VIEW"];
//    [service.view.layout setLayout_marginBottom:@"@id:XLayout_ROOT_VIEW"];
//    [service.view.layout setLayout_marginLeft:@"@id:XLayout_ROOT_VIEW"];
//    [service.view.layout setLayout_marginRight:@"@id:XLayout_ROOT_VIEW"];
    
    [self setViewService:service];
}

@end