//
//  ViewController.swift
//  DemoSwift101_label
//
//  Created by zhangshaoyu on 16/9/27.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "label的用法"
        
        // 显示系统所有字体名称
        self.showAllFonts()
        
        
        
        let text = "swift中使用label。label在swift中的使用方法。swift中使用label。label在swift中的使用方法。swift中使用label。label在swift中的使用方法。"
        
        
        // 实例化
        let label:UILabel = UILabel(frame: CGRectMake(10.0, 10.0, (CGRectGetWidth(self.view.frame) - 10.0 * 2), 60.0))
        // 加到父视图
        self.view.addSubview(label)
        
        // 内容
        label.text = text
        
        
        // 字体属性设置
        label.textColor = UIColor.blackColor()
        label.textAlignment = NSTextAlignment.Left
        label.font = UIFont(name: "Copperplate", size: 15.0)
        label.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        label.adjustsFontSizeToFitWidth = true
        
        // 行数显示，默认为1行
        // 多行显示
        label.numberOfLines = 0
        // 只显示2行
//        label.numberOfLines = 2
        
        // 文本高亮
        label.highlighted = true
        label.highlightedTextColor = UIColor.blueColor()
        
        // 阴影设置
        label.shadowColor = UIColor.brownColor()
        label.shadowOffset = CGSizeMake(2.0, 2.0)
        
        // layer层设置
        label.layer.cornerRadius = 5.0
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.redColor().CGColor
        label.layer.borderWidth = 1.0
        
        // 其他属性
        label.backgroundColor = UIColor.greenColor()
        label.hidden = false
        
        
        
        // 富文本属性
        let label02:UILabel = UILabel(frame: CGRectMake(10.0, (CGRectGetHeight(label.frame) + CGRectGetMinY(label.frame) + 10.0), (CGRectGetWidth(self.view.frame) - 10.0 * 2), 40.0))
        self.view.addSubview(label02)
        label02.backgroundColor = UIColor.yellowColor()
        label02.font = UIFont(name: "Thonburi", size: 12.0)
        
        let text00 = "label的用法"
        // 定义富文本
        let attributeString = NSMutableAttributedString(string: text00)
        // 从文本0开始6个字符字体HelveticaNeue-Bold,16号
        attributeString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 20.0)!,
            range: NSMakeRange(0, 5))
        // 设置字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(),
            range: NSMakeRange(0, 5))
        // 设置文字背景颜色
        attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.greenColor(),
            range: NSMakeRange(0, 5))
        // 富文本内容显示
        label02.attributedText = attributeString
        
        
        
        // 计算字生符串的宽度，高度
        let string:String = "swift中计算字符串的宽度和高度。swift中计算字符串的宽度和高度。swift中计算字符串的宽度和高度。"
        let font:UIFont! = UIFont(name: "EuphemiaUCAS", size: 12.0)
        let attributes = [NSFontAttributeName:font]
        let option = NSStringDrawingOptions.UsesLineFragmentOrigin
        let autoSize = CGSizeMake(CGRectGetWidth(self.view.frame), 999.9)
//        let autoSize = CGSizeMake(999.9, 999.9)
        let size:CGRect = string.boundingRectWithSize(autoSize, options: option, attributes: attributes, context: nil)
        print("size:\(size)")
        
        let label03 = UILabel(frame: CGRectMake(10.0, (CGRectGetHeight(label02.frame) + CGRectGetMinY(label02.frame) + 10.0), (CGRectGetWidth(self.view.frame) - 10.0 * 2), 20.0))
        self.view.addSubview(label03)
        label03.backgroundColor = UIColor.orangeColor()
        label03.font = UIFont.systemFontOfSize(12.0)
        label03.text = string
        label03.numberOfLines = 0
        label03.lineBreakMode = NSLineBreakMode.ByWordWrapping
        // 自适应高度
        var autoRect = label03.frame
        autoRect.size.height = size.height
        label03.frame = autoRect
        
        
        /*
        注意：多行显示时，参数numberOfLines，font，frame中的height，三者是有关联的。如果height小于fone，或小于numberOfLines的行数时，则会显示不全。
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView()
    {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        
        // UI适配
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    /* 
    1 TODO: 
    2 MARK: - 生成分隔线
    3 FIXME:
    */
    // MARK: - 显示系统所有字体名称
    func showAllFonts()
    {
        let familyNames = UIFont.familyNames()
        
        var index:Int = 0
        
        for familyName in familyNames
        {
            let fontNames = UIFont.fontNamesForFamilyName(familyName as String)
            for fontName in fontNames
            {
                index++
                
                print("第 \(index) 个字体，字体font名称：\(fontName)")
            }
        }
    }


}

