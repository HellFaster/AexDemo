//
//  AexNetHandler.m
//  AexDemo
//
//  Created by JordanCZ on 2018/3/13.
//  Copyright © 2018年 JordanCZ. All rights reserved.
//

#import "AexNetHandler.h"
#import "NSString+MD5.h"
#import "AexNetworkConnect.h"

@implementation AexNetHandler

- (void)requestMyBalance:(AEXRequestSuccessBlock)successBlock failure:(AEXRequestFailureBlock)failureBlock{
    NSDate  *datenow = [NSDate  date];
    
    NSMutableDictionary  *postDict = [NSMutableDictionary  dictionary];
    postDict[@"key"] = kAexAccessApiKey;
    postDict[@"time"] = [NSNumber  numberWithDouble:[datenow  timeIntervalSince1970]];
    NSString  *encrypt =  [NSString  stringWithFormat:@"%@_%@_%@_%@",kAexAccessApiKey,kAexUserID,kAexSecretKey,postDict[@"time"]];
    postDict[@"md5"] = [encrypt  MD5Hash];
    
    [[AexNetworkConnect shareAexNetwork] postReqWithUrl:@"getMyBalance.php"
                                                 params:postDict
                                           successBlock:successBlock
                                           failureBlock:failureBlock];    
}

- (void)requestDepthWith:(NSString *)c mktype:(NSString *)mktype success:(AEXRequestSuccessBlock)successBlock failure:(AEXRequestFailureBlock)failureBlock{
    [[AexNetworkConnect shareAexNetwork] postReqWithUrl:@"depth.php"
                                                 params:@{@"c":c,@"mk_type":mktype}
                                           successBlock:successBlock
                                           failureBlock:failureBlock];
}


@end
