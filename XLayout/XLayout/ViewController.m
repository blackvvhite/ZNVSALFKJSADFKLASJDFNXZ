//
//  ViewController.m
//  XLayout
//
//  Created by bateng on 16/4/28.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "ViewController.h"

#import "XLayout.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadViewFromXML:@"Base"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.viewService.viewWithLayoutId(@"quote_view") setBackgroundColor:[UIColor blueColor]];
        
    });
    
    [self.viewService.viewWithLayoutId(@"tableView") registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate


/*- (NSArray *)relativeLayoutProperties {
    static NSArray *propertie = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        u_int count;
        objc_property_t *properties = class_copyPropertyList([XLayoutBase class], &count);
        
        if (count == 0) {
            propertie = @[];
        }
        
        NSMutableArray *tempPropertie = [[NSMutableArray alloc] initWithCapacity:count];
        for (int i = 0; i < count; i++) {
            [tempPropertie addObject:[NSString stringWithUTF8String:property_getName(properties[i])]];
        }
        free(properties);
        
        propertie = tempPropertie;
    });
    return propertie;
}*/

@end
