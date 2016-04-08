//
//  SMTabBarController.m
//  SunMoFruit
//
//  Created by 猎人 on 16/1/5.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import "SMTabBarController.h"

@interface SMTabBarController ()

@end

@implementation SMTabBarController

- (void)viewDidLoad {
    
    
    
    
    [super viewDidLoad];

    [self setupItem];
    
    [self addChildControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildControllers {
    
    
    [self setupChildVc:nil storyBoard:@"Home" title:@"果兜" image:@"home_normal" selectedImage:@"home_selected"];
    
    [self setupChildVc:nil storyBoard:@"VarityGoods" title:@"小吃包" image:@"varity_goods_normal" selectedImage:@"varity_goods_selected"];
    
    [self setupChildVc:nil storyBoard:@"ShoppingCart" title:@"购物车" image:@"shoppingcart_normal" selectedImage:@"shoppingcart_selected"];
    
    [self setupChildVc:nil storyBoard:@"PersonCenter" title:@"我的" image:@"personcenter_normal" selectedImage:@"personcenter_selected"];
    
}


/**
 * 设置控制器
 * @param title 文字
 * @param image 图片
 * @param selectedImage 选中时的图片
 */
- (void)setupChildVc:(UIViewController *)vc storyBoard:(NSString *)name title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{

    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    // 获取每个storyboard中当前导航控制器
    UINavigationController *navC = [sb instantiateInitialViewController];
    
    [self addChildViewController:navC];
    // 设置子控制器的tabBarItem
    navC.tabBarItem.title = title;
    navC.tabBarItem.image = [UIImage imageNamed:image];
    [navC.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
}

/**
 * 设置item属性
 */
- (void)setupItem
{
    // UIControlStateNormal状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    // 文字颜色
    normalAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    // 文字大小
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    // UIControlStateSelected状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    // 文字颜色
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:59.0/250 green:147.0/250 blue:50.0/250 alpha:1.0];
    
    // 统一给所有的UITabBarItem设置文字属性
    // 只有后面带有UI_APPEARANCE_SELECTOR的属性或方法, 才可以通过appearance对象来统一设置
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

@end
