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
#import <objc/runtime.h>
#import "CTest.h"
#import "CtestOne.h"
#import "CtestTwo.h"
@interface ViewController ()
@property (nonatomic, assign) NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CTest * c1 = [[CTest alloc] init];
    CtestOne * co1 = [[CtestOne alloc] init];
    DELog(@"%@",[co1 class]);
    CtestTwo * ct2 = [[CtestTwo alloc] init];
    if ([co1 isMemberOfClass:[c1 class]]) {
        DELog(@"co1 ismo c1 class");
    }
    if ([co1 isKindOfClass:[c1 class]]) {
        DELog(@"co1 isko c1 class");
    }
    
    NetManager * m1 = [NetManager shareManager];
    NetManager * m2 = [NetManager shareManager];
    
    NetManager * m3 = [[NetManager alloc] init];
    NetManager * m4 = [[NetManager alloc] init];
    UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];

    UIView * sv1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];

    if ([btn1 isMemberOfClass:[sv1 class]]) {
        
        DELog(@"btn1 ismo sv1");
    }
    if ([btn1 isKindOfClass:[sv1 class]]) {
        DELog(@"%@",[sv1 class])
        DELog(@"btn1 isko sv1");
    }
    if ([btn2 isMemberOfClass:[UIView class]]) {
        DELog(@"b2 ismo uiview");
    }
    if ([btn2 isKindOfClass:[UIView class]]) {
        DELog(@"%@",[UIView class]);
        DELog(@"b2 isko uivew");
    }
    NSString * str  = nil;
    NSString * xtr = str ?: @"ccc";
    self.count = 0;
 
    NSLog(@"%p , %p,  %p , %p , %@",m1,m2,m3,m4,xtr);
    //sume test gitff
    
    NSMutableArray * mArr = [NSMutableArray array];
    [mArr enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL *  stop) {
        
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
//    dispatch_queue_t aqueue  = dispatch_get_main_queue();

//    dispatch_async(aqueue, ^{
//        [self printHD];
//        DELog(@"end sy");
//    });
//    dispatch_async(aqueue, ^{
//        [self printSD];
//        DELog(@"end--asy");
//    });
    
    
    NSString * string1 =             @"1234567891234567891";
    NSString * string2 =             @"1122334455667788992";

    CTest * ct = [[CTest alloc] init];
//    NSString * plus = [ct plusBy:string1 and:string2];
//    DELog(@"%@",plus);
//    NSString * multi = [ct multiByString:string1 and:string2];
//    DELog(@"%@",multi);
    BOOL ie = [ct string:string1 matchTo:string2];
    DELog(@"%d",ie);
//    NSBlockOperation * bop = [NSBlockOperation blockOperationWithBlock:^{
//        DELog(@"bop create");
//    }];
//    [bop addExecutionBlock:^{
//        for (int i  = 0; i < 100; i ++) {
//            DELog(@"IS - %d---- bop",i);
//        }
//    }];
//    
//    [bop addExecutionBlock:^{
//        [self request];
//    }];
//    
//    NSBlockOperation * cbop = [NSBlockOperation blockOperationWithBlock:^{
//        DELog(@"ccccbop create");
//    }];
//    [cbop addDependency:bop];
//    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
//    queue.maxConcurrentOperationCount = 1;
//    [queue addOperations:@[bop ,cbop] waitUntilFinished:YES];
//    
//    
    
//    dispatch_group_t  group = dispatch_group_create();
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        for (int i = 0; i < 10; i ++) {
//            dispatch_group_enter(group);
//            if (i < 4) {
//                [self printSD];
//            }
//            if (i >=4 && i < 8) {
//                [self request];
//            }
//            if (i >= 8) {
//                [self printHD];
//            }
//            dispatch_group_leave(group);
//        }
//    });
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//    dispatch_queue_t aqueue  = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    
//    dispatch_group_async(group, aqueue, ^{
//        [self printHD];
//    });
//    
//    dispatch_group_async(group, aqueue, ^{
//        [self request];
//
//    });
//    
//    dispatch_group_notify(group, aqueue, ^{
//        DELog(@"end")
//    });
//    
    
//    NSInvocationOperation * rqop = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(request) object:nil];
//    NSInvocationOperation *hdop = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printHD) object:nil];
//    NSInvocationOperation * sdop = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printSD) object:nil];
//    
//    [hdop addDependency:rqop];
//    [sdop addDependency:hdop];
//    
//    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
//    [queue addOperations:@[rqop,sdop,hdop] waitUntilFinished:YES];
//    dispatch_queue_t  myQueue = dispatch_queue_create("myQueue.someClass.myApp", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        dispatch_async(myQueue, ^{
//            [self request];
//            DELog(@"hihihi");
//        });
//        dispatch_async(myQueue, ^{
//            for (int i = 0; i < 100; i++) {
//                DELog(@"---%d",i );
//            }
//            DELog(@"hahahahhaha");
//        });
//        
//        dispatch_async(myQueue, ^{
//            for (int i = 0; i < 1011; i ++) {
//                DELog(@"%d",i );
//            }
//            DELog(@"hehehehe");
//        });
//    });
//
    DELog(@"endtototo");
//    
//    DELog(@"sync - %@",[NSThread currentThread]);
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        DELog(@"sync - %@",[NSThread currentThread]);
//    });
//    DELog(@"sync - %@",[NSThread currentThread]);
}

-(void)printHD{
    for (int i = 0; i < 100; i ++) {
        DELog(@"100-----%d",i);
    }
    DELog(@"end ----------------------------------------------------------------100");
}
-(void)printSD{
    for (int i = 0; i < 1000; i ++) {
        DELog(@"1000-----%d",i);
    }
    DELog(@"end ----------------------------------------------------------------1000");

}
-(void)request{
    
    DELog(@"req ----------------------------------------------------------------start");
    self.count ++;
    NSString * url = @"http://op.juhe.cn/onebox/weather/query";
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithObject:@"北京" forKey:@"cityname"];
    [dict setObject:@"6925c4934f3624cc823f5addaee0a091" forKey:@"key"];
    [[NetManager shareManager] POST:url parameters:dict success:^(id responsed) {
        NSDictionary * dict = responsed;
        DELog(@"%ld -- %@",self.count,dict);
    } failure:^(NSError *error) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    unsigned int count = 0;
    Class *classes = objc_copyClassList(&count);
    DELog(@"%d",count);
    for (int i = 0; i < count; i++) {
        const char *cname = class_getName(classes[i]);
        printf("%s\n", cname);
    }
}
@end
