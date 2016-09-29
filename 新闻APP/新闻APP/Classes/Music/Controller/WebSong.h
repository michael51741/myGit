//
//  Song.h
//  JsonModal新歌榜
//
//  Created by tarena on 16/8/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface WebSong : JSONModel
@property (nonatomic, copy)NSString<Optional> *path;
@property (nonatomic, copy)NSString<Optional> *artist;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *author;
@property (nonatomic, copy)NSString *album_title;
@property (nonatomic, copy)NSString *song_id;
@property (nonatomic, strong)NSURL<Optional> *pic_big;
@property (nonatomic, strong)NSNumber<Optional> *hot;
@end
