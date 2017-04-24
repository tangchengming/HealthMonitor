//
//  ListTableViewCell.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/11.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *collectdateLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodytypeLabel;

@property (weak, nonatomic) IBOutlet UILabel *fatcontentLabel;
@property (weak, nonatomic) IBOutlet UILabel *fatLabel;

@property (weak, nonatomic) IBOutlet UILabel *bmiLabel;
@property (weak, nonatomic) IBOutlet UILabel *biLabel;

@property (weak, nonatomic) IBOutlet UILabel *bmrLabel;
@property (weak, nonatomic) IBOutlet UILabel *brLabel;


@end
