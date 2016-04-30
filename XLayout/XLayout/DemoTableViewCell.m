//
//  DemoTableViewCell.m
//  XLayout
//
//  Created by admin on 16/4/30.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "DemoTableViewCell.h"
#import "UITableViewCell+XLayout.h"
#import "XLayoutViewService.h"

@implementation DemoTableViewCell

#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadViewFromXMLName:@"table_view_cell"];
    }
    return self;
}

#pragma mark - Event

- (void)onClick {
    
}

#pragma mark - Getter

- (UILabel *)label {
    return self.viewService.viewById(@"label");
}

@end
