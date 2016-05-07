//
//  SMHomeVC.m
//  SunMoFruit
//
//  Created by 猎人 on 16/1/6.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import "SMHomeVC.h"
#import "GRBHomeHeadPageView.h"
#import "SMGDYouXuanCollectionView.h"
#import <AFHTTPSessionManager.h>
#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

@interface SMHomeVC ()<UITableViewDelegate>
// 校区Label
@property (weak, nonatomic) IBOutlet UILabel *location;

// 顶部广告轮播视图
@property (weak, nonatomic) IBOutlet UIView *topScrollView;

@property (weak, nonatomic) IBOutlet UIView *gdyxContentView;

@property (weak, nonatomic) IBOutlet SMGDYouXuanCollectionView *YouXuanColletionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@end

@implementation SMHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置顶部广告视图
    [self setUpScrollView];
        
    self.tableView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - 设置顶部广告视图轮播器
- (void)setUpScrollView{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html", nil]];
    // 顶部广告图片接口
    NSString *urlString = @"http://www.lcoding.cn/GD/object.action?action=Messages";
        [session GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSMutableArray *arrayM = [NSMutableArray array];

            // 遍历数据，得到图片的URL
            [responseObject enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NSString *urlString = obj[@"messagesPath"];
                urlString = [@"http://www.lcoding.cn/GD/" stringByAppendingString:urlString];
                
                [arrayM addObject:urlString];
                
            }];
            
            // 回到主线程更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                // 初始化图片轮播器
                GRBHomeHeadPageView *scrollView = [GRBHomeHeadPageView pageViewWithFrame:CGRectMake(0, 0, KScreenW - 10, 190)];
                scrollView.urlArray = arrayM;
                
                // 将图片轮播器加到相应位置
                [self.topScrollView addSubview: scrollView];

            });
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请求顶部广告图片失败%@",error);
        }];
    
}

#pragma mark - 设置tableCell 的行高
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        return 190;
    }
    if (indexPath.row == 1) {
        return 10;
    }
    if (indexPath.row == 2) {
        return 100;
    }
    if (indexPath.row == 3) {
        return 30;
    }
    
    return (self.layout.itemSize.height + 10) * 10;

}




@end
