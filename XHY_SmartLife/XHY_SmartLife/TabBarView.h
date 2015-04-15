//
//  TabBarView.h
//  XHY_SmartLife
//
//  Created by lulin on 15-4-11.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class XHY_RootTabBar;
@protocol CustomTabDelegate
- (void)touchUPInsideAtItemIndex:(NSInteger)ItemIndex;

@end


@interface TabBarView : UIView
@property(nonatomic,retain)NSMutableArray *tabBarButton;
@property(nonatomic,weak)id<CustomTabDelegate> delegate;
//@property(nonatomic,assign)NSInteger markIndex;

- (void)addTabBarButtonfromArray:(NSArray *)itemArray;
- (void)selectedIndex:(NSInteger)index;
@end
