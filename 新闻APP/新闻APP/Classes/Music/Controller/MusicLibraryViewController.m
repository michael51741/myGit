//
//  MusicLibraryViewController.m
//  新闻APP
//
//  Created by tarena on 16/8/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MusicLibraryViewController.h"
#import "SongsListCollectionViewController.h"
@interface MusicLibraryViewController ()

@end

@implementation MusicLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat w=self.view.frame.size.width;
    CGFloat h=self.view.frame.size.height;
    //告诉scrollView 别让出64个像素了
    self.automaticallyAdjustsScrollViewInsets = NO;
    //创建下面滚动视图
    UIScrollView *bigSV = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:bigSV];
    bigSV.pagingEnabled = YES;
    bigSV.showsHorizontalScrollIndicator=NO;
    bigSV.bounces=NO;

    bigSV.contentSize = CGSizeMake(2*w, h);
    //创建下面滚动视图
    UIScrollView *smallSV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, w, 150)];
    
    for (int i=0; i<5; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i*375, 0, w, 150)];
        iv.image = [UIImage imageNamed:[NSString stringWithFormat:@"ad0%d",i+1]];
        [smallSV addSubview:iv];
        
        
        
        
    }
    [bigSV addSubview:smallSV];
    smallSV.pagingEnabled = YES;
    smallSV.showsHorizontalScrollIndicator=NO;
    smallSV.bounces=NO;
    smallSV.contentSize = CGSizeMake(w*5, h);
    
    float w1 = (w-3*10)/2;
    
    for (int i=0; i<4; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(10+i%2*(w1+10), i/2*(w1+10)+160+64, w1, w1)];
        iv.image = [UIImage imageNamed:[NSString stringWithFormat:@"channel0%d",i+1]];
        [bigSV addSubview:iv];
        if (i==0) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(newSongsAction)];
            [iv addGestureRecognizer:tap];
            iv.userInteractionEnabled = YES;
        }
        
    }
    
    for (int i=0; i<5; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(10+i%2*(w1+10)+w, i/2*(w1+10)+64+10, w1, w1)];
        iv.image = [UIImage imageNamed:[NSString stringWithFormat:@"channel0%d",i+1+4]];
        [bigSV addSubview:iv];
        if (i==1) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hotSongsAction)];
            [iv addGestureRecognizer:tap];
            iv.userInteractionEnabled = YES;
        }
        
    }
    
    
}
-(void)hotSongsAction{
    
    SongsListCollectionViewController *vc = [SongsListCollectionViewController new];
    vc.type = HotSongs;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
-(void)newSongsAction{
    
    SongsListCollectionViewController *vc = [SongsListCollectionViewController new];
    vc.type = NewSongs;
    [self.navigationController pushViewController:vc animated:YES];
    
    
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
