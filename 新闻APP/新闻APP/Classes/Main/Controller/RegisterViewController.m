//
//  RegisterViewController.m
//  新闻APP
//
//  Created by tarena on 16/8/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *registerAccountLabel;
@property (weak, nonatomic) IBOutlet UITextField *registerPasswordLabel;
@property (weak, nonatomic) IBOutlet UITextField *registerNicknameLabel;

@end

@implementation RegisterViewController
- (IBAction)clickRegister:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barButton=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(backLoginVC)];
    self.navigationItem.leftBarButtonItem=barButton;
    barButton.tintColor=[UIColor blueColor];
    // Do any additional setup after loading the view from its nib.
}
-(void)backLoginVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
