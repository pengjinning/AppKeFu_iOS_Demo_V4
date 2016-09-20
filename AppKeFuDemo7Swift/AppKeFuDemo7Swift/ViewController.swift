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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //监听登录状态
        NotificationCenter.default.addObserver(self, selector: #selector(isConnected(_:)), name: NSNotification.Name(rawValue: APPKEFU_LOGIN_SUCCEED_NOTIFICATION), object: nil)
        
        //监听在线状态
        NotificationCenter.default.addObserver(self, selector: #selector(notifyOnlineStatus(_:)), name: NSNotification.Name(rawValue: APPKEFU_WORKGROUP_ONLINESTATUS), object: nil)
        
        //监听接收到的消息
        NotificationCenter.default.addObserver(self, selector: #selector(notifyMessage(_:)), name: NSNotification.Name(rawValue: APPKEFU_NOTIFICATION_MESSAGE), object: nil)
        
        //监听连接服务器报错
        NotificationCenter.default.addObserver(self, selector: #selector(notifyXmppStreamDisconnectWithError(_:)), name: NSNotification.Name(rawValue: APPKEFU_NOTIFICATION_DISCONNECT_WITH_ERROR), object: nil)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // Configure the cell...
        if ((indexPath as NSIndexPath).row == 0)
        {
            cell.textLabel?.text = onlineStatus1;
        }
        else if ((indexPath as NSIndexPath).row == 1)
        {
            cell.textLabel?.text = onlineStatus2;
        }
        else if ((indexPath as NSIndexPath).row == 2)
        {
            cell.textLabel?.text = "3.电商客服演示";
        }
        else if ((indexPath as NSIndexPath).row == 3)
        {
            cell.textLabel?.text = "4.默认机器人应答";
        }
        else if((indexPath as NSIndexPath).row == 4)
        {
            cell.textLabel?.text = "5.设置用户标签";
        }
        else if ((indexPath as NSIndexPath).row == 5)
        {
            cell.textLabel?.text = "6.清空聊天记录";
        }
        else if ((indexPath as NSIndexPath).row == 6)
        {
            cell.textLabel?.text = "7.查看FAQ常见问题push";
        }
        else if ((indexPath as NSIndexPath).row == 7)
        {
            cell.textLabel?.text = "8.查看FAQ常见问题present";
        }
        else if ((indexPath as NSIndexPath).row == 8)
        {
            cell.textLabel?.text = "9.提示音设置";
        }
        else if ((indexPath as NSIndexPath).row == 9)
        {
            cell.textLabel?.text = NSString.init(format: "10.缓存大小：%@", AppKeFuLib.sharedInstance().getCacheFileSize()) as String;
        }
        else if ((indexPath as NSIndexPath).row == 10)
        {
            cell.textLabel?.text = NSString.init(format: "11.未读消息数目: %lu", AppKeFuLib.sharedInstance().getUnreadMessageCount("wgdemo")) as String;
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //自定义会话页面左上角返回按钮
        let leftBarButtonItemButton: UIButton = UIButton.init(frame: CGRect(x: 40, y: 0, width: 60, height: 40))
        leftBarButtonItemButton.setTitle("返回", for: UIControlState())
        leftBarButtonItemButton.addTarget(self, action: #selector(leftBarButtonItemTouchUpInside(_:)), for: UIControlEvents.touchUpInside)
        
        //自定义会话界面titleView,如果不想自定义,请将对应参数设置为nill
        let titleView = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        titleView.textColor = UIColor.green
        titleView.textAlignment = NSTextAlignment.center
        titleView.text = "客服小秘书"
        
        //自定义会话界面rightBarButtonItem,如果不想自定义,请将对应参数设置为nill
        let rightBarButtonItemButton = UIButton.init(frame: CGRect(x: 40, y: 0, width: 60, height: 40))
        rightBarButtonItemButton.setTitle("自定义", for: UIControlState())
        rightBarButtonItemButton.addTarget(self, action: #selector(rightBarButtonItemTouchUpInside(_:)), for: UIControlEvents.touchUpInside)

        
        if ((indexPath as NSIndexPath).row == 0)
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
        else if ((indexPath as NSIndexPath).row == 1)
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
                                                                  withLeftBarButtonItemColor: UIColor.red,
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
        else if ((indexPath as NSIndexPath).row == 2)
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
                                                                
                                                                print("this is: %@", goodsCallbackId);
                                                                
                                                               },
                                                               httpLinkURLClickedCallBack: nil,
                                                               faqButtonTouchUpInsideCallback: {
                                                                
                                                                NSLog("faqButtonTouchUpInsideCallback, 自定义FAQ常见问题button回调，可在此打开自己的常见问题FAQ页面");
                                                               })
            
            
        }
        else if ((indexPath as NSIndexPath).row == 3)
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
                                                               withLeftBarButtonItemColor: UIColor.white,
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
            
        else if ((indexPath as NSIndexPath).row == 4)
        {
            let tagVC: KFTagsTableViewController = KFTagsTableViewController.init(style: UITableViewStyle.plain)
            self.navigationController?.pushViewController(tagVC, animated: true)
        }
        else if ((indexPath as NSIndexPath).row == 5)
        {
            let alerview: UIAlertView = UIAlertView.init(title: "提示", message: "确定要清空聊天记录?", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
            alerview.show()
        }
        else if ((indexPath as NSIndexPath).row == 6)
        {
            AppKeFuLib.sharedInstance().pushFAQViewController(self.navigationController, withWorkgroupName: "wgdemo", hidesBottomBarWhenPushed: true)
        }
        else if ((indexPath as NSIndexPath).row == 7)
        {
            AppKeFuLib.sharedInstance().presentFAQViewController(self, withWorkgroupName: "wgdemo", hidesBottomBarWhenPushed: true)
        }
        else if ((indexPath as NSIndexPath).row == 8)
        {
            let settingsVC: KFSettingsViewController = KFSettingsViewController.init(style: UITableViewStyle.plain)
            self.navigationController?.pushViewController(settingsVC, animated: true)
        }
        else if ((indexPath as NSIndexPath).row == 9)
        {
            AppKeFuLib.sharedInstance().clearAllFileCache()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    /**/
    func isConnected(_ notification: Notification) -> Void {
        
        let connected = notification.object
        if (connected! as AnyObject).boolValue == true {
            
            self.title = "微客服4(登录成功)";
            
            AppKeFuLib.sharedInstance().queryWorkgroupOnlineStatus("wgdemo")
            AppKeFuLib.sharedInstance().queryWorkgroupOnlineStatus("wgdemo2")
        }
        else {
            
            self.title = "微客服4(登录失败)"
        }
        
    }
    
    /**/
    func notifyOnlineStatus(_ notification: Notification) -> Void {
        
        let dict: NSDictionary = (notification as NSNotification).userInfo! as NSDictionary
        let workgroupname = dict.object(forKey: "workgroupname")
        let status = dict.object(forKey: "status")
        
        if (workgroupname! as AnyObject).isEqual(to: "wgdemo") {
            
            if (status! as AnyObject).isEqual(to: "online") {
                onlineStatus1 = "1.push在线咨询演示1(在线)"
            }
            else {
                onlineStatus1 = "1.push在线咨询演示1(离线)"
            }
        }
        else if (workgroupname! as AnyObject).isEqual(to: "wgdemo2") {
        
            if (status! as AnyObject).isEqual(to: "online") {
                onlineStatus2 = "2.present在线咨询演示2(在线)"
            }
            else {
                onlineStatus2 = "2.present在线咨询演示2(离线)"
            }
        }
        
        self.tableView.reloadData()
    }
    
    /**/
    func notifyMessage(_ notification: Notification) -> Void {
        
        let messageItem = notification.object
        
        if (messageItem! as AnyObject).isSendFromMe == false {
            
            NSLog("消息时间:%@, 工作组名称:%@, 发送消息用户名:%@",
                  (messageItem! as AnyObject).timestamp, (messageItem! as AnyObject).workgroupName, (messageItem! as AnyObject).username)
            
            //文本消息
            if KFMessageTypeText == (messageItem! as AnyObject).messageType {
                
                NSLog("文本消息内容: %@", (messageItem! as AnyObject).messageContent)
            }
            //图片消息
            else if KFMessageTypeImageHTTPURL == (messageItem! as AnyObject).messageType {
            
                NSLog("图片消息内容: %@", (messageItem! as AnyObject).messageContent)
            }
            //语音消息
            else if KFMessageTypeSoundHTTPURL == (messageItem! as AnyObject).messageType {
            
                NSLog("语音消息内容: %@", (messageItem! as AnyObject).messageContent)
            }
        }
        
        self.tableView.reloadData()
    }
    
    /**/
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        
        if buttonIndex == 1 {
            
            //清空与客服工作组 "wgdemo"、"wgdemo2" 的所有聊天记录
            AppKeFuLib.sharedInstance().deleteMessages(with: "wgdemo")
            AppKeFuLib.sharedInstance().deleteMessages(with: "wgdemo2")
        }
        
    }
    
    /**/
    func notifyXmppStreamDisconnectWithError(_ notification: Notification) -> Void {
        
        self.title = "微客服4(网络连接失败)"
        
    }

    /**/
    func leftBarButtonItemTouchUpInside(_ sender: UIButton) -> Void {
        NSLog("leftBarButtonItemTouchUpInside")
    }
    
    /**/
    func rightBarButtonItemTouchUpInside(_ sender: UIButton) -> Void {
        
        let rightVC: KFRightButtonItemCallBackTableViewController = KFRightButtonItemCallBackTableViewController.init()
        self.navigationController?.pushViewController(rightVC, animated: true)
        
    }

}




















