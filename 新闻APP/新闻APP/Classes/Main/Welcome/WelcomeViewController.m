//
//  WelcomeViewController.m
//  app
//
//  Created by tarena on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WelcomeViewController.h"
#import "LoginViewController.h"
@interface WelcomeViewController ()<UIScrollViewAccessibilityDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@end
@implementation WelcomeViewController
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage=
    scrollView.contentOffset.x/self.view.frame.size.width+0.5;
}
-(UIPageControl *)pageControl
{
    if(_pageControl==nil)
    {
        _pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-60, self.view.frame.size.width, 40)];
        _pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
        _pageControl.pageIndicatorTintColor=[UIColor grayColor];
        _pageControl.numberOfPages=4;
        _pageControl.currentPage=0;
        _pageControl.userInteractionEnabled=NO;
    }
    return  _pageControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView=[[UIScrollView alloc] initWithFrame:self.view.frame];
    CGFloat w=self.view.frame.size.width;
    CGFloat h=self.view.frame.size.height;
    self.scrollView.contentSize=CGSizeMake(w*4, h);
    self.scrollView.delegate=self;
    for(int  i=0; i<4;i++)
    {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(w*i,0,w,h)];
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"welcome%d",i+1]];
        [self.scrollView addSubview:imageView];
        imageView.userInteractionEnabled=YES;
        if(i==3)
        {
            UIButton  *button=[UIButton buttonWithType:UIButtonTypeSystem];
            button.frame=CGRectMake((imageView.frame.size.width-200)*0.5, 350, 200, 50);
            [button setTitle:@"欢迎进入系统" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(goLoginVC:) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:button];
        }
        if (i==3) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goLoginVC:)];
            [imageView addGestureRecognizer:tap];
            //开启视图交互
            imageView.userInteractionEnabled=YES;
        }

    }
    //去会条
    self.scrollView.showsHorizontalScrollIndicator=NO;
    //去弹性
    self.scrollView.bounces=NO;
    //整页翻转
    self.scrollView.pagingEnabled=YES;
    [self.view  addSubview:self.scrollView];
    [self.view  addSubview:self.pageControl];
    
    
}
-(void)goLoginVC:(UIButton*)sender
{
    UINavigationController *navi=[[UINavigationController alloc]initWithRootViewController:[LoginViewController new]];
    [self presentViewController:navi animated:YES completion:nil];
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
