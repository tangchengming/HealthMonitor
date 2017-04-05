//
//  RequestManager.h
//  ELHome
//
//  Created by Atohuyo on 2017/2/20.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject

//封装POST请求
+(void)httpRequestPOST:(NSString *)string
        parameters:(id)parameters
           success:(void (^)(id responseObject))success
           failure:(void (^)(NSError *error))failure;

//封装GET请求
+(void)httpRequestGET:(NSString *)string
            parameters:(id)parameters
               success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure;



@end
