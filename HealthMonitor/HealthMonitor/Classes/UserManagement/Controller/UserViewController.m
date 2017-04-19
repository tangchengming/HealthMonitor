//
//  UserViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/10.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "UserViewController.h"
#import "UserTableViewCell.h"
#import "UserInfoModel.h"
#import "ModifyViewController.h"
@interface UserViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *UserListTableView;
@property (strong, nonatomic)NSMutableArray *UserListDataArr;//模型对象数组（ 用户列表数据源）
@end

@implementation UserViewController

- (NSMutableArray *)UserListDataArr{

    if (!_UserListDataArr) {
        
        _UserListDataArr = [NSMutableArray array];
    }
    return _UserListDataArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self tableView];
    [self setNetWorkData];
    

}

- (void)tableView{

    self.UserListTableView.delegate = self;
    self.UserListTableView.dataSource = self;
    self.UserListTableView.tableFooterView = [UIView new];
    //注册cell
    //[self.UserListTableView registerNib:[UINib nibWithNibName:@"UserTableViewCell" bundle:nil] forCellReuseIdentifier:@"UserCell"];
}

//用户列表网络请求
- (void)setNetWorkData{

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userId"] = @"23";
    
    [RequestManager httpRequestPOST:Request_Method_UserList parameters:params success:^(id responseObject) {
        NSLog(@"新建成员111：%@",responseObject);
        if ([[responseObject objectForKey:@"flag"]integerValue]){
            
            _UserListDataArr = [UserInfoModel mj_objectArrayWithKeyValuesArray:responseObject[@"listMemberlist"]];
            
            [self.UserListTableView reloadData];//刷新
        }else{
            
            [MBProgressHUD showMessage:@"暂无成员 请创建！" toView:self.view afterDelty:1.0];
        }
        
        
    } failure:^(NSError *error) {
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return _UserListDataArr.count;
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserInfoModel *UserInfoModel = self.UserListDataArr[indexPath.item];
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;//设置cell点击效果
    cell.NameLabel.text = UserInfoModel.name;
    
    //计算年龄
    NSString *birth = UserInfoModel.birth;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //生日
    NSDate *birthDay = [dateFormatter dateFromString:birth];
    //当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *currentDate = [dateFormatter dateFromString:currentDateStr];
    
    NSTimeInterval time=[currentDate timeIntervalSinceDate:birthDay];
    int age = ((int)time)/(3600*24*365);
    
    cell.AgeLabel.text = [NSString stringWithFormat:@"%d岁", age];
    
    if (UserInfoModel.sex == 1) {
        cell.SexImageView.image = [UIImage imageNamed:@"boy.png"];
    }else{
        cell.SexImageView.image = [UIImage imageNamed:@"girl.png"];
    }
    
    
    return cell;
}



/*改变删除按钮的title*/
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

/*删除用到的函数*/
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UserInfoModel *UserInfoModel = self.UserListDataArr[indexPath.row];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"member_id"] = UserInfoModel.member_id;
    
    NSLog(@"id:%@",UserInfoModel.member_id);
    [RequestManager httpRequestPOST:Request_Method_deleteUser parameters:params success:^(id responseObject) {
        
        NSLog(@"删除:%@",responseObject);
        //删除成功
        //先移除数据源 ,再移除tableview的cell
        [self.UserListDataArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        
    } failure:^(NSError *error) {
        
    }];
    
    
    


}






- (IBAction)editAction:(UIButton *)sender {
    
    UITableViewCell *cell = (UITableViewCell *)[[sender superview] superview];
    NSIndexPath *path = [self.UserListTableView indexPathForCell:cell];
    
    UserInfoModel *UserInfoModel = self.UserListDataArr[path.row];
    //传递数据
    
    
    UIStoryboard *storboard = self.storyboard;
    ModifyViewController *editVC = [storboard instantiateViewControllerWithIdentifier:@"Modify"];
    
    //editVC.userModel = UserInfoModel;
    editVC.name = UserInfoModel.name;
    editVC.birth = UserInfoModel.birth;
    editVC.sex = UserInfoModel.sex;
    [self presentViewController:editVC animated:YES completion:nil];
    
}



- (IBAction)backBtn:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



//退出登录
- (IBAction)ExitLoginBtn:(UIButton *)sender {
    
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"退出登录" message:@"是否确认退出登录！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alertview show];

}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;{
    
    
    
    if (buttonIndex == 0)
        
    {
        
        
        
    }else{
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user removeObjectForKey:@"tel"];
        [user removeObjectForKey:@"name"];
        [user removeObjectForKey:@"userid"];
        [user synchronize];
        [CZUserDefalt writeDataWithKey:@"loginStatus" andValue:@"NO"];
        [CZUserDefalt removeAllData];
        
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
