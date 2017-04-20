//
//  ECGTableViewCell.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/11.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ECGTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *waveformLabel;
@property (weak, nonatomic) IBOutlet UILabel *isarrhythmiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *wholewaveLabel;
@property (weak, nonatomic) IBOutlet UILabel *heartrateLabel;
@property (weak, nonatomic) IBOutlet UILabel *xinlvLabel;


@end
