//
//  ViewController.m
//  XMLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "ViewController.h"

#import "XMLayout.h"

@interface ViewController ()

@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, weak) NSString *string;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *c;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self loadViewFromXML:@"xml"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.viewService.viewWithLayoutId(@"top_left").layout setLayout_marginTop:@"50"];
        [self.viewService.viewWithLayoutId(@"top_left").layout setLayout_marginLeft:@"0"];
        
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];

    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
