//
//  ImageAndTitleButton.m
//  XHY_SmartLife
//
//  Created by lulin on 15-4-11.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import "ImageAndTitleButton.h"

#define IMAGERADIO     0.7
@interface ImageAndTitleButton ()

//@property (weak, nonatomic) BadgeValue *badgeButton;


@end
@implementation ImageAndTitleButton
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        [self setUpButton];
        
    }
    return self;
}

- (void)setUpButton{
    
    self.imageView.contentMode=UIViewContentModeCenter;
    self.imageView.contentMode=UIViewContentModeScaleAspectFit;
    self.clipsToBounds=YES;
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageH = self.bounds.size.height * IMAGERADIO;
    CGFloat imageW = self.bounds.size.width;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    /**
     *  文字的位置
     */
    CGFloat titleY = imageH;
    CGFloat titleX = 0;
    CGFloat titleW = imageW;
    CGFloat titleH = self.bounds.size.height - imageH;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    self.titleLabel.font=[UIFont systemFontOfSize:titleH*0.9];
    /**
     *  提示数字的位置
     */
   // self.badgeButton.frame = CGRectMake(self.frame.size.width - self.badgeButton.frame.size.width - margin, 0, self.badgeButton.frame.size.width, self.badgeButton.frame.size.height);
}
- (void)setUPFromTabBarItem:(UITabBarItem*)item{
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setImage:_tabBarItem.image forState:UIControlStateNormal];
    [self setImage:_tabBarItem.selectedImage forState:UIControlStateSelected];
    [self setTitle:_tabBarItem.title forState:UIControlStateNormal];
    // 设置提醒数字
   // self.badgeButton.badgeValue = self.tabBarItem.badgeValue;

}
- (void)dealloc{
    // TODO ?
    
//    [self.tabBarItem removeObserver:self forKeyPath:@"badgeValue"];
//    [self.tabBarItem removeObserver:self forKeyPath:@"image"];
//    [self.tabBarItem removeObserver:self forKeyPath:@"selectedImage"];
//    [self.tabBarItem removeObserver:self forKeyPath:@"title"];
    
}
//- (XXBBadgeValue *)badgeButton
//{
//    if (_badgeButton == nil) {
//        XXBBadgeValue *badgeButton = [[XXBBadgeValue alloc] init];
//        [self addSubview:badgeButton];
//        _badgeButton = badgeButton;
//    }
//    return  _badgeButton;
//}
@end
