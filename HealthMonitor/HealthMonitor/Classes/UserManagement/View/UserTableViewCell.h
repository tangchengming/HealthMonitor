//
//  UserTableViewCell.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/10.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *AgeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *SexImageView;
@property (weak, nonatomic) IBOutlet UIButton *ModifyBtn;

@end
