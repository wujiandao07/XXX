//
//  ImageAndTitleButton.h
//  XHY_SmartLife
//
//  Created by lulin on 15-4-11.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageAndTitleButton : UIButton
@property(nonatomic,retain)UITabBarItem *tabBarItem;
- (void)setUPFromTabBarItem:(UITabBarItem*)item;
@end
