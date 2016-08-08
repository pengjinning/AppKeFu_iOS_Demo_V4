//
//  TagsChangeTableViewController.swift
//  AppKeFuDemo7Swift
//
//  Created by jack on 16/8/5.
//  Copyright © 2016年 appkefu.com. All rights reserved.
//

import Foundation

class KFTagsChangeTableViewController: UITableViewController, UITextFieldDelegate {
    
    
    var tag: NSString = "", value: String = ""
    var tagChangeField: UITextField = UITextField.init();
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "修改用户标签"
        self.tableView.allowsSelection = false
        self.tableView.allowsSelectionDuringEditing = false
        
        let singleFingerTap: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(handleSingleTap(_:)))
        self.view.addGestureRecognizer(singleFingerTap)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tagChangeField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    // MARK: - Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        tagChangeField.frame = CGRectMake(10, 7, UIScreen.mainScreen().bounds.size.width - 30, 30)
        tagChangeField.placeholder = "请输入内容";
        
        tagChangeField.borderStyle = UITextBorderStyle.None;
        tagChangeField.clearButtonMode = UITextFieldViewMode.Always;
        tagChangeField.autocapitalizationType = UITextAutocapitalizationType.None;
        
        tagChangeField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center;
        tagChangeField.returnKeyType = UIReturnKeyType.Send;
        tagChangeField.becomeFirstResponder();
        tagChangeField.delegate = self;
        tagChangeField.text = value as String;
        
        cell.contentView.addSubview(tagChangeField)
        
        return cell;
    }
    
    /*
     */
    func tagChange() -> Void {
        
        if (tag.isEqualToString("NICKNAME"))
        {
            AppKeFuLib.sharedInstance().setTagNickname(tagChangeField.text)
        }
        else if (tag.isEqualToString("SEX"))
        {
            AppKeFuLib.sharedInstance().setTagSex(tagChangeField.text)
        }
        else if (tag.isEqualToString("LANGUAGE"))
        {
            AppKeFuLib.sharedInstance().setTagLanguage(tagChangeField.text)
        }
        else if (tag.isEqualToString("CITY"))
        {
            AppKeFuLib.sharedInstance().setTagCity(tagChangeField.text)
        }
        else if (tag.isEqualToString("PROVINCE"))
        {
            AppKeFuLib.sharedInstance().setTagProvince(tagChangeField.text)
        }
        else if (tag.isEqualToString("COUNTRY"))
        {
            AppKeFuLib.sharedInstance().setTagCountry(tagChangeField.text)
        }
        else if (tag.isEqualToString("OTHER"))
        {
            AppKeFuLib.sharedInstance().setTagOther(tagChangeField.text)
        }
        
        tagChangeField.text = "";
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    /*
     */
    func textFieldShouldReturn(textFiled: UITextField) -> Bool {
        
        if(tagChangeField.text?.lengthOfBytesUsingEncoding(NSStringEncoding.init()) <= 0)
        {
            let alert: UIAlertView = UIAlertView.init(title: "提示", message: "内容不能为空", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
            
            return false;
        }
        else
        {
            self.tagChange()
        }
        
        return true;
        
    }
    
    /*
     */
    func handleSingleTap(gestureRecognizer: UIGestureRecognizer) -> Void {
        
        self.view.endEditing(true)
    }
    
    
}

