//
//  WebPlayingViewController.m
//  网络音乐播放
//
//  Created by tarena on 16/8/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WebPlayingViewController.h"
#import "WebUtils.h"
#import "VIMediaCache.h"
#import <AVFoundation/AVFoundation.h>
#import <UIImageView+AFNetworking.h>
@interface WebPlayingViewController ()
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UIImageView *albumIV;
@property (weak, nonatomic) IBOutlet UIImageView *reverseIV;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;
@property (nonatomic, strong)AVPlayer *player;
@property (weak, nonatomic) IBOutlet UIProgressView *downloadPV;
@property (nonatomic, strong)VIResourceLoaderManager *loaderManager;
@property (nonatomic, strong)NSTimer *timer;
@end

@implementation WebPlayingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.albumIV setImageWithURL:self.song.pic_big];
    [self.reverseIV setImageWithURL:self.song.pic_big];
    self.reverseIV.transform= CGAffineTransformMakeScale(1, -1);
    
    
    
    [WebUtils requestMusicInfoWithSongID:self.song.song_id andCallback:^(id obj) {
       
        
        [self playMusicWithPath:obj];
        
    }];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.timer invalidate];
}
//
//
-(void)updateUI{
    
    float totalTime = CMTimeGetSeconds(self.player.currentItem.duration);
    //从当前时间对象中取出当前播放的秒数
    float currentTime = CMTimeGetSeconds(self.player.currentTime);
    self.mySlider.value = currentTime/totalTime;
    
    self.totalTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",(int)totalTime/60,(int)totalTime%60];
    self.currentTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",(int)currentTime/60,(int)currentTime%60];
    
}
-(void)playMusicWithPath:(NSString *)path{
    
    self.loaderManager = [[VIResourceLoaderManager alloc]init];
    //创建播放项
    AVPlayerItem *item = [self.loaderManager playerItemWithURL:[NSURL URLWithString:path]];
    

    self.player = [AVPlayer playerWithPlayerItem:item];
    
    [self.player play];
   
    
//    添加监听
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(downloadAction:) name:VICacheManagerDidUpdateCacheNotification object:nil];
   
    
    
    
    
}

-(void)downloadAction:(NSNotification *)noti{
    
//    NSLog(@"%@",noti.userInfo);
    float total = [noti.userInfo[VICacheContentLengthKey] floatValue];
    NSArray *arr = noti.userInfo[VICacheFragmentsKey];
    if (arr.count>0) {
        float current = [arr[0] rangeValue].length;
        dispatch_async(dispatch_get_main_queue(), ^{
             self.downloadPV.progress = current/total;
        });
        
        if (current==total) {//下载完了
            
            NSString *path = [VICacheManager cachedFilePathForURL:noti.userInfo[VICacheURLKey]];
            NSString *newPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@.mp3",self.song.title];
            [[NSFileManager defaultManager]moveItemAtPath:path toPath:newPath error:nil];
            
            
            
        }
        
    }
    
    
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
