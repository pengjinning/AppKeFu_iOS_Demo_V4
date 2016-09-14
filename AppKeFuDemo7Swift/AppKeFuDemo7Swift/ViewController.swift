//
//  ViewController.swift
//  AppKeFuDemo7Swift
//
//  Created by jack on 16/8/5.
//  Copyright © 2016年 appkefu.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UIAlertViewDelegate {
    
    var onlineStatus1 = "", onlineStatus2 = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "微客服4"
        
        self.onlineStatus1 = "1.push在线咨询演示1"
        self.onlineStatus2 = "2.present在线咨询演示2"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //监听登录状态
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(isConnected(_:)), name: APPKEFU_LOGIN_SUCCEED_NOTIFICATION, object: nil)
        
        //监听在线状态
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(notifyOnlineStatus(_:)), name: APPKEFU_WORKGROUP_ONLINESTATUS, object: nil)
        
        //监听接收到的消息
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(notifyMessage(_:)), name: APPKEFU_NOTIFICATION_MESSAGE, object: nil)
        
        //监听连接服务器报错
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(notifyXmppStreamDisconnectWithError(_:)), name: APPKEFU_NOTIFICATION_DISCONNECT_WITH_ERROR, object: nil)
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        // Configure the cell...
        if (indexPath.row == 0)
        {
            cell.textLabel?.text = onlineStatus1;
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel?.text = onlineStatus2;
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel?.text = "3.电商客服演示";
        }
        else if (indexPath.row == 3)
        {
            cell.textLabel?.text = "4.默认机器人应答";
        }
        else if(indexPath.row == 4)
        {
            cell.textLabel?.text = "5.设置用户标签";
        }
        else if (indexPath.row == 5)
        {
            cell.textLabel?.text = "6.清空聊天记录";
        }
        else if (indexPath.row == 6)
        {
            cell.textLabel?.text = "7.查看FAQ常见问题push";
        }
        else if (indexPath.row == 7)
        {
            cell.textLabel?.text = "8.查看FAQ常见问题present";
        }
        else if (indexPath.row == 8)
        {
            cell.textLabel?.text = "9.提示音设置";
        }
        else if (indexPath.row == 9)
        {
            cell.textLabel?.text = NSString.init(format: "10.缓存大小：%@", AppKeFuLib.sharedInstance().getCacheFileSize()) as String;
        }
        else if (indexPath.row == 10)
        {
            cell.textLabel?.text = NSString.init(format: "11.未读消息数目: %lu", AppKeFuLib.sharedInstance().getUnreadMessageCount("wgdemo")) as String;
        }
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //自定义会话页面左上角返回按钮
        let leftBarButtonItemButton: UIButton = UIButton.init(frame: CGRectMake(40, 0, 60, 40))
        leftBarButtonItemButton.setTitle("返回", forState: UIControlState.Normal)
        leftBarButtonItemButton.addTarget(self, action: #selector(leftBarButtonItemTouchUpInside(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        //自定义会话界面titleView,如果不想自定义,请将对应参数设置为nill
        let titleView = UILabel.init(frame: CGRectMake(0, 0, 200, 44))
        titleView.textColor = UIColor.greenColor()
        titleView.textAlignment = NSTextAlignment.Center
        titleView.text = "客服小秘书"
        
        //自定义会话界面rightBarButtonItem,如果不想自定义,请将对应参数设置为nill
        let rightBarButtonItemButton = UIButton.init(frame: CGRectMake(40, 0, 60, 40))
        rightBarButtonItemButton.setTitle("自定义", forState: UIControlState.Normal)
        rightBarButtonItemButton.addTarget(self, action: #selector(rightBarButtonItemTouchUpInside(_:)), forControlEvents: UIControlEvents.TouchUpInside)

        
        if (indexPath.row == 0)
        {
            
            //第一种打开会话页面方式
            AppKeFuLib.sharedInstance().pushChatViewController(self.navigationController,
                                                               withWorkgroupName: "wgdemo",
                                                               hideRightBarButtonItem: false,
                                                               rightBarButtonItemCallback: nil,
                                                               showInputBarSwitchMenu: true,
                                                               withLeftBarButtonItem: leftBarButtonItemButton,
                                                               withTitleView: titleView,
                                                               withRightBarButtonItem: nil,
                                                               withProductInfo: "附加信息:如商品信息,订单信息",
                                                               withLeftBarButtonItemColor: nil,
                                                               hidesBottomBarWhenPushed: false,
                                                               showHistoryMessage: true,
                                                               defaultRobot: false,
                                                               mustRate: true,
                                                               withKefuAvatarImage: nil,
                                                               withUserAvatarImage: nil,
                                                               
                                                               shouldShowGoodsInfo: false,
                                                               withGoodsImageViewURL: nil,
                                                               withGoodsTitleDetail: nil,
                                                               withGoodsPrice: nil,
                                                               withGoodsURL: nil,
                                                               withGoodsCallbackID: nil,
                                                               goodsInfoClickedCallback: nil,
                                                               
                                                               httpLinkURLClickedCallBack: nil,
                                                               faqButtonTouchUpInsideCallback: nil)
            
            
        }
        else if (indexPath.row == 1)
        {
            //第二种打开会话页面方式
            AppKeFuLib.sharedInstance().presentChatViewController(self,
                                                                  withWorkgroupName: "wgdemo2",
                                                                  hideRightBarButtonItem: false,
                                                                  rightBarButtonItemCallback: nil,
                                                                  showInputBarSwitchMenu: true,
                                                                  withLeftBarButtonItem: nil,
                                                                  withTitleView: titleView,
                                                                  withRightBarButtonItem: nil,
                                                                  withProductInfo: "附加信息:如商品信息,订单信息",
                                                                  withLeftBarButtonItemColor: UIColor.redColor(),
                                                                  hidesBottomBarWhenPushed: false,
                                                                  showHistoryMessage: false,
                                                                  defaultRobot: false,
                                                                  mustRate: false,
                                                                  
                                                                  withKefuAvatarImage: nil,
                                                                  withUserAvatarImage: nil,
                                                                  
                                                                  shouldShowGoodsInfo: false,
                                                                  withGoodsImageViewURL: nil,
                                                                  withGoodsTitleDetail: nil,
                                                                  withGoodsPrice: nil,
                                                                  withGoodsURL: nil,
                                                                  withGoodsCallbackID: nil,
                                                                  goodsInfoClickedCallback: nil,
                                                                  
                                                                  httpLinkURLClickedCallBack: nil,
                                                                  faqButtonTouchUpInsideCallback: nil)
            
            
        }
        else if (indexPath.row == 2)
        {
            AppKeFuLib.sharedInstance().pushChatViewController(self.navigationController,
                                                               withWorkgroupName: "wgdemo",
                                                               hideRightBarButtonItem: false,
                                                               rightBarButtonItemCallback: nil,
                                                               showInputBarSwitchMenu: false,
                                                               withLeftBarButtonItem: nil,
                                                               withTitleView: nil,
                                                               withRightBarButtonItem: nil,
                                                               withProductInfo: nil,
                                                               withLeftBarButtonItemColor: nil,
                                                               hidesBottomBarWhenPushed: false,
                                                               showHistoryMessage: false,
                                                               defaultRobot: false,
                                                               mustRate: false,
                                                               withKefuAvatarImage: nil,
                                                               withUserAvatarImage: nil,
                                                               shouldShowGoodsInfo: true,
                                                               withGoodsImageViewURL: "http://admin.appkefu.com/AppKeFu/images/dingyue.jpg",
                                                               withGoodsTitleDetail: "商品信息商品简介商品简介商品信息商品简介商品简介商品信息商品简介商品简介",
                                                               withGoodsPrice: "￥200000.00",
                                                               withGoodsURL: "http://appkefu.com",
                                                               withGoodsCallbackID: "goodsCallbackId",
                                                               goodsInfoClickedCallback: { (goodsCallbackId) in
                                                                
                                                                NSLog("this is: %@", goodsCallbackId);
                                                                
                                                               },
                                                               httpLinkURLClickedCallBack: nil,
                                                               faqButtonTouchUpInsideCallback: {
                                                                
                                                                NSLog("faqButtonTouchUpInsideCallback, 自定义FAQ常见问题button回调，可在此打开自己的常见问题FAQ页面");
                                                               })
            
            
        }
        else if (indexPath.row == 3)
        {
            //默认机器人应答，亦可呼叫人工客服
            AppKeFuLib.sharedInstance().pushChatViewController(self.navigationController,
                                                               withWorkgroupName: "wgdemo",
                                                               hideRightBarButtonItem: false,
                                                               rightBarButtonItemCallback: nil,
                                                               showInputBarSwitchMenu: true,
                                                               withLeftBarButtonItem: leftBarButtonItemButton,
                                                               withTitleView: titleView,
                                                               withRightBarButtonItem: rightBarButtonItemButton,
                                                               withProductInfo: nil,
                                                               withLeftBarButtonItemColor: UIColor.whiteColor(),
                                                               hidesBottomBarWhenPushed: false,
                                                               showHistoryMessage: false,
                                                               defaultRobot: true,
                                                               mustRate: false,
                                                               withKefuAvatarImage: nil,
                                                               withUserAvatarImage: UIImage.init(named: "user_avatar"),
                                                               shouldShowGoodsInfo: false,
                                                               withGoodsImageViewURL: nil,
                                                               withGoodsTitleDetail: nil,
                                                               withGoodsPrice: nil,
                                                               withGoodsURL: nil,
                                                               withGoodsCallbackID: nil,
                                                               goodsInfoClickedCallback: nil,
                                                               httpLinkURLClickedCallBack: { (url) in
                                                                
                                                               },
                                                               faqButtonTouchUpInsideCallback: nil)
            
        }
            
        else if (indexPath.row == 4)
        {
            let tagVC: KFTagsTableViewController = KFTagsTableViewController.init(style: UITableViewStyle.Plain)
            self.navigationController?.pushViewController(tagVC, animated: true)
        }
        else if (indexPath.row == 5)
        {
            let alerview: UIAlertView = UIAlertView.init(title: "提示", message: "确定要清空聊天记录?", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
            alerview.show()
        }
        else if (indexPath.row == 6)
        {
            AppKeFuLib.sharedInstance().pushFAQViewController(self.navigationController, withWorkgroupName: "wgdemo", hidesBottomBarWhenPushed: true)
        }
        else if (indexPath.row == 7)
        {
            AppKeFuLib.sharedInstance().presentFAQViewController(self, withWorkgroupName: "wgdemo", hidesBottomBarWhenPushed: true)
        }
        else if (indexPath.row == 8)
        {
            let settingsVC: KFSettingsViewController = KFSettingsViewController.init(style: UITableViewStyle.Plain)
            self.navigationController?.pushViewController(settingsVC, animated: true)
        }
        else if (indexPath.row == 9)
        {
            AppKeFuLib.sharedInstance().clearAllFileCache()
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    

    /**/
    func isConnected(notification: NSNotification) -> Void {
        
        let connected = notification.object
        if connected?.boolValue == true {
            
            self.title = "微客服4(登录成功)";
            
            AppKeFuLib.sharedInstance().queryWorkgroupOnlineStatus("wgdemo")
            AppKeFuLib.sharedInstance().queryWorkgroupOnlineStatus("wgdemo2")
        }
        else {
            
            self.title = "微客服4(登录失败)"
        }
        
    }
    
    /**/
    func notifyOnlineStatus(notification: NSNotification) -> Void {
        
        let dict: NSDictionary = notification.userInfo!
        let workgroupname = dict.objectForKey("workgroupname")
        let status = dict.objectForKey("status")
        
        if workgroupname!.isEqualToString("wgdemo") {
            
            if status!.isEqualToString("online") {
                onlineStatus1 = "1.push在线咨询演示1(在线)"
            }
            else {
                onlineStatus1 = "1.push在线咨询演示1(离线)"
            }
        }
        else if workgroupname!.isEqualToString("wgdemo2") {
        
            if status!.isEqualToString("online") {
                onlineStatus2 = "2.present在线咨询演示2(在线)"
            }
            else {
                onlineStatus2 = "2.present在线咨询演示2(离线)"
            }
        }
        
        self.tableView.reloadData()
    }
    
    /**/
    func notifyMessage(notification: NSNotification) -> Void {
        
        let messageItem = notification.object
        
        if messageItem!.isSendFromMe == false {
            
            NSLog("消息时间:%@, 工作组名称:%@, 发送消息用户名:%@",
                  messageItem!.timestamp, messageItem!.workgroupName, messageItem!.username)
            
            //文本消息
            if KFMessageTypeText == messageItem!.messageType {
                
                NSLog("文本消息内容: %@", messageItem!.messageContent)
            }
            //图片消息
            else if KFMessageTypeImageHTTPURL == messageItem!.messageType {
            
                NSLog("图片消息内容: %@", messageItem!.messageContent)
            }
            //语音消息
            else if KFMessageTypeSoundHTTPURL == messageItem!.messageType {
            
                NSLog("语音消息内容: %@", messageItem!.messageContent)
            }
        }
        
        self.tableView.reloadData()
    }
    
    /**/
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 {
            
            //清空与客服工作组 "wgdemo"、"wgdemo2" 的所有聊天记录
            AppKeFuLib.sharedInstance().deleteMessagesWith("wgdemo")
            AppKeFuLib.sharedInstance().deleteMessagesWith("wgdemo2")
        }
        
    }
    
    /**/
    func notifyXmppStreamDisconnectWithError(notification: NSNotification) -> Void {
        
        self.title = "微客服4(网络连接失败)"
        
    }

    /**/
    func leftBarButtonItemTouchUpInside(sender: UIButton) -> Void {
        NSLog("leftBarButtonItemTouchUpInside")
    }
    
    /**/
    func rightBarButtonItemTouchUpInside(sender: UIButton) -> Void {
        
        let rightVC: KFRightButtonItemCallBackTableViewController = KFRightButtonItemCallBackTableViewController.init()
        self.navigationController?.pushViewController(rightVC, animated: true)
        
    }

}




















