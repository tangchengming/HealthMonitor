//
//  LayerCoreRadius.m
//  PiaoXiangJiuGui
//
//  Created by Apple on 15/12/14.
//  Copyright © 2015年 Windward. All rights reserved.
//

#import "LayerCoreRadius.h"

@implementation LayerCoreRadius

+(id)getCoreRadiusLayer:(UIView *)controllerKJ{
    return [[self alloc]initWithCoreRudius:controllerKJ];
}

-(id)initWithCoreRudius:(UIView *)controllerKJ{
    if (self = [super init]) {
        controllerKJ.layer.masksToBounds = YES;//masksToBounds置为YES，可以使用圆角
        controllerKJ.layer.cornerRadius = 5;//设置圆角的大小
    }
    return self;
}

+(id)setCoreRadiusLayer:(id)Views{
    return [[self alloc]initWithCoRudius:Views];
}

-(id)initWithCoRudius:(UIView *)controllerKJ{
    if (self = [super init]) {
        controllerKJ.layer.masksToBounds = YES;//masksToBounds置为YES，可以使用圆角
        controllerKJ.layer.cornerRadius = 5;//设置圆角的大小
    }
    return self;
}

+(id)setUpBorder:(UIView *)customView{
    return [[self alloc]initWithBorder:customView];//加边框
}

-(id)initWithBorder:(UIView *)customView{
    if (self = [super init]) {
        customView.layer.borderWidth = 1;
        customView.layer.masksToBounds = YES;
        customView.layer.cornerRadius = 5;
        customView.layer.borderColor = [UIColor grayColor].CGColor;
    }
    return self;
}


@end
