//
//  ViewController.m
//  WhoIsTheRichest
//
//  Created by WangPan on 16/2/23.
//  Copyright © 2016年 Wang Pan. All rights reserved.
//

#import "ViewController.h"
#import "NetManager.h"
#import <objc/Object.h>
#import <objc/objc.h>
#import "CTest.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NetManager * m1 = [NetManager shareManager];
    NetManager * m2 = [NetManager shareManager];
    
    NetManager * m3 = [[NetManager alloc] init];
    NetManager * m4 = [[NetManager alloc] init];
    
    NSString * str  = nil;
    NSString * xtr = str ?: @"ccc";
    
 
    NSLog(@"%p , %p,  %p , %p , %@",m1,m2,m3,m4,xtr);
    
    NSString * url = @"http://op.juhe.cn/onebox/weather/query";
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithObject:@"北京" forKey:@"cityname"];
    [dict setObject:@"6925c4934f3624cc823f5addaee0a091" forKey:@"key"];
    [[NetManager shareManager] POST:url parameters:dict success:^(id responsed) {
        NSDictionary * dict = responsed;
        DELog(@"%@",dict);
    } failure:^(NSError *error) {
        
    }];
    
    BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
    
    BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
    
    BOOL res3 = [(id)[ViewController class] isKindOfClass:[ViewController class]];
    
    BOOL res4 = [(id)[ViewController class] isMemberOfClass:[ViewController class]];
    
    NSLog(@"%@", (id)[NSObject class]);
    NSLog(@"%@", [NSObject class]);
    NSLog(@"%@", (id)[ViewController class]);
    NSLog(@"%@", [ViewController class]);

    NSLog(@"%d %d %d %d", res1, res2, res3, res4);
    
    
    NSString * string = @"Peter";
    NetManager * manager = [NetManager shareManager];
    Ivar name_ivar = class_getInstanceVariable(object_getClass(manager), "name");
    object_setIvar(manager, name_ivar, string);
    NSLog(@"%@",manager);
    
    NSString * getStr =   object_getIvar(manager, name_ivar);
    NSLog(@"%@",getStr);
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
        });
        
    });
    
    NSString * string1 =                                                                            @"218140758923475009028430679850461237";
    NSString * string2 =  @"52431537641987205601562093650123700561270354718932678541907238647813252547";

    CTest * ct = [[CTest alloc] init];
    NSString * plus = [ct plusBy:string1 and:string2];
    DELog(@"%@",plus);
    NSString * multi = [ct multiByString:string1 and:string2];
    DELog(@"%@",multi);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
