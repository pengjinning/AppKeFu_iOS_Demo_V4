//
//  SettingsViewController.m
//  AppKeFuDemo2
//
//  Created by jack on 15/7/8.
//  Copyright (c) 2015年 appkefu.com. All rights reserved.
//

#import "SettingsViewController.h"
#import "AppKeFuLib.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = NSLocalizedString(@"Settings", nil);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;

    if (indexPath.section == 0) {
        
        static NSString *CellIndentifier = @"MsgSettingsCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIndentifier];
        }
        
        if (indexPath.row == 0) {
            
            cell.textLabel.text = NSLocalizedString(@"PlayVoiceWhenSendMessage",nil);
            
            UISwitch *sendMsgRingSwitch = [[UISwitch alloc] init];
            
            [sendMsgRingSwitch addTarget:self action:@selector(switchSendMsgRing:) forControlEvents:UIControlEventValueChanged];
            
            BOOL flag = [[AppKeFuLib sharedInstance] shouldRingWhenSendMessage];
            
            if (!flag)
            {
                [sendMsgRingSwitch setOn:FALSE animated:TRUE];
            }
            else
            {
                [sendMsgRingSwitch setOn:TRUE animated:TRUE];
            }
            
            cell.accessoryView = sendMsgRingSwitch;
        }
        else if (indexPath.row == 1) {
            
            cell.textLabel.text = NSLocalizedString(@"PlayVoiceWhenReceiveMessage",nil);
            
            UISwitch *receiveMsgRingSwitch = [[UISwitch alloc] init];
            
            [receiveMsgRingSwitch addTarget:self action:@selector(switchReceiveMsgRing:) forControlEvents:UIControlEventValueChanged];
            
            BOOL flag = [[AppKeFuLib sharedInstance] shouldRingWhenReceiveMessage];
            
            if (!flag)
            {
                [receiveMsgRingSwitch setOn:FALSE animated:TRUE];
            }
            else
            {
                [receiveMsgRingSwitch setOn:TRUE animated:TRUE];
            }
            
            cell.accessoryView = receiveMsgRingSwitch;
            
        }
        else if (indexPath.row == 2) {
            
            cell.textLabel.text = NSLocalizedString(@"Vibrate",nil);
            
            UISwitch *msgVibrateSwitch = [[UISwitch alloc] init];
            
            [msgVibrateSwitch addTarget:self action:@selector(switchMsgVibrate:) forControlEvents:UIControlEventValueChanged];
            
            BOOL flag = [[AppKeFuLib sharedInstance] shouldVibrateWhenReceiveMessage];
            
            if (!flag)
            {
                [msgVibrateSwitch setOn:FALSE animated:TRUE];
            }
            else
            {
                [msgVibrateSwitch setOn:TRUE animated:TRUE];
            }
            
            
            cell.accessoryView = msgVibrateSwitch;
        }
        
    }
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 2)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Tip",nil)
                                                        message:NSLocalizedString(@"AreYouSureToClearMessages",nil)
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"Cancel",nil)
                                              otherButtonTitles:NSLocalizedString(@"OK",nil), nil];
        alert.tag = 1;
        [alert show];
    }

    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark 消息提示设置

- (void)switchSendMsgRing:(id)sender
{
    UISwitch *ring = (UISwitch*)sender;
    [[AppKeFuLib sharedInstance] setRingWhenSendMessage:[ring isOn]];
}

- (void)switchReceiveMsgRing:(id)sender
{
    UISwitch *ring = (UISwitch*)sender;
    [[AppKeFuLib sharedInstance] setRingWhenReceiveMessage:[ring isOn]];
}

- (void)switchMsgVibrate:(id)sender
{
    UISwitch *vibrate = (UISwitch*)sender;
    [[AppKeFuLib sharedInstance] setVibrateWhenReceiveMessage:[vibrate isOn]];
}

@end














