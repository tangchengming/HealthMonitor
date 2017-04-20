//
//  ECG_DetailsViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/12.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "ECG_DetailsViewController.h"

@interface ECG_DetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;//时间
@property (weak, nonatomic) IBOutlet UILabel *waveformLabel;//波形质量
@property (weak, nonatomic) IBOutlet UILabel *isarrhythmiaLabel;//心律是否失常
@property (weak, nonatomic) IBOutlet UILabel *heartrateLabel;//心率快慢
@property (weak, nonatomic) IBOutlet UILabel *avr_heartrateLabel;//心率
@property (weak, nonatomic) IBOutlet UILabel *stisnormalLabel;//ST段
@property (weak, nonatomic) IBOutlet UILabel *wholewaveLabel;//整体波形
@property (weak, nonatomic) IBOutlet UIImageView *ECGImageView;



@end

@implementation ECG_DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.TimeLabel.text = self.collectdate;
    self.waveformLabel.text = self.waveform;
    self.isarrhythmiaLabel.text = self.isarrhythmia;
    self.heartrateLabel.text = self.heartrate;
    self.avr_heartrateLabel.text = [NSString stringWithFormat:@"心率：%@",self.avr_heartrate];
    self.stisnormalLabel.text = self.stisnormal;
    self.wholewaveLabel.text = self.wholewave;
    
    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:self.picturedata options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    self.ECGImageView.image = [UIImage imageWithData:imageData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
