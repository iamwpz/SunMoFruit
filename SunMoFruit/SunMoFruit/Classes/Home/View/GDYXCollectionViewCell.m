//
//  GDYXCollectionViewCell.m
//  SunMoFruit
//
//  Created by 猎人 on 16/1/19.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import "GDYXCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface GDYXCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *fruitName;

@property (weak, nonatomic) IBOutlet UIImageView *fruitPicture;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *youhuiLabel;

@end
@implementation GDYXCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"GDYXCollectionViewCell" owner:nil options:nil]lastObject];
    }
    return self;
    
}


- (void)setGdyxModel:(SMYouXuanModel *)gdyxModel {
    _gdyxModel = gdyxModel;
    
    // 根URL
    NSString *urlString = @"http://www.lcoding.cn/GD/";
    
    urlString = [urlString stringByAppendingString:_gdyxModel.goodsPath];
    NSLog(@"%@",urlString);
        // 设置水果图片
        [self.fruitPicture sd_setImageWithURL:[NSURL URLWithString:urlString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

            [[SDImageCache sharedImageCache] storeImage:image forKey:[NSString stringWithFormat:@"%d",gdyxModel.fruitsId]  toDisk:YES];
    }];
    
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %.2lf/份",_gdyxModel.fruitsPrice];
    self.youhuiLabel.text = _gdyxModel.discountDescribe;
    self.fruitName.text = _gdyxModel.goodsName;
    
    
}
@end
