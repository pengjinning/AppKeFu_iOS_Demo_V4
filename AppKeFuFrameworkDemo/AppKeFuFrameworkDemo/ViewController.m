//
//  ViewController.m
//  AppKeFuDemo7
//
//  Created by jack on 15/9/21.
//  Copyright © 2015年 appkefu.com. All rights reserved.
//

#import "ViewController.h"
#import "TagsTableViewController.h"
#import "KFRightButtonItemCallBackTableViewController.h"
#import "SettingsViewController.h"
#import <AppKeFuFramework/AppKeFuFramework.h>


@interface ViewController ()<UIAlertViewDelegate>

@property (nonatomic, strong) NSString      *onlineStatus;
@property (nonatomic, strong) NSString      *onlineStatus2;

@end

@implementation ViewController

@synthesize onlineStatus, onlineStatus2;

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
    
    self.title = @"微客服4";
    
    onlineStatus = NSLocalizedString(@"1.在线咨询演示1", nil);
    onlineStatus2 = NSLocalizedString(@"2.在线咨询演示2", nil);
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //监听登录状态
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(isConnected:) name:APPKEFU_LOGIN_SUCCEED_NOTIFICATION object:nil];
    
    //监听在线状态
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(notifyOnlineStatus:) name:APPKEFU_WORKGROUP_ONLINESTATUS object:nil];
    
    //监听接收到的消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyMessage:) name:APPKEFU_NOTIFICATION_MESSAGE object:nil];
    
    //监听连接服务器报错
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyXmppStreamDisconnectWithError:) name:APPKEFU_NOTIFICATION_DISCONNECT_WITH_ERROR object:nil];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:APPKEFU_LOGIN_SUCCEED_NOTIFICATION object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:APPKEFU_WORKGROUP_ONLINESTATUS object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:APPKEFU_NOTIFICATION_MESSAGE object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:APPKEFU_NOTIFICATION_DISCONNECT_WITH_ERROR object:nil];
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
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.row == 0)
    {
        cell.textLabel.text = onlineStatus;
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = onlineStatus2;
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"3.电商客服演示";
    }
    else if (indexPath.row == 3)
    {
        cell.textLabel.text = @"4.默认机器人应答";
    }
    else if(indexPath.row == 4)
    {
        cell.textLabel.text = @"5.设置用户标签";
    }
    else if (indexPath.row == 5)
    {
        cell.textLabel.text = @"6.清空聊天记录";
    }
    else if (indexPath.row == 6)
    {
        cell.textLabel.text = @"7.查看FAQ常见问题push";
    }
    else if (indexPath.row == 7)
    {
        cell.textLabel.text = @"8.查看FAQ常见问题present";
    }
    else if (indexPath.row == 8)
    {
        cell.textLabel.text = @"9.提示音设置";
    }
    else if (indexPath.row == 9)
    {
        cell.textLabel.text = @"10.客服中心push(beta)";
    }
    else if (indexPath.row == 10)
    {
        cell.textLabel.text = @"11.客服中心present(beta)";
    }
    else if (indexPath.row == 11)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"12.缓存大小：%@", [[AppKeFuLib sharedInstance] getCacheFileSize]];
    }
    else if (indexPath.row == 12)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"13.未读消息数目: %lu",
                               (unsigned long)[[AppKeFuLib sharedInstance] getUnreadMessageCount:@"wgdemo"]];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //自定义会话页面左上角返回按钮
    UIButton *leftBarButtonItemButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 0, 60, 40)];
    [leftBarButtonItemButton setTitle:@"返回" forState:UIControlStateNormal];
    [leftBarButtonItemButton addTarget:self action:@selector(leftBarButtonItemTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    //自定义会话界面titleView,如果不想自定义,请将对应参数设置为nill
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleView.textColor = [UIColor greenColor];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.text = @"客服小秘书";
    
    //自定义会话界面rightBarButtonItem,如果不想自定义,请将对应参数设置为nill
    UIButton *rightBarButtonItemButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 0, 60, 40)];
    [rightBarButtonItemButton setTitle:@"自定义" forState:UIControlStateNormal];
    [rightBarButtonItemButton addTarget:self action:@selector(rightBarButtonItemTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    if (indexPath.row == 0)
    {
        //第一种打开会话页面方式
        [[AppKeFuLib sharedInstance] pushChatViewController:self.navigationController
                                          withWorkgroupName:@"wgdemo"
                                     hideRightBarButtonItem:NO
                                 rightBarButtonItemCallback:nil
                                     showInputBarSwitchMenu:YES
                                      withLeftBarButtonItem:leftBarButtonItemButton
                                              withTitleView:nil
                                     withRightBarButtonItem:nil
                                            withProductInfo:@"附加信息:如商品信息,订单信息"
                                 withLeftBarButtonItemColor:nil
                                   hidesBottomBarWhenPushed:FALSE
                                         showHistoryMessage:YES
                                               defaultRobot:FALSE
                                                   mustRate:TRUE //注意：如果要强制用户在关闭会话的时候评价，需要首先设置参数：withLeftBarButtonItem，
         // 否则此参数不会生效
                                        withKefuAvatarImage:nil
                                        withUserAvatarImage:nil
         
                                        shouldShowGoodsInfo:FALSE
                                      withGoodsImageViewURL:nil
                                       withGoodsTitleDetail:nil
                                             withGoodsPrice:nil
                                               withGoodsURL:nil
                                        withGoodsCallbackID:nil
                                   goodsInfoClickedCallback:nil
         
                                 httpLinkURLClickedCallBack:nil
                             faqButtonTouchUpInsideCallback:nil];
        
        
    }
    else if (indexPath.row == 1)
    {
        //第二种打开会话页面方式
        [[AppKeFuLib sharedInstance] presentChatViewController:self
                                             withWorkgroupName:@"wgdemo2"
                                        hideRightBarButtonItem:NO
                                    rightBarButtonItemCallback:nil
                                        showInputBarSwitchMenu:YES
                                         withLeftBarButtonItem:nil
                                                 withTitleView:titleView
                                        withRightBarButtonItem:nil
                                               withProductInfo:@"附加信息:如商品信息,订单信息"
                                    withLeftBarButtonItemColor:[UIColor redColor]
                                      hidesBottomBarWhenPushed:FALSE
                                            showHistoryMessage:NO
                                                  defaultRobot:FALSE
                                                      mustRate:FALSE
                                           withKefuAvatarImage:nil
                                           withUserAvatarImage:nil
         
                                           shouldShowGoodsInfo:FALSE
                                         withGoodsImageViewURL:nil
                                          withGoodsTitleDetail:nil
                                                withGoodsPrice:nil
                                                  withGoodsURL:nil
                                           withGoodsCallbackID:nil
                                      goodsInfoClickedCallback:nil
         
                                    httpLinkURLClickedCallBack:nil
                                faqButtonTouchUpInsideCallback:nil];
        
    }
    else if (indexPath.row == 2)
    {
        //电商客服入口
        [[AppKeFuLib sharedInstance] pushChatViewController:self.navigationController
                                          withWorkgroupName:@"wgdemo"
                                     hideRightBarButtonItem:NO
                                 rightBarButtonItemCallback:nil
                                     showInputBarSwitchMenu:NO
                                      withLeftBarButtonItem:nil
                                              withTitleView:nil
                                     withRightBarButtonItem:nil
                                            withProductInfo:nil
                                 withLeftBarButtonItemColor:nil
                                   hidesBottomBarWhenPushed:FALSE
                                         showHistoryMessage:NO
                                               defaultRobot:FALSE
                                                   mustRate:FALSE
                                        withKefuAvatarImage:nil
                                        withUserAvatarImage:nil
         
         //下面5个参数专为显示商品信息设置，具体含义可以参考AppKeFuLib.h文件里面对接口的介绍
                                        shouldShowGoodsInfo:TRUE
                                      withGoodsImageViewURL:@"https://admin.appkefu.com/AppKeFu/images/dingyue.jpg"
                                       withGoodsTitleDetail:@"商品信息商品简介商品简介商品信息商品简介商品简介商品信息商品简介商品简介"
                                             withGoodsPrice:@"￥200000.00"
                                               withGoodsURL:@"http://appkefu.com"
                                        withGoodsCallbackID:@"goodsCallbackId"
                                   goodsInfoClickedCallback:^(NSString *goodsCallbackId) {
                                       //点击商品详情区域会触发此回调函数
                                       NSLog(@"%s this is: %@", __PRETTY_FUNCTION__, goodsCallbackId);
                                   }
         
                                 httpLinkURLClickedCallBack:nil
                             faqButtonTouchUpInsideCallback:^(){
                                 
                                 NSLog(@"faqButtonTouchUpInsideCallback, 自定义FAQ常见问题button回调，可在此打开自己的常见问题FAQ页面");
                                 
                             }];
        
    }
    else if (indexPath.row == 3)
    {
        //默认机器人应答，亦可呼叫人工客服
        [[AppKeFuLib sharedInstance] pushChatViewController:self.navigationController
                                          withWorkgroupName:@"wgdemo"
                                     hideRightBarButtonItem:NO
                                 rightBarButtonItemCallback:nil
                                     showInputBarSwitchMenu:YES
                                      withLeftBarButtonItem:leftBarButtonItemButton
                                              withTitleView:titleView
                                     withRightBarButtonItem:rightBarButtonItemButton
                                            withProductInfo:nil
                                 withLeftBarButtonItemColor:[UIColor whiteColor]
                                   hidesBottomBarWhenPushed:FALSE
                                         showHistoryMessage:FALSE
                                               defaultRobot:TRUE
                                                   mustRate:FALSE
                                        withKefuAvatarImage:nil //[UIImage imageNamed:@"kefu_avatar"]
                                        withUserAvatarImage:[UIImage imageNamed:@"user_avatar"]
         
                                        shouldShowGoodsInfo:FALSE
                                      withGoodsImageViewURL:nil
                                       withGoodsTitleDetail:nil
                                             withGoodsPrice:nil
                                               withGoodsURL:nil
                                        withGoodsCallbackID:nil
                                   goodsInfoClickedCallback:nil
         
                                 httpLinkURLClickedCallBack:^(NSString *url) {
                                     NSLog(@"%@", url);
                                 }
                             faqButtonTouchUpInsideCallback:nil];
    }
    else if (indexPath.row == 4)
    {
        TagsTableViewController *tagVC = [[TagsTableViewController alloc] init];
        [self.navigationController pushViewController:tagVC animated:YES];
    }
    else if (indexPath.row == 5)
    {
        UIAlertView *alerview = [[UIAlertView alloc] initWithTitle:@"提示"
                                                           message:@"确定要清空聊天记录?" delegate:self
                                                 cancelButtonTitle:@"取消"
                                                 otherButtonTitles:@"确定", nil];
        [alerview show];
    }
    else if (indexPath.row == 6)
    {
        [[AppKeFuLib sharedInstance] pushFAQViewController:self.navigationController
                                         withWorkgroupName:@"wgdemo"
                                  hidesBottomBarWhenPushed:YES];
        
    }
    else if (indexPath.row == 7)
    {
        [[AppKeFuLib sharedInstance] presentFAQViewController:self
                                            withWorkgroupName:@"wgdemo"
                                     hidesBottomBarWhenPushed:YES];
    }
    else if (indexPath.row == 8)
    {
        SettingsViewController *settingsVC = [[SettingsViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:settingsVC animated:YES];
    }
    else if (indexPath.row == 9)
    {
        [[AppKeFuLib sharedInstance] pushKFCenterViewController:self.navigationController
                                              withWorkgroupName:@"wgdemo"
                                       hidesBottomBarWhenPushed:YES];
    }
    else if (indexPath.row == 10)
    {
        [[AppKeFuLib sharedInstance] presentKFCenterViewController:self.navigationController
                                                 withWorkgroupName:@"wgdemo"
                                          hidesBottomBarWhenPushed:YES];
    }
    else if (indexPath.row == 11)
    {
        NSLog(@"清空缓存文件");
        [[AppKeFuLib sharedInstance] clearAllFileCache];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark Login Succeed Notification

//接收是否登录成功通知
- (void)isConnected:(NSNotification*)notification
{
    NSNumber *isConnected = [notification object];
    if ([isConnected boolValue])
    {
        //登录成功
        self.title = @"微客服4(登录成功)";
        
        //
        //查询工作组在线状态，需要将wgdemo替换为开发者自己的 “工作组名称”，请在官方管理后台申请，地址：http://appkefu.com/AppKeFu/admin
        [[AppKeFuLib sharedInstance] queryWorkgroupOnlineStatus:@"wgdemo"];
        [[AppKeFuLib sharedInstance] queryWorkgroupOnlineStatus:@"wgdemo2"];
    }
    else
    {
        //登录失败
        self.title = @"微客服4(登录失败)";
        
    }
}

#pragma mark OnlineStatus

//监听工作组在线状态
-(void)notifyOnlineStatus:(NSNotification *)notification
{
    NSDictionary *dict = [notification userInfo];
    
    //客服工作组名称
    NSString *workgroupName = [dict objectForKey:@"workgroupname"];
    
    //客服工作组在线状态
    NSString *status   = [dict objectForKey:@"status"];
    
    NSLog(@"%s workgroupName:%@, status:%@", __PRETTY_FUNCTION__, workgroupName, status);
    
    //
    if ([workgroupName isEqualToString:@"wgdemo"]) {
        
        //客服工作组在线
        if ([status isEqualToString:@"online"])
        {
            onlineStatus = NSLocalizedString(@"1.在线咨询演示1(在线)", nil);
        }
        //客服工作组离线
        else
        {
            onlineStatus = NSLocalizedString(@"1.在线咨询演示2(离线)", nil);
        }
        
    }
    //
    else if ([workgroupName isEqualToString:@"wgdemo2"]) {
        
        //客服工作组在线
        if ([status isEqualToString:@"online"])
        {
            onlineStatus2 = NSLocalizedString(@"2.在线咨询演示2(在线)", nil);
        }
        //客服工作组离线
        else
        {
            onlineStatus2 = NSLocalizedString(@"2.在线咨询演示2(离线)", nil);
        }
    }
    
    
    [self.tableView reloadData];
}

#pragma mark Message

//接收到新消息
- (void)notifyMessage:(NSNotification *)nofication
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    KFMessageItem *msgItem = [nofication object];
    
    //接收到来自客服的消息
    if (!msgItem.isSendFromMe) {
        //
        NSLog(@"消息时间:%@, 工作组名称:%@, 发送消息用户名:%@",
              msgItem.timestamp,
              msgItem.workgroupName,
              msgItem.username);
        
        //文本消息
        if (KFMessageTypeText == msgItem.messageType) {
            
            NSLog(@"文本消息内容：%@", msgItem.messageContent);
        }
        //图片消息
        else if (KFMessageTypeImageHTTPURL == msgItem.messageType)
        {
            NSLog(@"图片消息内容：%@", msgItem.messageContent);
        }
        //语音消息
        else if (KFMessageTypeSoundHTTPURL == msgItem.messageType)
        {
            NSLog(@"语音消息内容：%@", msgItem.messageContent);
        }
    }
    
    [self.tableView reloadData];
}

-(void)notifyXmppStreamDisconnectWithError:(NSNotification *)notification
{
    //登录失败
    self.title = @"微客服4(网络连接失败)";
}


#pragma mark UIAlerviewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%s, %ld", __PRETTY_FUNCTION__, (unsigned long)buttonIndex);
    if (buttonIndex == 1) {
        
        //清空与客服工作组 "wgdemo" 的所有聊天记录
        [[AppKeFuLib sharedInstance] deleteMessagesWith:@"wgdemo"];
        [[AppKeFuLib sharedInstance] deleteMessagesWith:@"wgdemo2"];
    }
}

#pragma mark BarButtonItem
-(void)leftBarButtonItemTouchUpInside:(UIButton *)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


-(void)rightBarButtonItemTouchUpInside:(UIButton *)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    KFRightButtonItemCallBackTableViewController *rightVC = [[KFRightButtonItemCallBackTableViewController alloc] init];
    [self.navigationController pushViewController:rightVC animated:YES];
}


@end





