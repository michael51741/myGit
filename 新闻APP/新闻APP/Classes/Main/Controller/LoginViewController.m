//
//  LoginViewController.m
//  新闻APP
//
//  Created by tarena on 16/8/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "MainTabbarController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;

@end

@implementation LoginViewController
- (IBAction)clickLogin:(id)sender {
    MainTabbarController *mtc=[MainTabbarController new];
    [self presentViewController:mtc animated:YES completion:nil];
    
}
- (IBAction)clickRegister:(id)sender {
    RegisterViewController *rvc=[RegisterViewController new];
    UINavigationController *navi=[[UINavigationController alloc]initWithRootViewController:rvc];
    [self presentViewController:navi animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"登  录";
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
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
