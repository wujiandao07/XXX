//
//  ToastView.m
//  XHY_SmartLife
//
//  Created by lulin on 15-4-20.
//  Copyright (c) 2015年 XingHuoYuan. All rights reserved.
//

#import "ToastView.h"

@implementation ToastView
- (void)drawRect:(CGRect)rect{
    CGContextRef context=UIGraphicsGetCurrentContext();
    float fw=rect.size.width;
    float fh=rect.size.height;
    float r=6.0f;
    CGContextMoveToPoint(context, fw, fh/2);
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, r);
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, r);
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, r);
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, r);
    CGContextClosePath(context);
    CGFloat gray[4]={0,0,0,0.7f};
    CGContextSetFillColor(context, gray);
    CGContextFillPath(context);
    [[UIColor whiteColor] set];
    [_string drawInRect:CGRectMake(5, 5, rect.size.width-10, rect.size.height-10) withFont:[UIFont systemFontOfSize:14] lineBreakMode:NSLineBreakByCharWrapping alignment:NSTextAlignmentCenter];
    
    
    
    //string drawInRect:CGRectMake(5, 5, rect.size.width-10, rect.size.height-10) withAttributes:[NSDictionary dic]
//    NSDictionary *font=[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], NSFontAttributeName , nil];
//    NSDictionary *model=[NSDictionary dictionaryWithObjectsAndKeys:[],NSLineBreakByCharWrapping, nil];
    
}

- (void)showInSuperView:(UIView*)superView{
    timer=[NSTimer scheduledTimerWithTimeInterval:self.timeout target:self selector:@selector(timeOut) userInfo:Nil repeats:NO];
}
- (void)timeOut{
    [self performSelectorOnMainThread:@selector(hide) withObject:nil waitUntilDone:NO];
}
- (void)hide{
    [UIView beginAnimations:nil context:Nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(finishedAnimation)];
}
- (void)finishedAnimation{
    
    [self removeFromSuperview];
}
@end
