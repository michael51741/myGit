//
//  MainTabbarController.m
//  影讯App
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MainTabbarController.h"
#import "MainNaigationController.h"
#import "ChatTableViewController.h"
#import "NewsTableViewController.h"
#import "MusicTableViewController.h"
#import "AddressBookTableViewController.h"
#import "PersonalInfoTableViewController.h"

@interface MainTabbarController ()

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    ChatTableViewController *ctvc=[ChatTableViewController new];
    NewsTableViewController *ntvc=[NewsTableViewController new];
    MusicTableViewController *mtvc=[MusicTableViewController new];
    AddressBookTableViewController *abtvc=[AddressBookTableViewController new];
    PersonalInfoTableViewController *pitvc=[PersonalInfoTableViewController new];
    [ctvc.tabBarItem setImage:[UIImage imageNamed:@"chat"]];
    [ntvc.tabBarItem setImage:[UIImage imageNamed:@"news"]];
    [mtvc.tabBarItem setImage:[UIImage imageNamed:@"music"]];
    [abtvc.tabBarItem setImage:[UIImage imageNamed:@"address_book"]];
    [pitvc.tabBarItem setImage:[UIImage imageNamed:@"personal_info"]];
    ctvc.title=@"Chat";
    ntvc.title=@"News";
    mtvc.title=@"Music";
    abtvc.title=@"AddressBook";
    pitvc.title=@"PersonalInfo";
   self.viewControllers = @[[[MainNaigationController alloc]initWithRootViewController:ctvc],[[MainNaigationController alloc]initWithRootViewController:ntvc],[[MainNaigationController alloc]initWithRootViewController:mtvc],[[MainNaigationController alloc]initWithRootViewController:abtvc],[[MainNaigationController alloc]initWithRootViewController:pitvc]];
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
