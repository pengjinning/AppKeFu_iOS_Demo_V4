//
//  TagsChangeTableViewController.swift
//  AppKeFuDemo7Swift
//
//  Created by jack on 16/8/5.
//  Copyright © 2016年 appkefu.com. All rights reserved.
//

import Foundation

class KFTagsChangeTableViewController: UITableViewController, UITextFieldDelegate {
    
    
    var tag: NSString? = "", value: String? = ""
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tagChangeField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        tagChangeField.frame = CGRect(x: 10, y: 7, width: UIScreen.main.bounds.size.width - 30, height: 30)
        tagChangeField.placeholder = "请输入内容";
        
        tagChangeField.borderStyle = UITextBorderStyle.none;
        tagChangeField.clearButtonMode = UITextFieldViewMode.always;
        tagChangeField.autocapitalizationType = UITextAutocapitalizationType.none;
        
        tagChangeField.contentVerticalAlignment = UIControlContentVerticalAlignment.center;
        tagChangeField.returnKeyType = UIReturnKeyType.send;
        tagChangeField.becomeFirstResponder();
        tagChangeField.delegate = self;
        tagChangeField.text = value! as String;
        
        cell.contentView.addSubview(tagChangeField)
        
        return cell;
    }
    
    /*
     */
    func tagChange() -> Void {
        
        if (tag!.isEqual(to: "NICKNAME"))
        {
            AppKeFuLib.sharedInstance().setTagNickname(tagChangeField.text)
        }
        else if (tag!.isEqual(to: "SEX"))
        {
            AppKeFuLib.sharedInstance().setTagSex(tagChangeField.text)
        }
        else if (tag!.isEqual(to: "LANGUAGE"))
        {
            AppKeFuLib.sharedInstance().setTagLanguage(tagChangeField.text)
        }
        else if (tag!.isEqual(to: "CITY"))
        {
            AppKeFuLib.sharedInstance().setTagCity(tagChangeField.text)
        }
        else if (tag!.isEqual(to: "PROVINCE"))
        {
            AppKeFuLib.sharedInstance().setTagProvince(tagChangeField.text)
        }
        else if (tag!.isEqual(to: "COUNTRY"))
        {
            AppKeFuLib.sharedInstance().setTagCountry(tagChangeField.text)
        }
        else if (tag!.isEqual(to: "OTHER"))
        {
            AppKeFuLib.sharedInstance().setTagOther(tagChangeField.text)
        }
        
        tagChangeField.text = "";
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
     */
    func textFieldShouldReturn(_ textFiled: UITextField) -> Bool {
        
//        NSLog(textFiled.text!);
        
        if(textFiled.text!.lengthOfBytes(using: String.Encoding.utf8) <= 0)
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
    func handleSingleTap(_ gestureRecognizer: UIGestureRecognizer) -> Void {
        
        self.view.endEditing(true)
    }
    
    
}

