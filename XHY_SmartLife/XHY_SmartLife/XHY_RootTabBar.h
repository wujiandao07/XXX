//
//  XHY_RootTabBar.h
//  XHY_SmartLife
//
//  Created by king on 15-4-4.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarView.h"
//@protocol OrientationChangeDelegate <NSObject>
//
//- (void)orientationChangeAtItem:(NSInteger)number;
//
//@end


@interface XHY_RootTabBar : UITabBarController<CustomTabDelegate,UITabBarControllerDelegate>{
    TabBarView *_customTabBar;
    
}
@property(nonatomic,retain)TabBarView *customTabBar;
//@property(nonatomic,weak)id<OrientationChangeDelegate> changeDelegate;
@end
