//
//  UIViewController+XMLayoutExtension.m
//  XMLayout
//
//  Created by admin on 16/4/27.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UIViewController+XMLayout.h"

#import <objc/runtime.h>

#import "XMLViewService.h"
#import "UIView+XMLayout.h"

@implementation UIViewController (XMLayout)

- (void)setViewService:(XMLViewService *)viewService {
    
    objc_setAssociatedObject(self, @selector(viewService), viewService, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (XMLViewService *)viewService {
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)loadViewFromXML:(id/* NSURL or XML file name */)XML {
    
    XMLViewService *service = [XMLViewService serviceFromXML:XML];
    
    [self.view addSubview:service.contentView];
    [self.view setLayout_id:XMLAYOUT_ROOT_VIEW_ID];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:nil views:@{@"view":service.contentView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view":service.contentView}]];
    
//    [service.view.layout setLayout_marginTop:@"@id:XMLAYOUT_ROOT_VIEW"];
//    [service.view.layout setLayout_marginBottom:@"@id:XMLAYOUT_ROOT_VIEW"];
//    [service.view.layout setLayout_marginLeft:@"@id:XMLAYOUT_ROOT_VIEW"];
//    [service.view.layout setLayout_marginRight:@"@id:XMLAYOUT_ROOT_VIEW"];
    
    [self setViewService:service];
}

@end
