//
//  ViewController.swift
//  DemoSwift310_Sandbox
//
//  Created by zhangshaoyu on 17/5/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let label:UILabel = UILabel.init(frame: CGRectMake(10.0, 80.0, 300.0, 500.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "沙盒路径";
        
        /*
        1、应用程序包：包含了所有的资源文件和可执行文件
        2、Documents：保存应用运行时生成的需要持久化的数据，iTunes同步设备时会备份该目录
        3、tmp：保存应用运行时所需要的临时数据，使用完毕后再将相应的文件从该目录删除。应用没有运行，系统也可能会清除该目录下的文件，iTunes不会同步备份该目录
        4、Library/Cache：保存应用运行时生成的需要持久化的数据，iTunes同步设备时不备份该目录。一般存放体积大、不需要备份的非重要数据
        5、Library/Preference：保存应用的所有偏好设置，IOS的Settings应用会在该目录中查找应用的设置信息。iTunes同步设备时会备份该目录
        */
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "sandbox", style: .Done, target: self, action: Selector("showFilePath"))
        
        self.view.addSubview(label)
        label.backgroundColor = UIColor.lightGrayColor()
        label.textColor = UIColor.blackColor()
        label.font = UIFont.systemFontOfSize(10.0)
        label.numberOfLines = 0;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showFilePath()
    {
        /// home沙盒主目录路径
        let pathHome = NSHomeDirectory();
        print("home沙盒主目录路径：\(pathHome)")
        
        /// temp临时目录
        let pathTemp = NSTemporaryDirectory();
        print("temp临时目录：\(pathTemp)")
        
        /// document文档目录
        let array = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true);
        let pathDecument = array.first!;
        print("document文档目录：\(pathDecument)")
        
        /// cache缓存目录
        let arrayCache = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true);
        let pathCache = arrayCache.first!;
        print("cache缓存目录：\(pathCache)")
        
        /// library目录
        let arrayLibrary = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true);
        let pathLibrary = arrayLibrary.first!;
        print("library目录：\(pathLibrary)")
        
        /// home主目录自定义文件路径
        var pathHomeWithName = NSHomeDirectory() as NSString
        pathHomeWithName = pathHomeWithName.stringByAppendingPathComponent("devZhang")
        print("home主目录自定义文件路径：\(pathHomeWithName)")
        
        /// temp临时目录自定义文件路径
        var pathTempWithName = NSTemporaryDirectory() as NSString
        pathTempWithName = pathTempWithName.stringByAppendingPathComponent("devZhang")
        print("temp临时目录自定义文件路径：\(pathTempWithName)")
        
        /// document文档目录自定义文件路径
        var pathDocumentWithName = pathDecument as NSString
        pathDocumentWithName = pathDocumentWithName.stringByAppendingPathComponent("devZhang")
        print("document文档目录自定义文件路径：\(pathDocumentWithName)")
        
        /// cache缓存目录自定义文件路径
        var pathCacheWithName = pathCache as NSString
        pathCacheWithName = pathCacheWithName.stringByAppendingPathComponent("devZhang")
        print("cache缓存目录自定义文件路径：\(pathCacheWithName)")
        
        /// library目录自定义文件路径
        var pathLibraryWithName = pathLibrary as NSString
        pathLibraryWithName = pathLibraryWithName.stringByAppendingPathComponent("devZhang")
        print("library目录自定义文件路径：\(pathLibraryWithName)")
        
        
        var path = pathHome
        path += "\n \(pathTemp) \n"
        path += "\n \(pathDecument) \n"
        path += "\n \(pathCache) \n"
        path += "\n \(pathLibrary) \n"
        path += "\n \(pathHomeWithName) \n"
        path += "\n \(pathTempWithName) \n"
        path += "\n \(pathDocumentWithName) \n"
        path += "\n \(pathCacheWithName) \n"
        path += "\n \(pathLibraryWithName) \n"
        label.text = path;
        
    }

}

