//
//  NetManager.h
//  WhoIsTheRichest
//
//  Created by WangPan on 16/2/23.
//  Copyright © 2016年 Wang Pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface NetManager : NSObject
{
    @private
     NSString *   name;
}
+(instancetype)shareManager;
-(void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^) (id responsed))sucess failure:(void (^)(NSError * error))failure;

@end
