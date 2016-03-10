//
//  CTest.m
//  WhoIsTheRichest
//
//  Created by WangPan on 16/3/2.
//  Copyright © 2016年 Wang Pan. All rights reserved.
//

#import "CTest.h"
#import <UIKit/UIKit.h>
@implementation CTest

//z字符串匹配
-(NSDictionary*)dictBystring:(NSString*)string{
    NSMutableDictionary * dict  = [NSMutableDictionary dictionary];
    for (int i = 0; i < string.length; i ++) {
        NSString * keyStr = [string substringWithRange:NSMakeRange(i, 1)];
        id hasKey = [dict objectForKey:keyStr];
        NSString* valStr = [NSString stringWithFormat:@"%d",[hasKey intValue] + 1];
        [dict setObject:valStr forKey:keyStr];
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

-(BOOL)string:(NSString*)string1 matchTo:(NSString*)string2{
    if (string1.length != string2.length) {
        return NO;
    }
    NSDictionary * dict1 = [self dictBystring:string1];
    NSDictionary * dict2 = [self dictBystring:string2];
    if (dict1.count != dict2.count) {
        return NO;
    }
    __block NSInteger rCount = 0;
    [dict1 enumerateKeysAndObjectsUsingBlock:^(NSString* key1, NSString *  obj1, BOOL * stop1) {
        [dict2 enumerateKeysAndObjectsUsingBlock:^(NSString* key2, NSString *  obj2, BOOL * stop2) {
            if ([key1 isEqualToString:key2]) {
                if ([obj1 isEqualToString:obj2]) {
                    rCount ++;
                }else{
                    *stop1 = YES;
                    *stop2 = YES;
                }
            }
        }];
    }];
    return rCount ==  dict1.count ? YES : NO;
}


//string 倒序加入数组
-(NSArray*)arrayByString:(NSString*)string longLen:(NSInteger)longLen{
    NSMutableArray * array = [NSMutableArray array];
    for (int i = 0; i < longLen - string.length; i++) {
        [array addObject:@"0"];
    }
    for (int i = 0;  i < string.length; i++) {
        [array addObject:[string substringWithRange:NSMakeRange(i, 1) ]];
    }
    return [NSArray arrayWithArray:array];
}

//数组倒序加入string
-(NSString*)orderStringBy:(NSArray*)array{
    NSString * resultString = @"";
    for (int i = 0 ; i < array.count; i ++) {
        NSString * str = array[array.count - i - 1];
        resultString =  [resultString stringByAppendingString:str];
    }
    DELog(@"%@",resultString);
    return resultString;
}

//两个长数相加
-(NSString*)plusBy:(NSString*)strings1 and:(NSString*)strings2{
    
    NSInteger len = strings1.length >= strings2.length? strings1.length : strings2.length;
    NSArray * longArr = [self arrayByString:strings1 longLen:len];
    NSArray * shortArr = [self arrayByString:strings2 longLen:len];
    
    NSMutableArray * resultArr = [NSMutableArray array];
    int tempTen = 0;
    for (int i = 0; i < len; i++) {
        int sum = [longArr[len - 1-i] intValue] + [shortArr[len - 1 -i] intValue] + tempTen;
        if (sum >= 10) {
            tempTen = 1;
            sum = sum - 10;
        }else{
            tempTen = 0;
        }
        [resultArr addObject:[NSString stringWithFormat:@"%d",sum]];
    }
    if (tempTen == 1) {
        [resultArr addObject:@"1"];
    }
    return [self orderStringBy:resultArr];
}

//一个数 * 一个数 + 进位
-(NSArray*)oneNum:(NSString *)oneNum multi:(NSString*)anotherNum plus:(NSString*)tempTen{
    int resNum = oneNum.intValue * anotherNum.intValue + tempTen.intValue;
    NSString * one = @"0";
    NSString * ten = @"0";
    if (resNum >= 10) {
        one = [NSString stringWithFormat:@"%d",resNum % 10];
        ten = [NSString stringWithFormat:@"%d", (int)(resNum/10)];
    }else{
        one = [NSString stringWithFormat:@"%d",resNum];
        ten = @"0";
    }
    return [NSArray arrayWithObjects:one,ten,nil];
}

//一个数 * 一个长数 * 位数
-(NSString *)oneNum:(NSString*)onestr mutliNums:(NSString *)strings andOffset:(int)num{
    NSArray * strsArr = [self arrayByString:strings longLen:strings.length];
    NSString * tempTen = @"0";
    NSMutableArray * resultArr = [NSMutableArray array];
    for (int i = 0; i < num ;i++) {
        [resultArr addObject:@"0"];
    }
    for (int i = 0; i < strsArr.count; i ++) {
        NSString * multi = strsArr[i];
        NSArray * resArr = [self oneNum:multi multi:onestr plus:tempTen];
        [resultArr addObject:resArr[0]];
        tempTen = resArr[1];
        if (i == strsArr.count -1 && tempTen.intValue > 0) {
            [resultArr addObject:tempTen];
        }
    }

    return [self orderStringBy:resultArr];
}

//两个长数相乘
-(NSString*)multiByString:(NSString*)string1 and:(NSString*)string2{
    NSArray * upArr = [self arrayByString:string1 longLen:string1.length];
    NSMutableArray * mutliTempArr = [NSMutableArray array];
    
    for (int i = 0; i < upArr.count; i ++) {
        NSString * multi = upArr[upArr.count - i - 1];
        NSString * str = [self oneNum:multi mutliNums:string2 andOffset:(int)upArr.count - 1 - i];
        [mutliTempArr addObject:str];
    }
    
    NSString * tempString = @"0";
    for (int i = 0; i < mutliTempArr.count; i ++) {
        tempString = [self plusBy:tempString and:mutliTempArr[i]];
    }
    
    
    return tempString;
}

//一个数 - 一个数  - 借位
-(NSArray*)one:(NSString*)one sub:(NSString*)another borrow:(NSString*)borrow{
    int res = one.intValue - another.intValue - borrow.intValue;
    NSString * left = @"0";
    NSString * aBor = @"0";
    if (res >= 0) {
        left = [NSString stringWithFormat:@"%d",res];
    }else{
        left = [NSString stringWithFormat:@"%d",res + 10];
        aBor = @"1";
    }
    return [NSArray arrayWithObjects:left,aBor, nil];
}

//两个长位数相减


@end
