//
//  RequestManager.m
//  ELHome
//
//  Created by Atohuyo on 2017/2/20.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "RequestManager.h"



@implementation RequestManager

+(void)httpRequestPOST:(NSString *)string parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer.timeoutInterval = 5;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    
    string = [NSString stringWithFormat:@"%@%@",K_IP,string];
   
    
    NSLog(@"链接：%@",string);
    [manager POST:string parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        NSLog(@"网络请求失败!");
        
    }];
}


//封装POST请求
+ (void)httpPOST:(NSString *)string parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer.timeoutInterval = 5;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    
    string = [NSString stringWithFormat:@"%@%@",B_IP,string];
    
    
    NSLog(@"链接：%@",string);
    [manager POST:string parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        NSLog(@"网络请求失败!");
    }];
}


+(void)httpRequestGET:(NSString *)string parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer.timeoutInterval = 5;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    
    string = [NSString stringWithFormat:@"%@%@",K_IP,string];
    
    NSLog(@"链接：%@",string);
    
    [manager GET:string parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        NSLog(@"网络请求失败!");
    }];
}
@end
