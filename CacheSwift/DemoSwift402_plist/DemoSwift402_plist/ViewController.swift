//
//  ViewController.swift
//  DemoSwift402_plist
//
//  Created by zhangshaoyu on 16/11/21.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  学习网址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var filePathPlist:String = ""
    
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
//            // 路径
//            let documents:[String] = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
//            let documentPath = documents.first!
//            let url:NSURL = NSURL(string: documentPath)!
//            let fileUrl:NSURL = url.URLByAppendingPathComponent("document.plist")
//            // 文件名称
//            let filePath:String = fileUrl.absoluteString
//            if !NSFileManager.defaultManager().fileExistsAtPath(filePath)
//            {
//                NSFileManager.defaultManager().createFileAtPath(filePath, contents: nil, attributes: nil)
//            }
//     
//            print("filePath = \(filePath)")
//            // 保存数据
//            let dict = NSMutableDictionary(contentsOfURL: fileUrl);
//            dict!.setObject(name, forKey: "name")
//            let isSuccess = dict!.writeToFile(filePath, atomically: true)
//
//            let alert = UIAlertView(title: "温馨提示", message: (isSuccess ? "保存成功" : "保存失败"), delegate: nil, cancelButtonTitle: "知道了")
//            alert.show()
            
            
            // 1、获得沙盒的根路径
            let home = NSHomeDirectory() as NSString;
            // 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
            let docPath = home.stringByAppendingPathComponent("Documents") as NSString;
            // 3、获取文本文件路径
            filePathPlist = docPath.stringByAppendingPathComponent("data.plist");
            // 4、将数据写入文件中
            // 数组
//            let dataSource = NSMutableArray();
//            dataSource.addObject(name);
//            let isSuccess = dataSource.writeToFile(filePathPlist, atomically: true);
            // 字典
            var dict = NSMutableDictionary(contentsOfFile: filePathPlist)
            if (dict == nil)
            {
                dict = NSMutableDictionary()
            }
            dict?.setObject(name, forKey: "name")
            let isSuccess = dict!.writeToFile(filePathPlist, atomically: true);
            // 二进制
//            let data = name.dataUsingEncoding(UTF8)            
//            let isSuccess = dataSource.writeToFile(filePathPlist, atomically: true);
            
            print("\(filePathPlist)");
            let alert = UIAlertView(title: "温馨提示", message: (isSuccess ? "保存成功" : "保存失败"), delegate: nil, cancelButtonTitle: "知道了")
            alert.show()
        }
    }
    
    // 读取
    func readInfo() -> String
    {
//        let userDefault = NSUserDefaults.standardUserDefaults()
//        let name = userDefault.objectForKey("name") as? String
        
        // 数组
        let array = NSArray(contentsOfFile: filePathPlist)
        let text = array?.firstObject
        // 字典
        
        let alert = UIAlertView(title: "温馨提示", message: "读取成功：\(text)", delegate: nil, cancelButtonTitle: "知道了")
        alert.show()
        
        if (text != nil)
        {
            return text as! String
        }
        
        return ""
    }
    
    // 删除
    func deleteInfo()
    {
//        let useDefault = NSUserDefaults.standardUserDefaults()
//        useDefault.removeObjectForKey("name")
        
        let array = NSArray(contentsOfFile: filePathPlist) as! NSMutableArray
        array.removeAllObjects()
        let isSuccess = array.writeToFile(filePathPlist, atomically: true);
        
        let alert = UIAlertView(title: "温馨提示", message: (isSuccess ? "删除成功" : "删除失败"), delegate: nil, cancelButtonTitle: "知道了")
        alert.show()
    }
    
    
    // MARK: -touch
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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

