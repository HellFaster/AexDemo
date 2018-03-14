//
//  AexEnum.h
//  AexDemo
//
//  Created by JordanCZ on 2018/3/13.
//  Copyright © 2018年 JordanCZ. All rights reserved.
//

#ifndef AexEnum_h
#define AexEnum_h


typedef NS_ENUM(NSUInteger, AEXRequestMethod) {
    AEXRequestMethodGet,
    AEXRequestMethodPost
};

typedef void (^AEXRequestSuccessBlock)(id responseOjbect);
typedef void (^AEXRequestFailureBlock)(id error,NSString *msg);

#endif /* AexEnum_h */
