//
//  TagsTableViewController.m
//  [AppKeFuLib sharedInstance]_KeFu_Demo
//
//  Created by jack on 14-4-13.
//  Copyright (c) 2014年 appkefu.com. All rights reserved.
//

#import "TagsTableViewController.h"
#import "TagsChangeTableViewController.h"
#import "AppKeFuLib.h"

@interface TagsTableViewController ()

@end

@implementation TagsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"用户标签列表";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"1.用户昵称";
        cell.detailTextLabel.text = [[AppKeFuLib sharedInstance] getTagNickname];
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"2.性别";
        cell.detailTextLabel.text = [[AppKeFuLib sharedInstance] getTagSex];
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"3.语言";
        cell.detailTextLabel.text = [[AppKeFuLib sharedInstance] getTagLanguage];
    }
    else if (indexPath.row == 3)
    {
        cell.textLabel.text = @"4.城市";
        cell.detailTextLabel.text = [[AppKeFuLib sharedInstance] getTagCity];
    }
    else if (indexPath.row == 4)
    {
        cell.textLabel.text = @"5.省份";
        cell.detailTextLabel.text = [[AppKeFuLib sharedInstance] getTagProvince];
    }
    else if (indexPath.row == 5)
    {
        cell.textLabel.text = @"6.国家";
        cell.detailTextLabel.text = [[AppKeFuLib sharedInstance] getTagCountry];
    }
    else if (indexPath.row == 6)
    {
        cell.textLabel.text = @"7.其他";
        cell.detailTextLabel.text = [[AppKeFuLib sharedInstance] getTagOther];
    }

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    TagsChangeTableViewController *tagsChangeVC = [[TagsChangeTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    if (indexPath.row == 0)
    {
        tagsChangeVC.m_tag = @"NICKNAME";
    }
    else if (indexPath.row == 1)
    {
        tagsChangeVC.m_tag = @"SEX";
    }
    else if (indexPath.row == 2)
    {
        tagsChangeVC.m_tag = @"LANGUAGE";
    }
    else if (indexPath.row == 3)
    {
        tagsChangeVC.m_tag = @"CITY";
    }
    else if (indexPath.row == 4)
    {
        tagsChangeVC.m_tag = @"PROVINCE";
    }
    else if (indexPath.row == 5)
    {
        tagsChangeVC.m_tag = @"COUNTRY";
    }
    else if (indexPath.row == 6)
    {
        tagsChangeVC.m_tag = @"OTHER";
    }
    
    tagsChangeVC.m_value = cell.detailTextLabel.text;
    
    [self.navigationController pushViewController:tagsChangeVC animated:YES];

}

@end



//201581103142hbJKrBcYp2tYk9sh







