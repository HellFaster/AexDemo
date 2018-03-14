//
//  AexNetworkConnect.m
//  AexDemo
//
//  Created by JordanCZ on 2018/3/13.
//  Copyright © 2018年 JordanCZ. All rights reserved.
//

#import "AexNetworkConnect.h"

@interface AexNetworkConnect()
@property (nonatomic, copy) NSString  *baseURL;
@end

@implementation AexNetworkConnect

+ (instancetype)shareAexNetwork{
    static AexNetworkConnect *sharedAexNetUtils = nil;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        sharedAexNetUtils = [[AexNetworkConnect alloc] init];
    });
    return sharedAexNetUtils;
}

- (id)init{
    self = [super init];
    if (self) {
        _baseURL = kBaseUrl;
    }
    return self;
}

+ (AFHTTPSessionManager *)defaultSessionManager{
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", nil];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        manager.requestSerializer.timeoutInterval = 30;
        [manager.requestSerializer setHTTPShouldHandleCookies:YES];
    });
    return  manager;
}

- (NSURLSessionDataTask *)postReqWithUrl:(NSString *)url
                                  params:(id)params
                            successBlock:(AEXRequestSuccessBlock)successBlock
                            failureBlock:(AEXRequestFailureBlock)failureBlock{
    NSString  *reqUrl = [NSString  stringWithFormat:@"%@%@",self.baseURL,url];
    return [AexNetworkSession requestAexWithManager:[AexNetworkConnect defaultSessionManager] url:reqUrl params:params type:AEXRequestMethodPost successBlock:successBlock failureBlock:failureBlock];
}

- (NSURLSessionDataTask *)getReqWithUrl:(NSString *)url
                                 params:(id)params
                           successBlock:(AEXRequestSuccessBlock)successBlock
                           failureBlock:(AEXRequestFailureBlock)failureBlock{
    NSString  *reqUrl = [NSString  stringWithFormat:@"%@%@",self.baseURL,url];
    return  [AexNetworkSession requestAexWithManager:[AexNetworkConnect defaultSessionManager] url:reqUrl params:params type:AEXRequestMethodPost successBlock:successBlock failureBlock:failureBlock];
}

@end
