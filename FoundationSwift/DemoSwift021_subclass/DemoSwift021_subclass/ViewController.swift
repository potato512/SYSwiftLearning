//
//  ViewController.swift
//  DemoSwift021_subclass
//
//  Created by zhangshaoyu on 16/9/22.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        继承
        使用注意事项
        1、使用super.init(变量名称1:类型1, ..., 变量名称N:类型N)执行父类初始化
        2、使用override关键字重写父类属性，或方法
        3、使用final关键字防止父类属性，或方法被重写
        
        */
        
        class person
        {
            var name:String
            var age:Int
            var sex:String
            
            init(name:String, age:Int, sex:String)
            {
                self.name = name
                self.age = age
                self.sex = sex
            }
            
//            final func show() -> Void // 防止被重写
            func show() -> Void
            {
                print("\(self)父类（或叫基类）")
            }
        }
        
        let person01 = person(name: "DevZhang", age: 30, sex: "man")
        print("人的属性 name=\(person01.name), age=\(person01.age), sex=\(person01.sex)")
        person01.show()
        
        // 子类，即继承父类
        // 方法1 在初始化方法中对父类属性赋值
        class personXiaoMing : person
        {
            let job:String
            let company:String
            let telphone:String
            
            init(job:String, company:String, telphone:String)
            {
                self.job = job
                self.company = company
                self.telphone = telphone
                
                // 执行父类属性
                super.init(name: "DevZhang", age: 30, sex: "man")
                // 以下无效
//                self.name = name
//                self.age = age
//                self.sex = sex
//                super.name = name
//                super.age = age
//                super.sex = sex
            }
            
            
            
            // 重写父类方法
            override func show()
            {
                print("\(self)是子类，继承于父类")
            }
        }
        
        let personXiaoMing01 = personXiaoMing(job: "iOSDev", company: "VSTECS", telphone: "13800138000")
        print("小明的信息 name=\(personXiaoMing01.name), age=\(personXiaoMing01.age), sex=\(personXiaoMing01.sex), job=\(personXiaoMing01.job), company=\(personXiaoMing01.company), tel=\(personXiaoMing01.telphone)")
        personXiaoMing01.show()
        
        // 方法2 在初始化方法中未对父类属性赋值
        class personMan:person
        {
            let wife:String
            
            init(wife:String, name:String, age:Int, sex:String)
            {
                self.wife = wife
                
                super.init(name: name, age: age, sex: sex)
            }
            
            override func show()
            {
                print("\(self)是person的子类")
            }
        }
        let personMan01 = personMan(wife: "DevYY", name: "DevZhang", age: 30, sex: "Man")
        print("男人的信息 name=\(personMan01.name), age=\(personMan01.age), sex=\(personMan01.sex), wife=\(personMan01.wife)")
        personMan01.show()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

