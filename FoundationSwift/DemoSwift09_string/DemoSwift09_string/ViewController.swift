//
//  ViewController.swift
//  DemoSwift09_string
//
//  Created by zhangshaoyu on 16/9/12.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // 字符串的定义
        // 1 使用字符串字面量
        var name = "DevZhang"
        print(name)
        // 2 String 实例化
        name = String("Hello, DevZhang")
        print(name)
        
        // 字符串的操作
        // 字符串追加字符串
        name = name + ".where are you from?"
        print(name)

        
        // 是否包含子串
        let range = name.rangeOfString("DevZhang")
        if range != nil
        {
            print(range)
            
            let indexStart = range!.startIndex
            let indexEnd = range!.endIndex
            let indexLength = 0 // indexEnd - indexStart
            print("index start = \(indexStart), end = \(indexEnd), length = \(indexLength)")
        }
        else
        {
            print("不包含")
        }
        
        
        // 截取子字符串substring
        name = name.substringFromIndex(name.startIndex.advancedBy(4))
        print(name)
        name = name.substringToIndex(name.startIndex.advancedBy(30))
        print(name)
        let rangeName = Range<String.Index>(start: name.startIndex.advancedBy(1), end: name.endIndex.advancedBy(-1))
        name = name.substringWithRange(rangeName)
        print(name)
        

        // 字符串修剪trim
        let str011 = "DevZhang.\n "
        print(str011)
        let str012 = str011.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        print(str012)
        // 去掉空格
        let str013 = str011.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        print(str013)
        let charset014 = NSCharacterSet(charactersInString:" \n")
        let str015 = str011.stringByTrimmingCharactersInSet(charset014)
        print(str015)
        
        // 字符串替换replace（当withString为空字符串时，相当于删除）
        var str031 = "My name is DevZhang"
        let rangeReplace = Range(start: str031.startIndex, end: str031.startIndex.advancedBy(2))
        str031.replaceRange(rangeReplace, with: "Your")
        print(str031)
        var str032 = "hello, DevZhang."
        str032 = str032.stringByReplacingOccurrencesOfString("DevZhang", withString: "zhangshaoyu")
        print(str032)
        str032 = str032.stringByReplacingOccurrencesOfString("zhangshaoyu", withString: "DevZhang", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        print(str032)
        
        // 字符串删除指定字符串
        var str041 = "My name is DevZhang, your name is DevTang"
        print(str041)
//        let rangeRemove = Range<String.Index>str041.rangeOfString("DevZhang")
//        str041.removeRange(rangeRemove)
        str041 = str041.stringByReplacingOccurrencesOfString("DevTang", withString: "")
        print(str041)
        
        // 首字母大写
        str041 = str041.capitalizedString
        print(str041)
        
        // 首字母小写
//        str041 = str041.localizedCapitalizedString
//        print("首字母小写\(str041)")
        
        // 字符串小写转换大写
        name = name.uppercaseString
        print(name)
        
        // 字符串大写转换小写
        name = name.lowercaseString
        print(name)
        
        
        // 字符串长度
        let lengthName = name.characters.count
        print("\(name) 的长度是 \(lengthName)")
        
        // Unicode编码
        for codeUTF8 in name.utf8
        {
            print("\(codeUTF8) ")
        }
        print("")
        for codeUTF16 in name.utf16
        {
            print("\(codeUTF16) ")
        }
        
        
        // 字符串的非空判断
        let isEmptyName:Bool = name.isEmpty
        if isEmptyName
        {
            print("name is nill")
        }
        else
        {
            print("name is no nil")
        }
        
        // 字符串前缀
        if name.hasPrefix("Hello")
        {
            print("有对应的 Hello 前缀")
        }
        else
        {
            print("没有对应的 Hello 前缀")
        }
        
        // 字符串后缀
        if name.hasSuffix("from")
        {
            print("有对应的 from 后缀")
        }
        else
        {
            print("没有对应的 from 后缀")
        }
        
        // 字符串比较
        let varA   = "Hello, Swift!"
        let varB   = "Hello, Objective-C!"
        
        // 比较字符串是否相等
        if varA == varB
        {
            print("\(varA) 与 \(varB) 是相等的")
        }
        else
        {
            print("\(varA) 与 \(varB) 是不相等的")
        }
        
        // 比较字符串是否不相等
        if varA != varB
        {
            print("\(varA) 与 \(varB) 不相等")
        }
        else
        {
            print("\(varA) 与 \(varB) 相等")
        }
        
        // 比较字符串的大小（两个字符串的字母逐一比较）
        if varA > varB
        {
            print("\(varA) 大于 \(varB)")
        }
        else
        {
            print("\(varA) 小于 \(varB)")
        }
        
        
        // 数值型字符串转换成Int/Long/Float/Double/Bool等（注意：转换值必须添加optional选项" ! "，或" ? "）
        let moneyStr:String = String("3025.56")
        let moneyNum01:Float! = Float(moneyStr)
        print(moneyNum01)
        let moneyNum02:Double! = (moneyStr as NSString).doubleValue
        print(moneyNum02)
        let moneyNum03:String = "1000"
        let moneyNum04:Int32 = (moneyNum03 as NSString).intValue
        print(moneyNum04)
        let valid:String = "true"
        let isValid:Bool! = (valid as NSString).boolValue
        print(isValid)
        
        
        
        // 字符（注意：字符中只能有一个字符，不能有两个及以上）
        let charA:Character = "A"
        print(charA)
        
        // 字符转换成字符串
        name = String(charA)
        print(name)
        
        // 获取字符串中指定索引处的字符
        let charName = name[name.startIndex]
        print(charName)
        
        // 字符串转换成字符
        for charTmp in valid.characters
        {
            print("char = \(charTmp)")
        }
        
        // 字符串添加字符
        name.append(charA)
        print(name)
        name = String("\(name)\(charA)")
        print(name)
        
        
        
        // 字符串的分解子串split，即转换成数组
        let str021 = "boy, girl, man, woman"
        print(str021)
        let str021Array = str021.componentsSeparatedByString(",")
        print(str021Array)
        let str022 = "boy,girl,man 10 20 30"
        print(str022)
        let charset023 = NSCharacterSet(charactersInString:", ")
        print(charset023)
        let str022Array = str022.componentsSeparatedByCharactersInSet(charset023)
        print(str022Array)
        
        
        
        // 字符串转换成NSData
        var str061:String = "String to encode data"
        print(str061)
        let data = str061.dataUsingEncoding(NSUTF8StringEncoding)
        print(data)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

