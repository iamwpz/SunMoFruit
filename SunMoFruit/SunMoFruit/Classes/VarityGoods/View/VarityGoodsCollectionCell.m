//
//  VarityGoodsCollectionCell.m
//  SunMoFruit
//
//  Created by 猎人 on 16/5/7.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import "VarityGoodsCollectionCell.h"
#import "SMVarityGoodsModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface  VarityGoodsCollectionCell()

@property (weak, nonatomic) IBOutlet UIImageView *vgImage;

@property (weak, nonatomic) IBOutlet UILabel *vgName;

@property (weak, nonatomic) IBOutlet UILabel *vgPrice;

@property (weak, nonatomic) IBOutlet UILabel *youhuiLabel;

@end

@implementation VarityGoodsCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"VarityGoodsCollectionCell" owner:nil options:nil]lastObject];
    }
    return self;
    
}

- (void)setVgModel:(SMVarityGoodsModel *)vgModel {
    _vgModel = vgModel;
    
    NSString *urlString = @"http://www.lcoding.cn/GD/";
    
    urlString = [urlString stringByAppendingString:_vgModel.goodsPath];
    NSLog(@"%@",urlString);
    // 设置水果图片
    [self.vgImage sd_setImageWithURL:[NSURL URLWithString:urlString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [[SDImageCache sharedImageCache] storeImage:image forKey:[NSString stringWithFormat:@"%d",_vgModel.nutId]  toDisk:YES];
    }];
    
    self.vgPrice.text = [NSString stringWithFormat:@"¥ %.2lf/份",_vgModel.nutPrice];
    self.youhuiLabel.text = _vgModel.discountDescribe;
    self.vgName.text = _vgModel.goodsName;

}


@end
