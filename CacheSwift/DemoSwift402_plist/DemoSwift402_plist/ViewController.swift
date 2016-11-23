//
//  ViewController.swift
//  DemoSwift402_plist
//
//  Created by zhangshaoyu on 16/11/21.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  学习网址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "plist"
        
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
        let textfield = UITextField(frame: CGRectMake(10.0,10.0,(self.view.frame.size.width - 10.0 * 2),40.0))
        self.view.addSubview(textfield)
        textfield.textColor = UIColor.blackColor()
        textfield.clearButtonMode = .WhileEditing
        textfield.delegate = self
        textfield.layer.borderColor = UIColor.redColor().CGColor
        textfield.layer.borderWidth = 1.0
    }
    
    // MARK: - 交互
    
    // 保存，或修改
    func saveInfo(name:String)
    {
        if (0 < name.characters.count)
        {
            // 路径
            let documents:[String] = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            let documentPath = documents.first!
            let url:NSURL = NSURL(string: documentPath)!
            let fileUrl:NSURL = url.URLByAppendingPathComponent("document.plist")
            // 文件名称
            let filePath:String = fileUrl.absoluteString
            if !NSFileManager.defaultManager().fileExistsAtPath(filePath)
            {
                NSFileManager.defaultManager().createFileAtPath(filePath, contents: nil, attributes: nil)
            }
     
            print("filePath = \(filePath)")
            // 保存数据
            let dict = NSMutableDictionary(contentsOfURL: fileUrl);
            dict!.setObject(name, forKey: "name")
            let isSuccess = dict!.writeToFile(filePath, atomically: true)

            let alert = UIAlertView(title: "温馨提示", message: (isSuccess ? "保存成功" : "保存失败"), delegate: nil, cancelButtonTitle: "知道了")
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
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        let text:String = textField.text!
        self.saveInfo(text)
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}

