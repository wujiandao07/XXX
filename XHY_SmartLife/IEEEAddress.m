//
//  IEEEAddress.m
//  Java
//
//  Created by lulin on 15-4-16.
//  Copyright (c) 2015年 lulin. All rights reserved.
//

#import "IEEEAddress.h"
//#import <stdio.h>
//#import <stdlib.h>
//#import <standards.h>
//#include <stdlib.h>
#import <CommonCrypto/CommonDigest.h>
@implementation IEEEAddress
+ (long)fromColonNotion:(NSString *)ieee{
    NSArray *sepArray=[ieee componentsSeparatedByString:@":"];
    long result=0;
    for(NSString *str in sepArray){
        //未考虑传入“000”或者“a”，因为‘a’的intvalue也是0
        int octetc=str.intValue>0 ? str.intValue:16;
        result=(result << 8)+(octetc & 0xFF);
    }
    return  result;
}

+ (NSString *)stringToHex:(long) ieee{
    NSString *str=[NSString stringWithFormat:@"%ld",ieee];
    const char *cstr=[str cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data=[NSData dataWithBytes:cstr length:str.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned)data.length, digest);
    //CC_SHA1(data.bytes, data.length, digest);
    NSMutableString *output=[[NSMutableString alloc]init];
    [output appendString:@"0x"];
    for(int i=0;i<CC_SHA1_DIGEST_LENGTH;i++){
        int d=digest[i];
        NSString *temp=[NSString stringWithFormat:@"%x",d];
        
        [output appendString:temp];
    }
    return output.uppercaseString;
//    char str[16];
//    Itoa(ieee,str,16);
// //   sprintf(<#char *restrict#>, <#const char *restrict, ...#>)
    
}
//+ (NSString *)ToHexString:(long)ieee{
//    
//}
@end
