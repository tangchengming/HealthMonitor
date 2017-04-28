//
//  HomeController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/27.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "HomeController.h"
#import "MenuCollectionViewCell.h"
#import "UserViewController.h"
#import "EarMeasureViewController.h"
#import "WeighViewController.h"
#import "MeasureViewController.h"
#import "Blood_ViewController.h"
#import "PulseMeterViewController.h"
#import "AlkBGMViewController.h"
#import "FatMonitorViewController.h"
#import "Ecg_ViewController.h"
#import "OneViewController.h"
@interface HomeController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *homeCollectionView;
@property (strong,nonatomic) NSArray *imageArr;
@property (strong,nonatomic) NSArray *itemArr;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageArr = @[@"user_9.png",@"temp_7.png",@"fat_2.png",@"tur_8.png",@"icon_6.png",@"home_4.png",@"home_5.png",@"fat_1.png",@"heart_3.png",@"yiti.png"];
    self.itemArr = @[@"用户管理",@"耳温计",@"脂肪秤",@"血压计",@"血糖仪",@"脉搏仪",@"爱立康血压计",@"脂肪仪",@"心电监测仪",@"一体机"];
    
    [self homeCollectionview];
}




- (void)homeCollectionview{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    CGFloat margin = 10;
    
    CGFloat WH = (([UIScreen mainScreen].bounds.size.width) - margin * 4) / 3;
    
    //每个cell的宽高大小
    layout.itemSize = CGSizeMake(WH, WH);
    
    //间距
    //layout.minimumLineSpacing = margin;
    //layout.minimumInteritemSpacing = margin;
    
    layout.collectionView.showsVerticalScrollIndicator = NO;
    layout.collectionView.showsHorizontalScrollIndicator = NO;
    layout.collectionView.alwaysBounceVertical = YES;
    
    //上左下右间距
    layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
    
    self.homeCollectionView.collectionViewLayout = layout;
    self.homeCollectionView.backgroundColor = [UIColor whiteColor];
    self.homeCollectionView.delegate = self;
    self.homeCollectionView.dataSource = self;
   // self.homeCollectionView.scrollsToTop = NO;
    //[collectionView registerClass:[XMCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    //注册重用
    UINib *nib = [UINib nibWithNibName:@"MenuCollectionViewCell" bundle:nil];
    [self.homeCollectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];

}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.itemArr.count;
}

//每个UICollectionView展示的内容
- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString *imageName = self.imageArr[indexPath.item];
    cell.menuImageView.image = [UIImage imageNamed:imageName];
    cell.menuLabel.text = self.itemArr[indexPath.item];
    
    
    return cell;
}


//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        
        // 获取指定的Storyboard，name填写Storyboard的文件名
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        UserViewController *UserVC = [storyboard instantiateViewControllerWithIdentifier:@"UserVC"];
        [self presentViewController:UserVC animated:YES completion:nil];
        
    }else if (indexPath.row == 1){
        
        // 获取指定的Storyboard，name填写Storyboard的文件名
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Ear" bundle:nil];
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        EarMeasureViewController *EarVC = [storyboard instantiateViewControllerWithIdentifier:@"EarVC"];
        [self presentViewController:EarVC animated:YES completion:nil];
        
        
    }else if (indexPath.row == 2){
        
        // 获取指定的Storyboard，name填写Storyboard的文件名
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"FatScale" bundle:nil];
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        WeighViewController *FatScaleVC = [storyboard instantiateViewControllerWithIdentifier:@"FatScaleVC"];
        [self presentViewController:FatScaleVC animated:YES completion:nil];

        
    }else if (indexPath.row == 3){
        
        // 获取指定的Storyboard，name填写Storyboard的文件名
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"BPM" bundle:nil];
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        MeasureViewController *BPMVC = [storyboard instantiateViewControllerWithIdentifier:@"BPMVC"];
        [self presentViewController:BPMVC animated:YES completion:nil];
        
    }else if (indexPath.row == 4){
        
        // 获取指定的Storyboard，name填写Storyboard的文件名
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"BGM" bundle:nil];
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        Blood_ViewController *BgmVC = [storyboard instantiateViewControllerWithIdentifier:@"BGMVC"];
        [self presentViewController:BgmVC animated:YES completion:nil];
        
    }else if (indexPath.row == 5){
        
        // 获取指定的Storyboard，name填写Storyboard的文件名
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Pulse" bundle:nil];
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        PulseMeterViewController *PulseVC = [storyboard instantiateViewControllerWithIdentifier:@"PulseVC"];
        [self presentViewController:PulseVC animated:YES completion:nil];
        
    }else if (indexPath.row == 6){
        
        // 获取指定的Storyboard，name填写Storyboard的文件名
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Alk" bundle:nil];
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        AlkBGMViewController *AlkVC = [storyboard instantiateViewControllerWithIdentifier:@"AlkVC"];
        [self presentViewController:AlkVC animated:YES completion:nil];
        
    }else if (indexPath.row == 7){
        
        // 获取指定的Storyboard，name填写Storyboard的文件名
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Fat" bundle:nil];
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        FatMonitorViewController *FatVC = [storyboard instantiateViewControllerWithIdentifier:@"FatVC"];
        [self presentViewController:FatVC animated:YES completion:nil];
        
    }else if (indexPath.row == 8){
        
        //获取指定的Storyboard，name填写Storyboard的文件名
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ECG" bundle:nil];
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        Ecg_ViewController *EcgVC = [storyboard instantiateViewControllerWithIdentifier:@"ECGVC"];
        [self presentViewController:EcgVC animated:YES completion:nil];
        
    }else if (indexPath.row == 9){
    
        //获取指定的Storyboard，name填写Storyboard的文件名
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"One" bundle:nil];
        // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
        OneViewController *oneVC = [storyboard instantiateViewControllerWithIdentifier:@"OneVC"];
        [self presentViewController:oneVC animated:YES completion:nil];

    }
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
