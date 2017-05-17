//
//  ViewController.swift
//  DemoSwift406_writeFile
//
//  Created by zhangshaoyu on 17/5/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var filePath:String = ""
    
    // MARK: getter
    var filePaht:String {
        get {
            let home = NSHomeDirectory() as NSString;
            let docPath = home.stringByAppendingPathComponent("Documents") as NSString;
            let path = docPath.stringByAppendingPathComponent("data.txt");
            return path as String
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "write to file"
        
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
            // 将数据写入文件中
            // 数组
            var array = NSMutableArray(contentsOfFile: self.filePath);
            if (array == nil)
            {
                array = NSMutableArray()
            }
            array!.addObject(name);
            let isSuccess = array!.writeToFile(self.filePath, atomically: true);
            // 字典
//            var dict = NSMutableDictionary(contentsOfFile: filePath)
//            if (dict == nil)
//            {
//                dict = NSMutableDictionary()
//            }
//            dict!.setObject(name, forKey: "name")
//            let isSuccess = dict!.writeToFile(filePath, atomically: true);
            // 字符
//            let text = name as NSString
//            text.writeToFile(filePath, atomically: true, encoding: <#T##UInt#>)
//            let isSuccess = text.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
            // 二进制
//            let data = name.dataUsingEncoding(UTF8)
//            let isSuccess = dataSource.writeToFile(filePathPlist, atomically: true);
            
            print("\(self.filePath)");
            let alert = UIAlertView(title: "温馨提示", message: (isSuccess ? "保存成功" : "保存失败"), delegate: nil, cancelButtonTitle: "知道了")
            alert.show()
        }
    }
    
    // 读取
    func readInfo() -> String
    {
        // 数组
        let array = NSArray(contentsOfFile: self.filePath)
        let text:NSMutableString = ""
        for (var i = 0; i < array?.count; i++)
        {
            let string = array?.objectAtIndex(i)
            text.appendString("\(string), ")
        }
        // 字典
        
        let alert = UIAlertView(title: "温馨提示", message: "读取成功：\(text)", delegate: nil, cancelButtonTitle: "知道了")
        alert.show()
      
        return text as String
    }
    
    // 删除
    func deleteInfo()
    {
        // 数组
        let array = NSArray(contentsOfFile: self.filePath) as! NSMutableArray
        array.removeAllObjects()
        let isSuccess = array.writeToFile(self.filePath, atomically: true);
        
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

