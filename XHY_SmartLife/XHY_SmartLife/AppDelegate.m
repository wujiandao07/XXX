//
//  AppDelegate.m
//  XHY_SmartLife
//
//  Created by king on 15-4-4.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import "AppDelegate.h"
#import "MessageController.h"
#import "DeviceController.h"
#import "SituationController.h"
#import "SettingController.h"

#import "XHY_RootTabBar.h"

#define  HEIGHT    [UIScreen mainScreen].bounds.size.height
#define  Width     [UIScreen mainScreen].bounds.size.width

@interface AppDelegate (){
    UITabBarController *  tabBarCr;
    UIView * viewFortabBar;
    NSMutableArray *itemArray;
    
}

@end

@implementation AppDelegate

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    UIUserInterfaceIdiom   currentDevice= [UIDevice currentDevice].userInterfaceIdiom;
//    if( currentDevice==UIUserInterfaceIdiomPad){
//        return  YES;
//    }else{
//        
//        if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft) {
//            //zuo
//            return NO;
//        }
//        if (interfaceOrientation==UIInterfaceOrientationLandscapeRight) {
//            //you
//            return NO;
//        }
//        if ((interfaceOrientation==UIInterfaceOrientationPortrait)||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown) {
//            //shang
//            return YES;
//        }
//        if (interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown) {
//            return NO;
//        }
//    }
//    
//    return NO;
//}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [UIDevice currentDevice];
//    NSString *size=NSStringFromCGSize([UIScreen mainScreen].bounds.size);
//    XHY_RootTabBar *tabBar=[[XHY_RootTabBar alloc]init];
    MessageController *first=[[MessageController alloc]init];
    // first.tabBarItem.title=@"消息";
    
    
    UINavigationController * naviFirst=[[UINavigationController alloc]initWithRootViewController:first];
    
    // naviFirst.tabBarItem.title=@"消息";
    naviFirst.title=@"消息";
    
    DeviceController *second=[[DeviceController alloc]init];
    // second.tabBarItem.title=@"设备";
    
    UINavigationController * naviSec=[[UINavigationController alloc]initWithRootViewController:second];
     naviSec.title=@"设备";
    
    SituationController *three=[[SituationController alloc]init];
    // three.tabBarItem.title=@"情景";
    UINavigationController *naviThree=[[UINavigationController alloc]initWithRootViewController:three];
    naviThree.title=@"情景";
    
    SettingController *four=[[SettingController alloc]init];
    UINavigationController *naviFour=[[UINavigationController alloc]initWithRootViewController:four];
    //four.tabBarItem.title=@"设置";
    naviFour.title=@"设置";
    
    tabBarCr=[[UITabBarController alloc]init];
    
    XHY_RootTabBar *rootTabBar=[[XHY_RootTabBar alloc]init];
//    rootTabBar.itemImage=[self getAllTabBarImageArray];
   //rootTabBar.viewControllers=@[naviFirst,naviSec,naviThree,naviFour];
    
    tabBarCr.viewControllers=@[naviFirst,naviSec,naviThree,naviFour];
//    UIViewController *vi=[[UIViewController alloc]init];
//    UIViewController *v2=[[UIViewController alloc]init];
//    tabBarCr.viewControllers=@[vi,v2];
    self.window.rootViewController=rootTabBar;
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    itemArray=[NSMutableArray array];
//    [self overWriteTabbar];
    
    _loginView=[[LoginView alloc]init];
    _loginView.backgroundColor=[UIColor whiteColor];
    [self.window addSubview:_loginView];
    
    return YES;
    
}
//- (NSMutableArray *)getAllTabBarImageArray{
//    NSArray *imageName=@[@"tab_main_message_unchecked",
//                         @"tab_main_device_unchecked",
//                         @"tab_main_scence_unchecked",
//                         @"tab_main_settings_unchecked"];
//    
//    NSArray *selectedImageName=@[@"tab_main_message_checked",
//                                 @"tab_main_device_checked",
//                                 @"tab_main_scence_checked",
//                                 @"tab_main_settings_checked"];
//    
//    NSMutableArray *tempArray=[NSMutableArray array];
//    for(int  i=0; i<imageName.count;i++){
//        NSMutableDictionary *tempDic=[NSMutableDictionary dictionary];
//        [tempDic setObject:[UIImage imageNamed:imageName[i]] forKey:@"image"];
//        [tempDic setObject:[UIImage imageNamed:selectedImageName[i]] forKey:@"selectedImage"];
//        [tempArray addObject:tempDic];
//    }
//    return tempArray;
//}
//
//- (void)overWriteTabbar{
//    
//    tabBarCr.tabBar.hidden=YES;
//    
//    NSMutableArray *temp=[self getAllTabBarImageArray];
//    viewFortabBar=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-60, Width, 60)];
//    viewFortabBar.backgroundColor=[UIColor grayColor];
//    [tabBarCr.view addSubview:viewFortabBar];
//    CGFloat itemWidth=Width/4;
//    for(int i=0;i<4;i++){
//        UIButton *itemButton=[UIButton buttonWithType:UIButtonTypeCustom];
//        itemButton.frame=CGRectMake(itemWidth*i, 0, itemWidth, 50);
//        NSDictionary *dic=temp[i];
//        [itemButton setImage:dic[@"image"] forState:UIControlStateNormal];
//        [itemButton setImage:dic[@"selectedImage"] forState:UIControlStateSelected];
//        itemButton.tag=i;
//        [itemButton addTarget:self action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
//        [viewFortabBar addSubview:itemButton];
//        [itemArray addObject:itemButton];
//    }
//    
//}
//
//- (void)touch:(UIButton *)sender{
//    [itemArray enumerateObjectsUsingBlock:^(UIButton *itemButton, NSUInteger idx, BOOL *stop) {
//        if(sender == itemButton){
//            itemButton.selected=YES;
//            tabBarCr.selectedIndex=sender.tag;
//           // *stop=YES;
//        }else{
//            itemButton.selected=NO;
//        }
//    }];
//}
//

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
