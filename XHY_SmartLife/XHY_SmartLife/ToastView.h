//
//  ToastView.h
//  XHY_SmartLife
//
//  Created by lulin on 15-4-20.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToastView : UIView
{
   // NSString *_string;
    NSTimer *timer;
   // NSTimeInterval timeout;
}
@property(nonatomic ,assign)NSTimeInterval timeout;
@property(nonatomic,copy)NSString *string;
@end
