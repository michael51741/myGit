//
//  NewsCell.h
//  新闻APP
//
//  Created by tarena on 16/8/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@property (weak, nonatomic) IBOutlet UILabel *newsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic,strong)News *news;
@end
