//
//  SMNavController.m
//  SunMoFruit
//
//  Created by 猎人 on 16/1/6.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import "SMNavController.h"
#import "UIImage+Ex.h"

@interface SMNavController ()

@end

@implementation SMNavController

//当这个类,在第一次使用之前(调用此类的第一个方法执行) 会执行,并且只会执行一次
+ (void)initialize {
    //统一 设置导航条的样式
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundColor:[UIColor colorWithRed:59.0/255 green:147.0/255 blue:50.0/255 alpha:1.0]];
    
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //    NSLog(@"initialize");
    //设置导航条不透明
    navBar.translucent = NO;
    
    //统一设置item的样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    NSLog(@"viewDidLoad");
    
}
//后退
- (void)backClick {
    [self popViewControllerAnimated:YES];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //1 自定义后退按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage originalImage:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    
    
    UIBarButtonItem *fixed = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixed.width = -10;
    
    viewController.navigationItem.leftBarButtonItems = @[fixed,backItem];
    
    //隐藏tabBAr
    viewController.hidesBottomBarWhenPushed = YES;
    
    //恢复手势后退
    self.interactivePopGestureRecognizer.delegate = nil;
    
    [super pushViewController:viewController animated:animated];
}


@end