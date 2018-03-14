//
//  AexNetworkConnect.h
//  AexDemo
//
//  Created by JordanCZ on 2018/3/13.
//  Copyright © 2018年 JordanCZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AexNetworkSession.h"

@interface AexNetworkConnect : NSObject

+ (instancetype)shareAexNetwork;

+ (AFHTTPSessionManager *)defaultSessionManager;

/**
 网络请求列子---POST

 @param url 请求定制
 @param params 请求参数
 @param successBlock 请求成功回调
 @param failureBlock 请求失败回调
 */
- (NSURLSessionDataTask *)postReqWithUrl:(NSString *)url
                               params:(id)params
                         successBlock:(AEXRequestSuccessBlock)successBlock
                         failureBlock:(AEXRequestFailureBlock)failureBlock;


/**
  网络请求列子---GET

 @param url 请求定制
 @param params 请求参数
 @param successBlock 请求成功回调
 @param failureBlock 请求失败回调
 */
- (NSURLSessionDataTask *)getReqWithUrl:(NSString *)url
                                  params:(id)params
                            successBlock:(AEXRequestSuccessBlock)successBlock
                            failureBlock:(AEXRequestFailureBlock)failureBlock;

@end
