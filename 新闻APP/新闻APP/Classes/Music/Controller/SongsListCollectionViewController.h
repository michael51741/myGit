//
//  SongsListCollectionViewController.h
//  网络音乐播放
//
//  Created by tarena on 16/8/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, MySongType) {
    NewSongs,
    HotSongs
};
@interface SongsListCollectionViewController : UIViewController
@property (nonatomic)MySongType type;
@end
