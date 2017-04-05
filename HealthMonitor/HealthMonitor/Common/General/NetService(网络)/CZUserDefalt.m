//
//  CZUserDefalt.m
//  XHApp
//
//  Created by chenhe on 16/9/23.
//  Copyright © 2016年 THkeji. All rights reserved.
//

#import "CZUserDefalt.h"

@implementation CZUserDefalt


+(void)writeDataWithKey:(NSString *)key andValue:(id)value {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    
    [defaults synchronize];
}

+(id)readDataWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id info = [defaults objectForKey:key];
    return info;
}

+(void)removeDataWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
}

+(void)removeAllData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *arr = [defaults dictionaryRepresentation];
    for (id key in arr) {
        [defaults removeObjectForKey:key];
    }
    [defaults synchronize];
    
}





@end
