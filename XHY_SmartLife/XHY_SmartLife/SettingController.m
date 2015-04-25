//
//  SettingController.m
//  XHY_SmartLife
//
//  Created by lulin on 15-4-7.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import "SettingController.h"
#import "AppDelegate.h"
#define WIDTH   [UIScreen  mainScreen].bounds.size.width
#define HEIGHT  [UIScreen  mainScreen].bounds.size.height-60

typedef NS_ENUM(NSInteger, SettingStatus) {
    StatusNone=0,
    StatusSwitch,
    StatusTitle
};

@interface SettingCell : UITableViewCell{
    UIImageView *imageView;
    UILabel     *functionLB;
    SettingStatus  myStatus;
    
    UISwitch *slider;
    UILabel  *tipsLB;
    
}
@property(nonatomic,retain)NSMutableDictionary *dic;
- (void)setUpCell:(NSDictionary *)dic;
+ (CGFloat)returnHeightformDic:(NSDictionary *)dic;

@end

@implementation SettingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        imageView =[[UIImageView alloc]initWithFrame:CGRectZero];
        functionLB=[[UILabel alloc]initWithFrame:CGRectZero];
        
        [self.contentView addSubview:imageView];
        [self.contentView addSubview:functionLB];
        
        slider=[[UISwitch alloc]initWithFrame:CGRectZero];
        tipsLB=[[UILabel alloc]initWithFrame:CGRectZero];
        
        
    //self.
    }
    return  self;
}
- (void)setUpCell:(NSDictionary *)dic{
    
    CGFloat height=[SettingCell returnHeightformDic:dic];
    imageView.image=[UIImage imageNamed:dic[@"image"]];
    NSString *special=dic[@"turnState"];
    if(special !=nil && special.length>0){
        
        imageView.frame=CGRectMake(5, 5, 80,height-10);
        functionLB.frame=CGRectMake(90, 5, 100, height-10);
    }else{
        imageView.frame=CGRectMake(5, 5, 60,height-10);
        functionLB.frame=CGRectMake(70, 5, 100, height-10);
    }
    
    
    functionLB.text=dic[@"lable"];
    functionLB.textAlignment=NSTextAlignmentLeft;
    functionLB.font=[UIFont systemFontOfSize:16];
    
    
    NSNumber *num=dic[@"status"];
    NSInteger status=num.intValue;
    switch (status) {
        case 0:
            self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            break;
            
        case 1:
//            self.accessoryType=UITableViewCellAccessoryNone;
//            slider.frame=CGRectMake(WIDTH-80, 15, 80, height-10);
//            slider.translatesAutoresizingMaskIntoConstraints=NO;
//            NSLayoutConstraint *right=[NSLayoutConstraint constraintWithItem:slider attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:10];
//            
//            [self.contentView addSubview:slider];
//            [self.contentView addConstraint:right];
            [self sliderOnView];
            
            break;
        case 2:
            [self tipsOnView];
            break;
            
        default:
            break;
    }
}
- (void)sliderOnView{
    
 

    self.accessoryType=UITableViewCellAccessoryNone;
    
    slider.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSLayoutConstraint *right=[NSLayoutConstraint constraintWithItem:slider attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-25];
    
    
    
    NSLayoutConstraint *top=[NSLayoutConstraint constraintWithItem:slider attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:15];
    
    NSLayoutConstraint *bottom=[NSLayoutConstraint constraintWithItem:slider attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:15];
    [self.contentView addSubview:slider];
    [self.contentView addConstraint:right];
    
    [self.contentView addConstraint:top];
    [self.contentView addConstraint:bottom];
    [self.contentView updateConstraints];
}
- (void)tipsOnView{
    self.accessoryType=UITableViewCellAccessoryNone;
    //tipsLB.frame=CGRectMake(WIDTH-100, 5, 80, height-10);
    tipsLB.textAlignment=NSTextAlignmentCenter;
    tipsLB.font=[UIFont systemFontOfSize:14];
    tipsLB.text=self.dic[@"tips"];
    [self.contentView addSubview:tipsLB];
    
    
    tipsLB.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *right=[NSLayoutConstraint constraintWithItem:tipsLB attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-15];
    
    NSLayoutConstraint *left=[NSLayoutConstraint constraintWithItem:tipsLB attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0];
    
    NSLayoutConstraint *top=[NSLayoutConstraint constraintWithItem:tipsLB attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:-10];
    
    NSLayoutConstraint *bottom=[NSLayoutConstraint constraintWithItem:tipsLB attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    //[self.contentView addSubview:slider];
    [self.contentView addConstraint:right];
    [self.contentView addConstraint:left];
    [self.contentView addConstraint:top];
    [self.contentView addConstraint:bottom];
    [self.contentView updateConstraints];
}
+ (CGFloat)returnHeightformDic:(NSDictionary *)dic{
    NSString *state=  dic[@"turnState"];
    
    
    if(state != nil  &&   state.length>0){
        return 80;
    }else{
        return  60;
    }
}
@end

@interface SettingController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray  *dataSource;
    UITableView *settingTableView;
}

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [UIScreen  mainScreen].bounds.size.height-60-64
    self.title=@"设置";
    
   // settingTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    
    settingTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
   
    settingTableView.delegate=self;
    settingTableView.dataSource=self;
    //settingTableView.backgroundColor=[UIColor magentaColor];
    
    
    //settingTableView.tableFooterView=[[UIView alloc]init];
    settingTableView.backgroundColor=[UIColor clearColor];
    settingTableView.backgroundView=[[UIView alloc]init];
    //settingTableView.autoresizesSubviews=NO;
    settingTableView.translatesAutoresizingMaskIntoConstraints=NO;
    settingTableView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:settingTableView];

    [self getDataSource];
    [self addLayoutConstraint];
    [self getTablefooterView];
    //settingTableView.contentInset=UIEdgeInsetsMake(0, 0, -self.view.bounds.size.height*0.2, 0);
    [self.view updateConstraints];
}

- (void)getDataSource{
    NSMutableDictionary *tempDic0=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"ic_launcher",@"image",
                                   @"智能网关",@"lable",
                                   @"0",@"status",
                                   @"1",@"turnState",
                                   nil];
    NSMutableDictionary *tempDic1=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"settings_sound_alert",@"image",
                                   @"声音提醒",@"lable",
                                   @"1",@"status",
                                   nil];
    NSMutableDictionary *tempDic2=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"settings_vibrate_alert",@"image",
                                   @"震动提醒",@"lable",
                                   @"1",@"status",
                                   nil];
    NSMutableDictionary *tempDic3=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"settings_data_used",@"image",
                                   @"流量统计",@"lable",
                                   @"0",@"status",
                                   nil];
    NSMutableDictionary *tempDic4=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"settings_upgrade_check",@"image",
                                   @"检查更新",@"lable",
                                   @"2",@"status",
                                   @"没有新版本",@"tips",
                                   nil];
    NSMutableDictionary *tempDic5=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"settings_user_manual",@"image",
                                   @"用户手册",@"lable",
                                   @"0",@"status",
                                   nil];
    NSMutableDictionary *tempDic6=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"settings_about_us",@"image",
                                   @"关于",@"lable",
                                   @"0",@"status",
                                   nil];
    
    dataSource=@[@[tempDic0],@[tempDic1,tempDic2],@[tempDic3,tempDic4,tempDic5,tempDic6]];

}
- (void)addLayoutConstraint{
    
    NSLayoutConstraint *tableConstraint2=[NSLayoutConstraint constraintWithItem:settingTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *tableConstraint3=[NSLayoutConstraint constraintWithItem:settingTableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *tableConstraint4=[NSLayoutConstraint constraintWithItem:settingTableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    
    NSLayoutConstraint *tableConstraint5=[NSLayoutConstraint constraintWithItem:settingTableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    
    NSLayoutConstraint *tableConstraint6=[NSLayoutConstraint constraintWithItem:settingTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    settingTableView.contentInset=UIEdgeInsetsMake(0, 0, 60, 0);
    
    //    [self.view addConstraint:tableConstraint];
    //    [self.view addConstraint:tableConstraint1];
        [self.view addConstraint:tableConstraint2];
    [self.view addConstraint:tableConstraint3];
    [self.view addConstraint:tableConstraint4];
    //[self.view addConstraint:tableConstraint5];
    [self.view addConstraint:tableConstraint6];

}

- (void)getTablefooterView{
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor=[UIColor redColor];
    button.layer.cornerRadius=5;
//    button.layer.borderWidth=5;
//    button.contentMode=UIViewContentModeRedraw;
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0.7, 0.7, 0.7, 1 });
//    
//    button.layer.borderColor=colorref;
    //[button setImage:[[self class]  createImageWithColor:[UIColor redColor]]forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"退出" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(quit) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(10, 0, self.view.bounds.size.width-20, 45);
    //settingTableView.tableFooterView=button;
    
    
    UIView *footerView=[[UIView alloc]init];
    footerView.frame=CGRectMake(0, 0, self.view.bounds.size.width, 45);
   // footerView.backgroundColor=[UIColor magentaColor];
    settingTableView.tableFooterView=footerView;
    [footerView addSubview:button];
    
    
    
}
- (void)quit{
    
   AppDelegate *delegate= [UIApplication sharedApplication].delegate;
    delegate.loginView.hidden=NO;
}
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *tempArray=dataSource[section];
    return tempArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identity=@"settingCellIdentity";
    SettingCell *cell=[tableView dequeueReusableCellWithIdentifier:identity];
    
    if(nil == cell){
        cell =[[SettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    NSArray *temp=dataSource[indexPath.section];
    cell.dic=temp[indexPath.row];
    [cell setUpCell:temp[indexPath.row]];
    
    
    return  cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *temp=dataSource[indexPath.section];
    return  [SettingCell returnHeightformDic:temp[indexPath.row]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  nil;
}

@end
