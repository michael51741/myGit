//
//  News.h
//  新闻APP
//
//  Created by tarena on 16/8/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
@interface News : JSONModel
@property (nonatomic,copy)NSString *date;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *type;
@property (nonatomic,strong)NSURL<Optional> *thumbnail_pic_s;
@property (nonatomic,strong)NSURL<Optional> *thumbnail_pic_s02;
@property (nonatomic,strong)NSURL<Optional> *thumbnail_pic_s03;
@property (nonatomic,copy)NSString *url;
@end
