//
//  AexNetworkSession.m
//  AexDemo
//
//  Created by JordanCZ on 2018/3/13.
//  Copyright © 2018年 JordanCZ. All rights reserved.
//

#import "AexNetworkSession.h"



@implementation AexNetworkSession

+ (NSURLSessionDataTask *)requestAexWithManager:(AFHTTPSessionManager *)manager
                                            url:(NSString *)url
                                         params:(NSDictionary *)params
                                           type:(AEXRequestMethod)type
                                   successBlock:(AEXRequestSuccessBlock)successBlock
                                   failureBlock:(AEXRequestFailureBlock)failureBlock{
    NSURLSessionDataTask *sessionDataTask = nil;
    if (type == AEXRequestMethodGet) {
        sessionDataTask = [manager GET:url parameters:params progress:nil
                               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                if(successBlock){
                                    successBlock((NSDictionary *)responseObject);
                                }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
            if(failureBlock){
                failureBlock(error,error.debugDescription);
            }
            
        }];
    }
    else if(type == AEXRequestMethodPost){
        NSMutableURLRequest  *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:nil error:nil];
        request.timeoutInterval = 30;
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        NSMutableString  *str_p = [[NSMutableString alloc] init];
        for (NSString *key in [params allKeys]) {
            [str_p appendString:[NSString stringWithFormat:@"%@=%@&",key,[params objectForKey:key]]];
        }
        
        [request setHTTPBody:[str_p  dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES]];
        
        sessionDataTask = [manager  dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (error) {
                if(failureBlock){
                    failureBlock(error,error.debugDescription);
                }
            } else {
                NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                
                NSDictionary *dictResult = [NSObject json2Dictionary:responseObject];
                if (!dictResult) {
                    NSLog(@"Error = %@",string);
                }
                if(successBlock){
                    successBlock(dictResult);
                }
            }
        }];
        [sessionDataTask resume];
    }
    return sessionDataTask;
}

@end


@implementation NSObject (AexSecurity)
+ (char *)decryptConstString:(char *)string{
    char* origin_string = string;
    while(*string) {
        *string ^= 0xAA;
        string++;
    }
    return origin_string;
}



+ (NSData *) dictionary2Json:(NSDictionary *) dir
{
    if(!dir)
    {
        return nil;
    }
    
    return  [NSJSONSerialization dataWithJSONObject:dir options:NSJSONWritingPrettyPrinted error:nil];
}

+ (NSDictionary *)json2Dictionary:(NSData *) json
{
    if(!json)
    {
        return nil;
    }
    return [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:nil];
}

#pragma mark - 将字典或者数组转化为JSON串
+ (NSString *)toJSONData:(NSDictionary *) dir
{
    if(!dir)
    {
        return @"";
    }
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dir
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if ([jsonData length] > 0){
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    else
    {
        return @"";
    }
}

@end
