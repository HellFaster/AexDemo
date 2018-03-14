//
//  AexNetworkSession.h
//  AexDemo
//
//  Created by JordanCZ on 2018/3/13.
//  Copyright © 2018年 JordanCZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface NSObject (AexSecurity)


+ (NSData *)dictionary2Json:(NSDictionary *)dir;
+ (NSDictionary *)json2Dictionary:(NSData *)json;
+ (NSString *)toJSONData:(NSDictionary *)dir;

@end

@interface AexNetworkSession : NSObject


+ (NSURLSessionDataTask *)requestAexWithManager:(AFHTTPSessionManager *)manager
                                            url:(NSString *)url
                                         params:(NSDictionary *)params
                                           type:(AEXRequestMethod)type
                                   successBlock:(AEXRequestSuccessBlock)successBlock
                                   failureBlock:(AEXRequestFailureBlock)failureBlock;

@end
