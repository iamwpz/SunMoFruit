//
//  SMRoastingCollectionView.m
//  SunMoFruit
//
//  Created by 猎人 on 16/5/7.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import "SMRoastingCollectionView.h"
#import "VarityGoodsCollectionCell.h"
#import <MJExtension.h>
#import <AFNetworking.h>
#import "SMVarityGoodsModel.h"
#import "SMVarityGoodsVC.h"


@interface SMRoastingCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation SMRoastingCollectionView
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
    
    self.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:222.0/255.0 blue:238.0/255.0 alpha:1.0];
    // 从服务器请求果兜优选所有数据
    [self getDataFromServer];
    
    [self registerClass:[VarityGoodsCollectionCell class] forCellWithReuseIdentifier:@"SMVarityGoodsRoastingID"];
    
  }
// 从网络中请求果兜优选所有数据
- (void)getDataFromServer{
    
    NSString *urlString = @"http://lcoding.cn/GD/object.action?action=nutInfo";
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html", nil]];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _roastingArrayM = [SMVarityGoodsModel mj_objectArrayWithKeyValuesArray:responseObject context:nil];
        
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
    NSLog(@"%ld",self.roastingArrayM.count);
    return self.roastingArrayM.count;
}

// 每一个item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    VarityGoodsCollectionCell *cell = (VarityGoodsCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"SMVarityGoodsRoastingID" forIndexPath:indexPath];
    cell.vgModel = self.roastingArrayM[indexPath.item];
    return cell;
}



// 懒加载
- (NSMutableArray *)roastingArrayM {
    if (_roastingArrayM == nil) {
        _roastingArrayM = [NSMutableArray array];
    }
    return _roastingArrayM;
}
@end
