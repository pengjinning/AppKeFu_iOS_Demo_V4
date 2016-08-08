//
//  SettingsViewController.swift
//  AppKeFuDemo7Swift
//
//  Created by jack on 16/8/5.
//  Copyright © 2016年 appkefu.com. All rights reserved.
//

import Foundation

class KFSettingsViewController: UITableViewController {
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "设置"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        if (indexPath.row == 0) {
            
            cell.textLabel?.text = NSLocalizedString("PlayVoiceWhenSendMessage", comment: "")
            
            let sendMsgRingSwitch: UISwitch = UISwitch.init()
            sendMsgRingSwitch.addTarget(self, action: #selector(switchSendMsgRing(_:)), forControlEvents: UIControlEvents.ValueChanged)
            
            let flag: Bool = AppKeFuLib.sharedInstance().shouldRingWhenSendMessage()
            if flag != true {
                sendMsgRingSwitch.setOn(false, animated: true)
            }
            else {
                sendMsgRingSwitch.setOn(true, animated: true)
            }
            
            cell.accessoryView = sendMsgRingSwitch;
        }
        else if (indexPath.row == 1) {
            
            cell.textLabel?.text = NSLocalizedString("PlayVoiceWhenReceiveMessage", comment: "")
            
            let receiveMsgRingSwitch: UISwitch = UISwitch.init()
            receiveMsgRingSwitch.addTarget(self, action: #selector(switchReceiveMsgRing(_:)), forControlEvents: UIControlEvents.ValueChanged)
            
            let flag: Bool = AppKeFuLib.sharedInstance().shouldRingWhenReceiveMessage()
            if flag != true {
                receiveMsgRingSwitch.setOn(false, animated: true)
            }
            else {
                receiveMsgRingSwitch.setOn(true, animated: true)
            }
            
            cell.accessoryView = receiveMsgRingSwitch;
            
        }
        else if (indexPath.row == 2) {
            
            cell.textLabel?.text = NSLocalizedString("Vibrate", comment: "")
            
            let msgVibrateSwitch: UISwitch = UISwitch.init();
            msgVibrateSwitch.addTarget(self, action: #selector(switchMsgVibrate(_:)), forControlEvents: UIControlEvents.ValueChanged)
            
            let flag: Bool = AppKeFuLib.sharedInstance().shouldVibrateWhenReceiveMessage()
            if flag != true {
                msgVibrateSwitch.setOn(false, animated: true)
            }
            else {
                msgVibrateSwitch.setOn(true, animated: true)
            }

            cell.accessoryView = msgVibrateSwitch;
        }
        
        return cell;
    }
    
    
    func switchSendMsgRing(sender: UISwitch) ->Void
    {
        let ring: UISwitch = sender 
        AppKeFuLib.sharedInstance().setRingWhenSendMessage(ring.on)
    }
    
    func switchReceiveMsgRing(sender: UISwitch) ->Void
    {
        let ring: UISwitch = sender
        AppKeFuLib.sharedInstance().setRingWhenReceiveMessage(ring.on)
    }
    
    func switchMsgVibrate(sender: UISwitch) ->Void
    {
        let ring: UISwitch = sender
        AppKeFuLib.sharedInstance().setVibrateWhenReceiveMessage(ring.on)
    }
    
}
















