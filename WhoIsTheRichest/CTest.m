//
//  CTest.m
//  WhoIsTheRichest
//
//  Created by WangPan on 16/3/2.
//  Copyright © 2016年 Wang Pan. All rights reserved.
//

#import "CTest.h"

@implementation CTest

//string 倒序加入数组
-(NSArray*)arrayByString:(NSString*)string{
    NSMutableArray * array = [NSMutableArray array];
    for (int i = 0;  i < string.length; i++) {
        NSString * oneStr = [string substringWithRange:NSMakeRange(string.length - 1 - i, 1) ];
        [array addObject:oneStr];
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

//一个数 + 一个数 + 进位数
-(NSArray*)one:(NSString *)one plus:(NSString*)another plus:(NSString*)tempTen{
    NSString * tenTemp = @"0";
    NSString * oneTemp = @"0";
    int sum = [one intValue] + [another intValue] + [tempTen intValue];
    if (sum >= 10) {
        tenTemp = @"1";
        oneTemp = [NSString stringWithFormat:@"%d",sum - 10];
    }else{
        oneTemp = [NSString stringWithFormat:@"%d",sum];
    }
    return [NSArray arrayWithObjects:oneTemp,tenTemp,nil];
}

//两个长数相加
-(NSString*)plusBy:(NSString*)strings1 and:(NSString*)strings2{

    NSString * longStr;
    NSString * shortStr;
    if (strings1.length >= strings2.length) {
        longStr = strings1;
        shortStr = strings2;
    }else{
        longStr = strings2;
        shortStr = strings1;
    }
    NSArray * longArr = [self arrayByString:longStr];
    NSArray * shortArr = [self arrayByString:shortStr];
    
    NSMutableArray * resultArr = [NSMutableArray array];
    NSString * tempTen = @"0";
    for (int i = 0; i < longArr.count; i++) {
        if ((int)shortArr.count - 1 - i >= 0) {
            NSArray * resArr = [self one:longArr[i] plus:shortArr[i] plus:tempTen];
            tempTen = resArr[1];
            [resultArr addObject:resArr[0]];
        }else{
            if (tempTen.intValue > 0) {
                NSArray * resArr = [self one:longArr[i] plus:@"0" plus:tempTen];
                tempTen = resArr[1];
                [resultArr addObject:resArr[0]];
            }else{
                [resultArr addObject:longArr[i]];
            }
        }
        if (tempTen.intValue > 0 && longArr.count - i - 1 == 0) {
            [resultArr addObject:@"1"];
        }
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
    NSArray * strsArr = [self arrayByString:strings];
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
    NSArray * upArr = [self arrayByString:string1];
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
