//
//  SMGDYouXuanCollectionView.m
//  SunMoFruit
//
//  Created by 猎人 on 16/1/17.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import "SMGDYouXuanCollectionView.h"
#import "SMYouXuanModel.h"
#import "GDYXCollectionViewCell.h"
#import <MJExtension.h>
#import <AFNetworking.h>

@interface SMGDYouXuanCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation SMGDYouXuanCollectionView

- (void)awakeFromNib {
    self.backgroundColor = [UIColor grayColor];
    
    // 取消滚动条
    self.showsHorizontalScrollIndicator = NO;
    
    // 取消弹簧效果
    self.bounces = NO;
    
    // 设置数据源
    self.dataSource = self;
    
    // 设置代理
    self.delegate = self;
    
    // 从服务器请求果兜优选所有数据
    [self getDataFromServer];
    
    // collectionView 添加 cell 需要注册一下 cell
    [self registerClass:[GDYXCollectionViewCell class] forCellWithReuseIdentifier:@"GDYXCollectionViewCell"];

}

// 从网络中请求果兜优选所有数据
- (void)getDataFromServer {
    NSString *urlString = @"http://lcoding.cn/GD/object.action?action=Preference";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html", nil]];

    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _gdyxArrayM = [SMYouXuanModel mj_objectArrayWithKeyValuesArray:responseObject context:nil];
        
        // 回到主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            // 刷新collectionView
            [self reloadData];
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"果兜优选网络请求错误%@",error);
        
    }];
}

#pragma UICollectionViewDataSource
// 每组有多少行数据
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%ld",self.gdyxArrayM.count);
    return self.gdyxArrayM.count;
}

// 每一个item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    GDYXCollectionViewCell *cell = (GDYXCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"GDYXCollectionViewCell" forIndexPath:indexPath];
    cell.gdyxModel = self.gdyxArrayM[indexPath.item];
    return cell;
}

#pragma mark - 懒加载
- (NSMutableArray *)gdyxArrayM {
    if (_gdyxArrayM == nil) {
        _gdyxArrayM = [NSMutableArray array];
    }
    return _gdyxArrayM;
}
@end
