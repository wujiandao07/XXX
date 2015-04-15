//
//  TabBarView.m
//  XHY_SmartLife
//
//  Created by lulin on 15-4-11.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import "TabBarView.h"
#import "ImageAndTitleButton.h"

@implementation TabBarView
- (void)layoutSubviews{
    
    [self setUpAllTabBarFrame];
}

- (void)setUpAllTabBarFrame{
    CGFloat x=0.0;
    CGFloat y=0.0;
    NSInteger count=self.tabBarButton.count;
    
    CGFloat w=(self.bounds.size.width- (count+1) * 15)/count;
    CGFloat h=self.bounds.size.height;
    int i=0;
    for(UIView *buttonView in self.tabBarButton){
        x=i*w+(i+1)*15;
        buttonView.frame=CGRectMake(x, y, w, h);
        i++;
    }
}

- (NSMutableArray*)tabBarButton{
    if(_tabBarButton==nil){
        _tabBarButton=[NSMutableArray array];
    }
    return _tabBarButton;
}

- (void)addTabBarButton:(UITabBarItem*)button{
    ImageAndTitleButton *ITButton=[[ImageAndTitleButton alloc]init];
    ITButton.tabBarItem=button;
    ITButton.tag=self.tabBarButton.count;
    [ITButton setTitle:button.title forState:UIControlStateNormal];
    [ITButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [ITButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [ITButton setImage:button.image forState:UIControlStateNormal];
    [ITButton setImage:button.selectedImage forState:UIControlStateSelected];
    [ITButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:ITButton];
    [self.tabBarButton addObject:ITButton];
    
}
- (void)addTabBarButtonfromArray:(NSArray *)itemArray{
    if(itemArray && itemArray.count){
//        __block NSMutableArray *temp=[NSMutableArray array];
        [itemArray enumerateObjectsUsingBlock:^(UITabBarItem *button, NSUInteger idx, BOOL *stop) {
            ImageAndTitleButton *ITButton=[[ImageAndTitleButton alloc]init];
            ITButton.tabBarItem=button;
            ITButton.tag=self.tabBarButton.count;
            [ITButton setTitle:button.title forState:UIControlStateNormal];
            [ITButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
            [ITButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
            UIImage *image=button.image;
            image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            UIImage *selectedImage=button.selectedImage;
            selectedImage=[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [ITButton setImage:image forState:UIControlStateNormal];
            [ITButton setImage:selectedImage forState:UIControlStateSelected];
            [ITButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            ITButton.backgroundColor=[UIColor magentaColor];
            [self addSubview:ITButton];
            [self.tabBarButton addObject:ITButton];
            
        }];
    }
    
}

- (void)btnClick:(ImageAndTitleButton *)sender{
//    if([self.delegate respondsToSelector:@selector(touchUPInsideAtItemIndex:)]){
//        
//    }
  //  if(sender.tag !=self.markIndex){
    [self.delegate touchUPInsideAtItemIndex:sender.tag];
    [self.tabBarButton enumerateObjectsUsingBlock:^(ImageAndTitleButton *button, NSUInteger idx, BOOL *stop) {
        if(sender == button){
            button.selected=YES;
        }else {
            button.selected=NO;
        }
    }];
   // }
}
- (void)selectedIndex:(NSInteger)index{
    
    [self.tabBarButton enumerateObjectsUsingBlock:^(ImageAndTitleButton *button, NSUInteger idx, BOOL *stop) {
        if(index == idx){
            button.selected=YES;
        }else {
            button.selected=NO;
        }
    }];
}

@end
