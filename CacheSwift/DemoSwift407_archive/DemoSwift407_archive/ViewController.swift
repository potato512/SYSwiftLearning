//
//  ViewController.swift
//  DemoSwift407_archive
//
//  Created by zhangshaoyu on 17/5/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /**
     归档数据
     需要实现NSCoding协议
     */
    func saveWithNSKeyedArchiver()
    {
        let home = NSHomeDirectory() as NSString;
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString;
        let filePath = docPath.stringByAppendingPathComponent("book.data");
        let book = CFAddressBook(name: "Francis", call: "199");
        /**
        *  数据归档处理
        */
        NSKeyedArchiver.archiveRootObject(book, toFile: filePath);
    }
    
    /**
     归档数据
     */
    func readWithNSKeyedUnarchiver()
    {
        let home = NSHomeDirectory() as NSString;
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString;
        let filePath = docPath.stringByAppendingPathComponent("book.data");
        let book = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as CFAddressBook;
        println("\(book.name), \(book.call)");
    }
    
    /*
    
    /**
    归档数据
    需要实现NSCoding协议
    */
    func saveWithNSKeyedArchiver() {
    let docPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as NSString
    let filePath = docPath.stringByAppendingPathComponent("contact.data");
    let contact = Contact(name: "123333", phone: "123456")
    /**
    *  数据归档处理
    */
    NSKeyedArchiver.archiveRootObject(contact, toFile: filePath);
    }
    // 如果上面直接运行会报错，因为你需要在要归档的对象中遵循NSCoding协议，并实现归档方法和解析方法 如：
    class Contact: NSObject, NSCoding {
    
    var name: String?
    var phone: String?
    
    required init(name: String, phone: String){
    self.name = name
    self.phone = phone
    }
    
    // 在对象归档的时候调用（哪些属性需要归档，怎么归档）
    func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(name, forKey: "name")
    }
    
    // 解析NIB/XIB的时候会调用
    required init?(coder aDecoder: NSCoder) {
    super.init()
    name = aDecoder.decodeObjectForKey("name") as? String
    }
    }
    /**
    反归档数据
    */
    func readWithNSKeyedUnarchiver() {
    let docPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as NSString
    let filePath = docPath.stringByAppendingPathComponent("contact.data");
    let contact = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! Contact;
    print(contact.name!)
    }
    */
}

