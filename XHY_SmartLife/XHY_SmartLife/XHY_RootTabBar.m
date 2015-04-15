//
//  XHY_RootTabBar.m
//  XHY_SmartLife
//
//  Created by king on 15-4-4.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import "XHY_RootTabBar.h"
#import "MessageController.h"
#import "DeviceController.h"
#import "SituationController.h"
#import "SettingController.h"

#define  HEIGHT    [UIScreen mainScreen].bounds.size.height
#define  Width     [UIScreen mainScreen].bounds.size.width

//@interface XHYTabbarItem : UITabBarItem
//
//@end
//@implementation XHYTabbarItem
//+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
//{
//    
//    UITabBarItem *tabBarItem = nil;
//    
//    if ([[UIDevice currentDevice]systemVersion].floatValue >=7) {
//        
//        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];  //这两个地方一定要加上
//        
//        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        
//      
//        
//    }
//    tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
//    
//    [tabBarItem setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
//   // tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:nsfor, nil] forState:<#(UIControlState)#>
//    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"AmericanTypewriter" size:20.0f],nil] forState:UIControlStateNormal];
//    return tabBarItem;
//    
//}
//@end
@interface XHY_RootTabBar ()

@end
@implementation XHY_RootTabBar
{
  //  UIView *viewForBar;
//    UIButton *   firstBt;
//    UIButton *   secBt;
//    UIButton *   thrBt;
//    UIButton *   fourBt;
    
    NSMutableArray *tabBaritemArray;
    UIScrollView   *baseHomeScroll;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate=self;
        MessageController *first=[[MessageController alloc]init];
    first.title=@"消息";
    UINavigationController * naviFirst=[[UINavigationController alloc]initWithRootViewController:first];
    
   
    
    DeviceController *second=[[DeviceController alloc]init];
    //second.title=@"设备";
    
    UINavigationController * naviSec=[[UINavigationController alloc]initWithRootViewController:second];
    naviSec.title=@"设备";
    
    SituationController *three=[[SituationController alloc]init];
   // three.tabBarItem.title=@"情景";
    UINavigationController *naviThree=[[UINavigationController alloc]initWithRootViewController:three];
    naviThree.title=@"情景";
    
    SettingController *four=[[SettingController alloc]init];
    UINavigationController *naviFour=[[UINavigationController alloc]initWithRootViewController:four];
    four.title=@"设置";
    //naviFour.tabBarItem.title=@"设置";
   
    UITabBarItem *item0=[[UITabBarItem alloc]initWithTitle:@"消息" image:[UIImage imageNamed:@"tab_main_message_unchecked"] selectedImage:[UIImage imageNamed:@"tab_main_message_checked"]];

   // [item0 setImageInsets:UIEdgeInsetsMake(6, 0, 10, 0)];
    
   
    naviFirst.tabBarItem=item0;
    
   
    
    
    UITabBarItem *item1=[[UITabBarItem alloc]initWithTitle:@"设备" image:[UIImage imageNamed:@"tab_main_device_unchecked"] selectedImage:[UIImage imageNamed:@"tab_main_device_checked"]];
    naviSec.tabBarItem=item1;
    
    UITabBarItem *item2=[[UITabBarItem alloc]initWithTitle:@"情景" image:[UIImage imageNamed:@"tab_main_scence_unchecked"] selectedImage:[UIImage imageNamed:@"tab_main_scence_checked"]];
    naviThree.tabBarItem=item2;
    
    UITabBarItem *item3=[[UITabBarItem alloc]initWithTitle:@"设置" image:[UIImage imageNamed:@"tab_main_settings_unchecked"] selectedImage:[UIImage imageNamed:@"tab_main_settings_checked"]];

    naviFour.tabBarItem=item3;
    
    tabBaritemArray =[NSMutableArray array];
    [tabBaritemArray addObject:item0];
    [tabBaritemArray addObject:item1];
    [tabBaritemArray addObject:item2];
    [tabBaritemArray addObject:item3];
    
    self.viewControllers=@[naviFirst ,naviSec,naviThree,naviFour];
    

     [self getTabbar];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(orientationChange) name:UIDeviceOrientationDidChangeNotification object:nil];

}
- (void)getTabbar
{
    self.tabBar.hidden=YES;
    NSInteger selectedIndex=0;//选中的按钮，用于自定义的tabbar按钮
    
    if(_customTabBar){
        selectedIndex=self.selectedIndex;
        [_customTabBar removeFromSuperview];
        _customTabBar=nil;
    }
    
    _customTabBar=[[TabBarView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.89, Width, HEIGHT*0.11)];
    
   // _customTabBar=[[TabBarView alloc]init];
    _customTabBar.backgroundColor=[UIColor grayColor];
    _customTabBar.delegate=self;
    [self.view addSubview:_customTabBar];
    [self addNSLayoutConstraintOnTabbar];
    [_customTabBar addTabBarButtonfromArray:tabBaritemArray];
    [_customTabBar selectedIndex:selectedIndex];
   // _customTabBar.markIndex=selectedIndex;
    

//    UIUserInterfaceIdiom userIdiom= [UIDevice currentDevice].userInterfaceIdiom ;
//    if(userIdiom == UIUserInterfaceIdiomPad){
//    viewForBar.autoresizingMask=UIViewAutoresizingFlexibleRightMargin|
//                                UIViewAutoresizingFlexibleWidth|
//                                UIViewAutoresizingFlexibleBottomMargin|
//                                UIViewAutoresizingFlexibleTopMargin|
//                                UIViewAutoresizingFlexibleHeight;
//    }
}

#pragma mark--
#pragma mark 添加约束
- (void)addNSLayoutConstraintOnTabbar{
    
    _customTabBar.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *tableConstraint6=[NSLayoutConstraint constraintWithItem:_customTabBar attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint *tableConstraint5=[NSLayoutConstraint constraintWithItem:_customTabBar attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    NSLayoutConstraint *tableConstraint4=[NSLayoutConstraint constraintWithItem:_customTabBar attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    NSLayoutConstraint *tableConstraint3=[NSLayoutConstraint constraintWithItem:_customTabBar attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    
    NSLayoutConstraint *tableConstraint2=[NSLayoutConstraint constraintWithItem:_customTabBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.11 constant:0];
    
    [self.view addConstraint:tableConstraint6];
    [self.view addConstraint:tableConstraint5];
    [self.view addConstraint:tableConstraint4];
    [self.view addConstraint:tableConstraint3];
    [self.view addConstraint:tableConstraint2];

}

#pragma mark --
#pragma mark CustomTabDelegate
- (void)touchUPInsideAtItemIndex:(NSInteger)ItemIndex{
    
    if(ItemIndex != self.selectedIndex)
    self.selectedIndex=ItemIndex;
}

- (void)viewWillAppear:(BOOL)animated{
    
    
}
- (void)viewWillDisappear:(BOOL)animated{
    
}

-(void)orientationChange{
    [self getTabbar];
}

#pragma mark--
#pragma mark  tabBarController代理函数，由于自身的tabbar被隐藏，所以不会调用
-(void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed{
    NSLog(@"willENd");
}
-(void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers{
    NSLog(@"willBegin");
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did");
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
