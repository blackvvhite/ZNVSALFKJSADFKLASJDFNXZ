//
//  ViewController.m
//  XLayout
//
//  Created by bateng on 16/4/28.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "ViewController.h"

#import "XLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadViewFromXML:@"Base"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.viewService.viewWithLayoutId(@"top_left").layout setLayout_top:@"30"];
        
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
        
    });
}

/*
 [:=]{0,1}-{0,1}.{1}\d+.{0,1}\d*[*@]??
 
 [:=]?-?.?\d+.?\d*[*@]?
 
 888
 >=888
 >=888*999
 >=888*999@1000
 
 @id:my_id:888
 @id:my_id:888*999
 @id:my_id:888*999@1000
 
 @id:my_id:>=888
 @id:my_id:>=888*999
 @id:my_id:>=888*999@1000
 
 @id:my_id:>=888@1000
 
 888可能是整数或浮点数，>=可能为<= ,我只需要888字段。
 
 相当于条件是
 
 1.纯数字
 2.在：后面 接下来可以是空 或者 * @中的一个
 3.在=号后面 接下来可以是空 或者 * @中的一个
 4.不要 * @后面的字符
 
 (^[0-9]*.?[0-9]*$)|[:=]?([0-9]*.?[0-9]*)
 
 
 (^[0-9\.]*$)|[:=]{1}([0-9\.]*)
 
 
 

*/

- (void)onClick {
    
    NSLog(@"onClick");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
