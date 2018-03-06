//
//  ViewController.m
//  YSHNavigation
//
//  Created by 赵 on 2018/3/5.
//  Copyright © 2018年 袁书辉. All rights reserved.
//


#import "SNYGRefreshHeader.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.isHiddenNav = NO;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.tableView.mj_header= [SNYGRefreshHeader headerWithRefreshingBlock:^{
        NSLog(@"==============");
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
            NSLog(@"%@", [NSThread currentThread]);
            
        });
        
    }];
    
    
    //    背景图片 750*1334
//    UIImageView * imageView = [UIImageView new];
//    CGFloat h = SCREEN_WIDTH*1334/750.f;
//    imageView.bounds = CGRectMake(0, 0,SCREEN_WIDTH, h);
//    imageView.mj_x =0 ;
//    imageView.mj_y = -h;
//    imageView.image = [UIImage imageNamed:@"refreshHeadBack"];
//    [self.tableView addSubview:imageView];
    
    [self.tableView bringSubviewToFront:self.tableView.mj_header];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
