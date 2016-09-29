//
//  WebUtils.h
//  新闻APP
//
//  Created by tarena on 16/8/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MyCallback)(id obj);
@interface WebUtils : NSObject
+(NSArray *)getSongsWithPath:(NSString *)path;
+(NSDictionary *)getMusicInfoByPath:(NSString *)path;
+(NSArray *)getSongsWithPath:(NSString *)path;
+(void)requestNewsWithCallback:(MyCallback)callback;
+(void)requestNewSongsWithCallback:(MyCallback)callback;
+(void)requestHotSongsWithCallback:(MyCallback)callback;

+(void)requestMusicInfoWithSongID:(NSString *)songID andCallback:(MyCallback)callback;
+(void)requestSongsWithSongName:(NSString *)songName andCallback:(MyCallback)callback;
@end
