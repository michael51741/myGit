//
//  WebUtils.m
//  新闻APP
//
//  Created by tarena on 16/8/20.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "WebUtils.h"
#import <AFNetworking.h>
#import "News.h"
#import "WebSong.h"
@implementation WebUtils
+(NSArray *)getSongsWithPath:(NSString *)path{
    NSMutableArray *songs = [NSMutableArray array];
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:path error:nil];
    
    for (NSString *fileName in fileNames) {
        if ([fileName hasSuffix:@"mp3"]) {
            NSString *filePath = [path stringByAppendingPathComponent:fileName];
            WebSong *song = [WebSong new];
            song.path = filePath;
            
            NSDictionary *songDic = [WebUtils getMusicInfoByPath:filePath];
            
            song.title = songDic[@"title"];
            song.artist = songDic[@"artist"];
            song.album_title = songDic[@"albumName"];
            
            
            [songs addObject:song];
            
            
            
        }
    }
    
    
    return songs;
    
}
+(NSDictionary *)getMusicInfoByPath:(NSString *)path{
    
    NSMutableDictionary *retDic = [NSMutableDictionary dictionary];
    
    NSURL *u = [NSURL fileURLWithPath:path];
    AVURLAsset *mp3Asset = [AVURLAsset URLAssetWithURL:u options:nil];
    for (NSString *format in [mp3Asset availableMetadataFormats]) {
        for (AVMetadataItem *metadataItem in [mp3Asset metadataForFormat:format]) {
            if(metadataItem.commonKey)
                [retDic setObject:metadataItem.value forKey:metadataItem.commonKey];
            
        }
    }
    
    return retDic;
}


+(NSDictionary *)parseLrcWithPath:(NSString *)path{
    //得到完整的歌词字符串
    NSString *lrcString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    
    //得到每一行
    NSArray *lines = [lrcString componentsSeparatedByString:@"\n"];
    NSMutableDictionary *lrcDic = [NSMutableDictionary dictionary];
    //遍历每一行
    for (NSString *line in lines) {
        //分割出时间和歌词
        NSArray *timeAndText = [line componentsSeparatedByString:@"]"];
        //取出歌词内容
        NSString *text = [timeAndText lastObject];
        //取出时间字符串
        NSString *timeString = [[timeAndText firstObject] substringFromIndex:1];
        //分割出分和秒
        NSArray *timeArr = [timeString componentsSeparatedByString:@":"];
        //得到秒数
        float time = [timeArr[0] intValue]*60+[timeArr[1] floatValue];
        
        //把歌词和时间的对应关系存到字典中
        [lrcDic setObject:text forKey:@(time)];
        
    }
    //把得到的歌词相关字典返回
    return lrcDic;
    
    
}

+(void)requestNewsWithCallback:(MyCallback)callback
{
    NSString *path=@"http://v.juhe.cn/toutiao/index?type=top&key=c591a519321b9bade6370cb3d4d5fc22";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSDictionary *resultDic=dic[@"result"];
        NSArray *arr=resultDic[@"data"];
        NSArray *newses=[News arrayOfModelsFromDictionaries:arr error:nil];
        callback(newses);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
}
+(void)requestHotSongsWithCallback:(MyCallback)callback{
    
    NSString *path = @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.billboard.billList&format=json&type=2&offset=0&size=50";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *arr = dic[@"song_list"];
        NSArray *songs = [WebSong arrayOfModelsFromDictionaries:arr error:nil];
        
        callback(songs);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}

+(void)requestNewSongsWithCallback:(MyCallback)callback{
    
    NSString *path = @"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.billboard.billList&format=json&type=1&offset=0&size=50";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *arr = dic[@"song_list"];
        NSArray *songs = [WebSong arrayOfModelsFromDictionaries:arr error:nil];
        
        callback(songs);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}

+(void)requestMusicInfoWithSongID:(NSString *)songID andCallback:(MyCallback)callback{
    
    NSString *path = [NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.song.getInfos&format=json&songid=%@&ts=1408284347323&e=JoN56kTXnnbEpd9MVczkYJCSx%%2FE1mkLx%%2BPMIkTcOEu4%%3D&nw=2&ucf=1&res=1",songID];
    
    
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSDictionary *songDic = [dic[@"songurl"][@"url"]firstObject];
        
        NSString *fileLink = songDic[@"file_link"];
        
        callback(fileLink);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

+(void)requestSongsWithSongName:(NSString *)songName andCallback:(MyCallback)callback{
    
    
    NSString *path = [NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.search.common&format=json&query=%@&page_no=1&page_size=30",songName];
    //进行url编码
    path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    
    
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *songArr = dic[@"song_list"]  ;
        
        NSArray *songs = [WebSong arrayOfModelsFromDictionaries:songArr error:nil];
        
        
        
        callback(songs);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
    
}

@end
