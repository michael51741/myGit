//
//  NewsCell.m
//  新闻APP
//
//  Created by tarena on 16/8/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+AFNetworking.h"
@implementation NewsCell

- (void)awakeFromNib {
    self.myImageView.layer.cornerRadius=20;
    self.myImageView.layer.masksToBounds=YES;
}
-(void)setNews:(News *)news
{
    _news=news;
    [self.myImageView setImageWithURL:news.thumbnail_pic_s];
    self.newsNameLabel.text=news.title;
    self.timeLabel.text=news.date;
    self.newsInfoLabel.text=news.type;
//    [self.imageView setImageWithURL:news.thumbnail_pic_s02];
//    [self.imageView setImageWithURL:news.thumbnail_pic_s03];
}

@end
