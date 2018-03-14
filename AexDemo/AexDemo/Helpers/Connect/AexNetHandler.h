//
//  AexNetHandler.h
//  AexDemo
//
//  Created by JordanCZ on 2018/3/13.
//  Copyright © 2018年 JordanCZ. All rights reserved.
//
/*
 * AEX接口
 */

#import <Foundation/Foundation.h> 


@interface AexNetHandler : NSObject

#pragma mark - 个人信息

/**
 查询个人信息 已封装在URLMarcro.h文件中,只需要填好对应的信息
 key     查看(Key)
 time    掛單時的時間戳，單位為秒
 md5     使用md5(key_用戶ID_skey_time)，順序不可顛倒
 
 @param successBlock 请求成功回调
 @param failureBlock 请求失败回调
 */
- (void)requestMyBalance:(AEXRequestSuccessBlock)successBlock failure:(AEXRequestFailureBlock)failureBlock;

#pragma mark - 市场深度API

/**
 市场深度API详情

 @param c    自选币种 比如:bts、omg
 @param mktype 市场交易类型的币种  比如: btc
 @param successBlock 请求成功回调
 @param failureBlock 请求失败回调
 */
- (void)requestDepthWith:(NSString *)c mktype:(NSString *)mktype success:(AEXRequestSuccessBlock)successBlock failure:(AEXRequestFailureBlock)failureBlock;

@end
