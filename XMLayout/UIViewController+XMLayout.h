//
//  UIViewController+XMLayoutExtension.h
//  XMLayout
//
//  Created by admin on 16/4/27.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XMLViewService;
@interface UIViewController (XMLayout)

@property (nonatomic, strong) XMLViewService *viewService;

- (void)loadViewFromXML:(id/* NSURL or XML file name */)XML;

@end
