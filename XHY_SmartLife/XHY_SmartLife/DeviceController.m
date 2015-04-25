//
//  SecondViewController.m
//  XHY_SmartLife
//
//  Created by king on 15-4-4.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import "DeviceController.h"
#define X_space      10
#define Y_space      15
#define WIDTH       [UIScreen  mainScreen].bounds.size.width
//#define HEIGHT      100
@interface DeviceController (){
     CGFloat fixedheight;
    NSInteger   count;
    NSArray *deviceControlItem;
    NSArray *imageNmaeArray;
    UIUserInterfaceIdiom userIdiom;  //判断设备
    UIDeviceOrientation orientation; //旋转方向
    UIScrollView *inBedScrollview;
    BOOL isFirstStart;
}
@end

@implementation DeviceController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title=@"设备分类";
    fixedheight=  self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height;
    
    self.navigationController.navigationBar.translucent=NO;
    
    
    UIButton *rignt=[UIButton buttonWithType:UIButtonTypeCustom];
    [rignt setTitle:@"设备列表" forState:UIControlStateNormal];
    
    [rignt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    rignt.titleLabel.font=[UIFont systemFontOfSize:15];
    rignt.frame=CGRectMake(0, 0, 60, 40);
    [rignt addTarget:self action:@selector(rightBarButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rignt];
    
    
    self.navigationItem.rightBarButtonItem=rightItem;
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(orientationChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    [self getItemAndImageArray];
    
    count=3;
    orientation=  [UIDevice currentDevice].orientation;
     userIdiom= [UIDevice currentDevice].userInterfaceIdiom ;
    if(userIdiom == UIUserInterfaceIdiomPad  && (orientation == UIDeviceOrientationLandscapeLeft||orientation==UIDeviceOrientationLandscapeRight)){
        count=5;
    }
//    [self getInbedScrollView];
//    [self createDeviceControlWindows];
}

#pragma mark--
#pragma mark 主界面的图标
- (void)getItemAndImageArray{
    
    deviceControlItem=[NSArray arrayWithObjects:@"网络摄像头",
                                @"灯光控制",
                                @"电器控制",
                                @"环境监测",
                                @"智能电视",
                                @"智能窗帘",
                                @"智能门锁",
                                @"智能门磁" ,
                                @"安全监测",
                                @"回收站",nil];
    imageNmaeArray=[NSArray arrayWithObjects:@"device_camera_pressed",
                             @"device_light_control_pressed",
                             @"device_appliance_control_pressed",
                             @"device_environment_monitor_pressed",
                             @"device_environment_monitor_pressed",
                             @"curtain_online",
                             @"device_environment_monitor_pressed",
                             @"device_environment_monitor_pressed",
                             @"device_safe_control_pressed",
                             @"device_trash_pressed",nil];
    

}
- (CGFloat)getTheHeight{
    CGFloat ww= [UIScreen mainScreen].bounds.size.width;
    CGFloat hh= [UIScreen mainScreen].bounds.size.height;
    CGFloat verson=[UIDevice currentDevice].systemVersion.floatValue;
    UIDeviceOrientation currentOrientation=[UIDevice currentDevice].orientation;
    NSLog(@"ww=%f ,,,,,hh=%f",ww,hh);
    
    CGFloat width;
    CGFloat height;
    
    if(verson<8.0){
        if(userIdiom == UIUserInterfaceIdiomPad  && (currentOrientation == UIDeviceOrientationLandscapeLeft||currentOrientation==UIDeviceOrientationLandscapeRight)){
            width=(hh-(count+1)*X_space)/count;
            
        }else {
            width=(WIDTH-(count+1)*X_space)/count;
            //height=width*0.8;
        }
        
    }else{
        
        width=(WIDTH-(count+1)*X_space)/count;
        // height=width*0.8;
    }
    height=width*1.1;
    return  height;
}
- (void)createDeviceControlWindows{
    
    CGFloat ww= [UIScreen mainScreen].bounds.size.width;
    CGFloat hh= [UIScreen mainScreen].bounds.size.height;
    CGFloat verson=[UIDevice currentDevice].systemVersion.floatValue;
    UIDeviceOrientation currentOrientation=[UIDevice currentDevice].orientation;
    NSLog(@"ww=%f ,,,,,hh=%f",ww,hh);
    
    CGFloat width;
    CGFloat height;

    if(verson<8.0){
        if(userIdiom == UIUserInterfaceIdiomPad  && (currentOrientation == UIDeviceOrientationLandscapeLeft||currentOrientation==UIDeviceOrientationLandscapeRight)){
            width=(hh-(count+1)*X_space)/count;
            
        }else {
            width=(WIDTH-(count+1)*X_space)/count;
            //height=width*0.8;
        }

    }else{
        
        width=(WIDTH-(count+1)*X_space)/count;
       // height=width*0.8;
    }
    height=width*1.1;
    
//       CGFloat width= [UIScreen mainScreen].bounds.size.width;
//       CGFloat height= [self getTheHeight];
    
    for(int i=0;i<deviceControlItem.count;i++){
        
        UIView *itemView=[[UIView alloc]init];;
        itemView.frame=CGRectMake(X_space *((i%count)+1)+width * (i%count),(i/count+1)*Y_space + height *(i/count), width, height);
        //itemView.backgroundColor=[UIColor grayColor];
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:imageNmaeArray[i]] forState:UIControlStateNormal];
        //[button setTitle:deviceControlItem[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        button.frame=CGRectMake(10,0,width-20, height*0.7);
        button.tag=i;
       // button.backgroundColor=[UIColor redColor];
        
        UILabel *nameLB=[[UILabel alloc]initWithFrame:CGRectMake(0, height *0.75, width, height*0.25)];
        nameLB.text=deviceControlItem[i];
        nameLB.font=[UIFont systemFontOfSize:height*0.14>16?height*0.14:16];
        nameLB.textAlignment=NSTextAlignmentCenter;
        //nameLB.backgroundColor=[UIColor magentaColor];
        
//        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 20, 30, 20)];
//        [button setTitleEdgeInsets:UIEdgeInsetsMake(50, 0, 0, width-20)];
        [button addTarget:self action:@selector(deviceOfAllKindTouch:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [itemView addSubview:button];
        [itemView addSubview:nameLB];
        
        [inBedScrollview addSubview:itemView];
        
        
    }
    
}

//-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
//    
//    if(self.traitCollection.verticalSizeClass ==  UIUserInterfaceSizeClassCompact){
//        
//    }
//}
- (void)deviceOfAllKindTouch:(UIButton*)sender{
    switch (sender.tag) {
        case 0:
            NSLog(@"click 0");
            break;
        case 1:
            NSLog(@"click 1");
            break;
        case 2:
            NSLog(@"click 2");
            break;
        case 3:
            NSLog(@"click 3");
            break;
        case 4:
            NSLog(@"click 4");
            break;
        case 5:
            NSLog(@"click 5");
            break;
        case 6:
            NSLog(@"click 6");
            break;
        case 7:
            NSLog(@"click 7");
            break;
        case 8:
            NSLog(@"click 8");
            break;
        case 9:
            NSLog(@"click 9");
            break;
        
        default:
            break;
    }
}

- (void)getInbedScrollView{
    
    inBedScrollview=[[UIScrollView alloc]init];
    [self.view addSubview:inBedScrollview];
    
    inBedScrollview.contentOffset=CGPointMake(0, 0);
  //  inBedScrollview.backgroundColor=[UIColor greenColor];
    NSInteger row=deviceControlItem.count%count+deviceControlItem.count/count;
    inBedScrollview.contentInset=UIEdgeInsetsMake(0, 0, [self getTheHeight] *(row+1) +(row+1)*Y_space, 0);
   // inBedScrollview.contentInset=UIEdgeInsetsMake(0, 0, 800, 0);
    inBedScrollview.translatesAutoresizingMaskIntoConstraints=NO;
    inBedScrollview.showsVerticalScrollIndicator=NO;
    NSLayoutConstraint *top=[NSLayoutConstraint constraintWithItem:inBedScrollview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *left=[NSLayoutConstraint constraintWithItem:inBedScrollview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *right=[NSLayoutConstraint constraintWithItem:inBedScrollview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *bottom=[NSLayoutConstraint constraintWithItem:inBedScrollview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    [self.view addConstraint:top];
    [self.view addConstraint:left];
    [self.view addConstraint:right];
    [self.view addConstraint:bottom];
    
    
}
- (void)rightBarButtonTouch{
    NSLog(@"xmpp");
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self getInbedScrollView];
    [self createDeviceControlWindows];
    
//    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(orientationChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

#pragma mark--
#pragma mark 旋转通知
- (void)orientationChange:(NSNotification*)note{
    
    if(  userIdiom != UIUserInterfaceIdiomPad){
        return;
    }
    
    UIDeviceOrientation oriention= [[UIDevice currentDevice]orientation];
    [self removeAllSubViews];
    switch (oriention) {
        case UIDeviceOrientationPortrait:
            count=3;
//            [self getInbedScrollView];
//            [self createDeviceControlWindows];
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            count=3;
//            [self getInbedScrollView];
//            [self createDeviceControlWindows];
            break;
        case UIDeviceOrientationLandscapeLeft:
            count=5;
//           [self getInbedScrollView];
//            [self createDeviceControlWindows];
            break;
        case UIDeviceOrientationLandscapeRight:
            count=5;
//            [self getInbedScrollView];
//            [self createDeviceControlWindows];
            break;
            
        default:
            break;
    }
    [self getInbedScrollView];
    [self createDeviceControlWindows];
}

- (void)removeAllSubViews{
//    NSArray *subViews=self.view.subviews;
//    for(UIView *sub in subViews){
//        
//        [sub removeFromSuperview];
//    }
    
    [inBedScrollview removeFromSuperview];
    inBedScrollview =nil;
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
