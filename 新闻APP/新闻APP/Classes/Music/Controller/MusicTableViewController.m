//
//  MusicTableViewController.m
//  新闻APP
//
//  Created by tarena on 16/8/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MusicTableViewController.h"
#import "MusicLibraryViewController.h"
#import "WebUtils.h"
@interface MusicTableViewController ()
@property (nonatomic, strong)NSArray *songs;

@end

@implementation MusicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/"];
    self.songs = [WebUtils getSongsWithPath:path];
    [self.tableView reloadData];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) return 3;
    else if(section == 1) return 3;
    else return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        
    }
    //取出当前 分区号
    NSInteger section = indexPath.section;
    //取出当前 行号
    NSInteger row = indexPath.row;
    switch (section) {
        case 0:
            if(row==0){
                cell.textLabel.text = @"全部歌曲";
                cell.detailTextLabel.text=[NSString stringWithFormat:@"%ld 首",self.songs.count];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

            }
            else if (row==1){
                cell.textLabel.text=@"音乐库";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            else
            {
                cell.textLabel.text=@"下载歌曲";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            return cell;
        case 1:
            if(row==0){
                cell.textLabel.text = @"我喜欢";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            else if (row==1){
                cell.textLabel.text=@"最近播放";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            else
            {
                cell.textLabel.text=@"点歌记录";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            return cell;
            
        default:
            cell.textLabel.text = @"轻音乐";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
            
    }

    
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) return @"";
    else if(section == 1) return @"";
    else return @"我的歌单";

    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0&&indexPath.row==1)
    {
        MusicLibraryViewController *mlvc=[MusicLibraryViewController new];
        [self.navigationController pushViewController:mlvc animated:YES];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
