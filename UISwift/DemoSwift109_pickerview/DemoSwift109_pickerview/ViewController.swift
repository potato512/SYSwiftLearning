//
//  ViewController.swift
//  DemoSwift109_pickerview
//
//  Created by zhangshaoyu on 16/9/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let width:CGFloat = (UIScreen.mainScreen().bounds.size.width / 3.0)
    var label:UILabel?
    var addressArray:Array<AnyObject>?
    var cityArray:Array<AnyObject>?
    var areaArray:Array<AnyObject>?
    
    var textSelected1:String!
    var textSelected2:String!
    var textSelected3:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "pickerview的使用"

        // 数据
        self.loadAddress()
        
        // 实例化（注：UIPickerView的宽高默认分别是屏幕宽度、216的高度）
        let pickerview = UIPickerView()
        print(pickerview)
        self.view.addSubview(pickerview)
        pickerview.backgroundColor = UIColor.greenColor()
        
        // 设置代理（注意添加代理协议，实现代理方法）
        pickerview.dataSource = self
        pickerview.delegate = self
        
        // 设置选择框的默认值
        pickerview.selectRow(0,inComponent:0,animated:true)
        pickerview.selectRow(0,inComponent:1,animated:true)
        pickerview.selectRow(0,inComponent:2,animated:true)
        
        // 刷新数据
        // 刷新全部数据
        pickerview.reloadAllComponents()
        // 刷新某列数据
//        pickerview.reloadComponent(1)
        
        self.label = UILabel(frame: CGRectMake(10.0, (CGRectGetHeight(self.view.bounds) - 10.0 - 40.0), (CGRectGetWidth(self.view.bounds) - 10.0 * 2), 40.0))
        self.view.addSubview(self.label!)
        self.label!.backgroundColor = UIColor.yellowColor()
        self.label!.textColor = UIColor.redColor()
        self.label!.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin
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
    
    // MARK: - 数据
    func loadAddress()
    {
        // 广西
        let cityArea011 = ["cityName":"南宁市","cityArea":["南宁市","隆安县","武鸣县","马山县","宾阳县","横县","芭乐县","上林县"]]
        let cityArea012 = ["cityName":"百色市","cityArea":["百色市","隆林各族自治县","西林县","田林县","乐业县","凌云县","田阳县","田东县","平果县","德宝县","靖西县","那坡县"]]
        let cityArea013 = ["cityName":"桂林市","cityArea":["桂林市","龙胜各簇自治县","资源县","全州县","兴安县","灵川县","灌阳县","恭城瑶族自治县","平乐县","荔浦县","阳朔县","临桂县","永福县"]]
        let provinceCity01 = ["provinceName":"广西省","provinceCity":[cityArea011,cityArea012,cityArea013]]
        // 广东
        let cityArea021 = ["cityName":"梅州市","cityArea":["梅江区","梅县","蕉岭县","大埔县","丰顺县","平远县","兴宁市"]]
        let cityArea022 = ["cityName":"广州市","cityArea":["越秀","海珠","荔湾","天河","白云","黄埔","南沙","萝岗"]]
        let cityArea023 = ["cityName":"深圳市","cityArea":["龙岗区","宝安区","光明新区","坪山新区","罗湖区","福田区","盐田区","南山区"]]
        let cityArea024 = ["cityName":"惠州市","cityArea":["惠城区","惠东县","惠阳市","龙门县","博罗县"]]
        let provinceCity02 = ["provinceName":"广东省","provinceCity":[cityArea021,cityArea022,cityArea023,cityArea024]]
        
        self.addressArray = [provinceCity01, provinceCity02]
        
        self.cityArray = []
        self.areaArray = []
    }
    
    // MARK: - UIPickerViewDataSource, UIPickerViewDelegate
    // MARK: UIPickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        // 选择框列数
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        // 每个选择框的行数
        if 0 == component
        {
            // 第一列
            let count = self.addressArray!.count
            return count
        }
        else if 1 == component
        {
            // 第二列
            let count = self.cityArray!.count
            return count
        }
        else if 2 == component
        {
            // 第三列
            let count = self.areaArray!.count
            return count
        }
        
        return 0
    }
    
    // MARK: UIPickerViewDelegate
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat
    {
        // 每个选择框的行宽
        return width
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        // 每个选择框的行高
        return 40.0
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        // 每个选择框每行的显示内容
        if 0 == component
        {
            // 第一列
            let dictProvince = self.addressArray![row]
            let province:String! = dictProvince.objectForKey("provinceName") as! String
            return province
        }
        else if 1 == component
        {
            // 第二列
            let dict = self.cityArray![row]
            let city:String! = dict.objectForKey("cityName") as! String
            return city
        }
        else if 2 == component
        {
            // 第三列
            let area:String! = self.areaArray![row] as! String
            return area
        }
        
        return nil
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString?
    {
        // 每个选择框每行的显示副文本内容
        return nil
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        // 每个选择框每行自定义视图
        let label = UILabel(frame: CGRectMake(0.0, 0.0, width, 40.0))
        label.backgroundColor = UIColor.orangeColor()
        label.textAlignment = NSTextAlignment.Center
        
        if 0 == component
        {
            // 第一列
            let dict = self.addressArray![row]
            let province:String! = dict.objectForKey("provinceName") as! String
            label.text = province
        }
        else if 1 == component
        {
            // 第二列
            let dict = self.cityArray![row]
            let city:String! = dict.objectForKey("cityName") as! String
            label.text = city
        }
        else if 2 == component
        {
            // 第三列
            let area:String! = self.areaArray![row] as! String
            label.text = area
        }
        
        return label
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // 每个选择框每行被选中的值
        print(component, row)
  
        if 0 == component
        {
            // 第一列时的行数
//            textSelected1 = String("1列 \(row) 行")
            
            let dict = self.addressArray![row]
            textSelected1 = dict.objectForKey("provinceName") as? String
            
            // 第二、三列关联改变
            self.cityArray! = dict["provinceCity"] as! Array
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
            let dict2 = self.cityArray![0]
            textSelected2 = dict2.objectForKey("cityName") as! String
            
            let dict3 = self.cityArray![0]
            self.areaArray! = dict3["cityArea"] as! Array
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 2, animated: true)
            textSelected3 = self.areaArray![0] as! String
        }
        else if 1 == component
        {
            // 第二列时的行数
//            textSelected2 = String("2列 \(row) 行")
            
            let dict = self.cityArray![row]
            textSelected2 = dict.objectForKey("cityName") as! String
            
            // 第三列关联改变
            self.areaArray! = dict["cityArea"] as! Array
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 2, animated: true)
            textSelected3 = self.areaArray![0] as! String
        }
        else if 2 == component
        {
            // 第三列时的行数
//            textSelected3 = String("3列 \(row) 行。")
            
            textSelected3 = self.areaArray![row] as! String
        }
        let text = String("你选择了：\(textSelected1),\(textSelected2),\(textSelected3)")
        self.label!.text = text
    }
    
    /*
    注意事项：
    1、标题内容"func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { }"设置与自定义视图"func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView { }"不能同时设置，否则只有自定义视图有效。
    */
}

