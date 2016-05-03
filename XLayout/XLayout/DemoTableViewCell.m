//
//  DemoTableViewCell.m
//  XLayout
//
//  Created by B&W on 16/4/30.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "DemoTableViewCell.h"
#import "UITableViewCell+XLayout.h"
#import "XLayoutViewService.h"

@implementation DemoTableViewCell

#pragma mark - Init

XLAYOUT_TABLE_VIEW_CELL_FROM_XML_NAME(@"table_view_cell")

#pragma mark - Event

- (void)onClick {
    
}

#pragma mark - Getter

- (UILabel *)label {
    return self.viewService.getViewById(@"label");
}

@end
