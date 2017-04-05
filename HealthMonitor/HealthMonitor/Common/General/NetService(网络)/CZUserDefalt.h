//
//  CZUserDefalt.h
//  XHApp
//
//  Created by chenhe on 16/9/23.
//  Copyright © 2016年 THkeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZUserDefalt : NSObject

+(void)writeDataWithKey:(NSString *)key andValue:(id)value;
+(id)readDataWithKey:(NSString *)key;
+(void)removeDataWithKey:(NSString *)key;
+(void)removeAllData;


@end
