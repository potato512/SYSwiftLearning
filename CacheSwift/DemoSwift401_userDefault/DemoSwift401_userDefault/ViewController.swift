//
//  ViewController.swift
//  DemoSwift401_userDefault
//
//  Created by zhangshaoyu on 16/11/21.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  学习网址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "NSUserDefault"
        
        let readItem = UIBarButtonItem(title: "read", style: .Done, target: self, action: Selector("readInfo"))
        let deleteItem = UIBarButtonItem(title: "del", style: .Done, target: self, action: Selector("deleteInfo"))
        self.navigationItem.rightBarButtonItems = [deleteItem, readItem]
        
        self.setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        if (self.respondsToSelector(Selector("edgesForExtendedLayout")))
        {
            self.edgesForExtendedLayout = .None
        }
    }
    
    // MARK: - 视图
    
    func setUI()
    {
        let textField:UITextField = UITextField(frame: CGRectMake(10.0, 10.0, 200.0,30.0))
        self.view.addSubview(textField)
        textField.clearButtonMode = .WhileEditing
        textField.returnKeyType = .Done
        textField.delegate = self
        textField.textColor = UIColor.redColor()
        textField.layer.borderColor = UIColor.brownColor().CGColor
        textField.layer.borderWidth = 1.0
    }
    
    // MARK: - 交互
    
    // 保存，或修改
    func saveInfo(name:String)
    {
        if (0 <= name.characters.count)
        {
            let userDefault = NSUserDefaults.standardUserDefaults()
            userDefault.setObject(name, forKey: "name")
            userDefault.synchronize()
            
            let alert = UIAlertView(title: "温馨提示", message: "保存成功", delegate: nil, cancelButtonTitle: "知道了")
            alert.show()
        }
    }
    
    // 读取
    func readInfo() -> String
    {
        let userDefault = NSUserDefaults.standardUserDefaults()
        let name = userDefault.objectForKey("name") as? String
    
        let alert = UIAlertView(title: "温馨提示", message: "读取成功：\(name)", delegate: nil, cancelButtonTitle: "知道了")
        alert.show()
        
        if (name != nil)
        {
            return name!
        }
        
        return ""
    }
    
    // 删除
    func deleteInfo()
    {
        let useDefault = NSUserDefaults.standardUserDefaults()
        useDefault.removeObjectForKey("name")
     
        let alert = UIAlertView(title: "温馨提示", message: "删除成功", delegate: nil, cancelButtonTitle: "知道了")
        alert.show()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        let text = textField.text!
        self.saveInfo(text)
      
        return true
    }
    
}

