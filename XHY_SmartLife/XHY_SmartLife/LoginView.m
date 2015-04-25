//
//  LoginView.m
//  XHY_SmartLife
//
//  Created by lulin on 15-4-17.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import "LoginView.h"
#import "C++.h"
#define WINDTH  [UIScreen mainScreen].bounds.size.width
@implementation LoginView{
    UITextField *userName;
    UITextField *userPassWord;
}
int getYear()
{
    return 2015;
}


- (id)init{
    self=[super init];
    if(self){
        self.frame=[UIScreen mainScreen].bounds;
        [self setUpInput];
        [self setUpLoginButton];
    }
    return  self;
}
- (void)setUpInput{
    
    userName=[[UITextField alloc]init];
    userName.frame=CGRectMake(20, 100, WINDTH-40, 40);
    userName.borderStyle=UITextBorderStyleRoundedRect;
    userName.delegate=self;
    userName.placeholder=@"账号";
    userName.clearButtonMode=UITextFieldViewModeAlways;
    [self addSubview:userName];
    
    NSLog(@"year===___%d",getYear());
    
    userPassWord=[[UITextField alloc]init];
    CGRect rect=userName.frame;
    userPassWord.frame=CGRectMake(rect.origin.x,rect.origin.y+rect.size.height+15 , WINDTH-40, 40);
    userPassWord.borderStyle=UITextBorderStyleRoundedRect;
    userPassWord.clearButtonMode=UITextFieldViewModeAlways;
    userPassWord.delegate=self;
    userPassWord.placeholder=@"密码";

    [self addSubview:userPassWord];
    
}
- (void)setUpLoginButton{
    
    CGRect rect=userPassWord.frame;
    
    UIButton *loginBt=[UIButton buttonWithType:UIButtonTypeCustom];
    loginBt.layer.borderWidth=2;
    loginBt.layer.borderColor=(__bridge CGColorRef)([UIColor clearColor]);
    loginBt.layer.cornerRadius=5;
    [loginBt setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBt setBackgroundColor:[UIColor greenColor]];
    [loginBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginBt.frame=CGRectMake(20, rect.origin.y+rect.size.height+25, WINDTH-40, 45);
    [self addSubview:loginBt];
    [loginBt addTarget:self action:@selector(loginWithName:andPassWord:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)loginWithName:(NSString *)name andPassWord:(NSString *)passWord{
    
    NSString *_name=[userName.text stringByReplacingOccurrencesOfString:@" " withString:@""];
     NSString *_passWord=[userPassWord.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(_name==nil || _passWord==nil){
        
    }
    if(_name == nil ||_name.length<=0 || _passWord == nil || _passWord.length<=0){
        
    }
    self.hidden=YES;
   // [self removeFromSuperview];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == userPassWord){
        
        [userPassWord resignFirstResponder];
    }else{
        
        [userName resignFirstResponder];
    }
    return YES;
}
@end
