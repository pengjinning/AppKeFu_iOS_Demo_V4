//
//  TagsChangeTableViewController.m
//  AppKeFu_KeFu_Demo
//
//  Created by jack on 14-4-13.
//  Copyright (c) 2014年 appkefu.com. All rights reserved.
//

#import "TagsChangeTableViewController.h"
#import <AppKeFuFramework/AppKeFuFramework.h>

@interface TagsChangeTableViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *tagChangeField;

@end

@implementation TagsChangeTableViewController

@synthesize tagChangeField, m_tag, m_value;

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
    
    self.tableView.allowsSelection = NO;
	self.tableView.allowsSelectionDuringEditing = NO;
    
    self.title = @"修改用户标签";
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    if (tagChangeField != nil) {
        [tagChangeField becomeFirstResponder];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    else
    {
        // the cell is being recycled, remove old embedded controls
        UIView *viewToRemove = nil;
        viewToRemove = [cell.contentView viewWithTag:5];
        if (viewToRemove)
            [viewToRemove removeFromSuperview];
    }
    
    tagChangeField = [[UITextField alloc] initWithFrame:CGRectMake(10, 7, [UIScreen mainScreen].bounds.size.width - 30, 30)];
    tagChangeField.placeholder = @"请输入内容";
    tagChangeField.borderStyle = UITextBorderStyleNone;
    tagChangeField.clearButtonMode = UITextFieldViewModeAlways;
    tagChangeField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tagChangeField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    tagChangeField.returnKeyType = UIReturnKeySend;
    [tagChangeField becomeFirstResponder];
    tagChangeField.delegate = self;
    tagChangeField.text = m_value;
    [cell.contentView addSubview:tagChangeField];
    
    return cell;
}

- (void)tagChange
{
    if ([m_tag isEqualToString:@"NICKNAME"])
    {
        [[AppKeFuLib sharedInstance] setTagNickname:[tagChangeField text]];
    }
    else if ([m_tag isEqualToString:@"SEX"])
    {
        [[AppKeFuLib sharedInstance] setTagSex:[tagChangeField text]];
    }
    else if ([m_tag isEqualToString:@"LANGUAGE"])
    {
        [[AppKeFuLib sharedInstance] setTagLanguage:[tagChangeField text]];
    }
    else if ([m_tag isEqualToString:@"CITY"])
    {
        [[AppKeFuLib sharedInstance] setTagCity:[tagChangeField text]];
    }
    else if ([m_tag isEqualToString:@"PROVINCE"])
    {
        [[AppKeFuLib sharedInstance] setTagProvince:[tagChangeField text]];
    }
    else if ([m_tag isEqualToString:@"COUNTRY"])
    {
        [[AppKeFuLib sharedInstance] setTagCountry:[tagChangeField text]];
    }
    else if ([m_tag isEqualToString:@"OTHER"])
    {
        [[AppKeFuLib sharedInstance] setTagOther:[tagChangeField text]];
    }
    
    [tagChangeField setText:@""];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if([[tagChangeField text] length] <= 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"内容不能为空哦" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
        return FALSE;
    }
    else
    {
        [self tagChange];
    }
    
    return YES;
}

#pragma mark TAP
- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer
{
    [self.view endEditing:YES];
}



@end
