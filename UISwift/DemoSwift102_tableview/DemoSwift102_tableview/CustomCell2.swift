//
//  CustomCell2.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/10/24.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit


// cell复用标识
let CustomCell2Identifier = "CustomCell2"

let widthCustomCell2:CGFloat = UIScreen.mainScreen().bounds.width
let contentFontCustomCell2:CGFloat = 12.0


class CustomCell2: UITableViewCell {

    // 内容标签
    private var contentLabel:UILabel!
    private var content:String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    // MARK: - 实例化方法
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // 实例化cell
    init(text data:String, reuseIdentifier cellId:String)
    {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier:cellId)
        // cell属性设置
        // self.selectionStyle = UITableViewCellSelectionStyle.None
        self.backgroundColor = UIColor.whiteColor()
        
        self.content = data
        self.setUI()
        self.showModel()
    }
    
    // 让单元格宽度始终为屏幕宽
    override var frame: CGRect
    {
        get
        {
            return super.frame
        }
        set (newFrame)
        {
            var frame = newFrame
            frame.size.width = widthCustomCell2
            super.frame = frame
        }
    }
    
    // MARK: 视图
    
    func setUI()
    {
        // 10.0 + ? + 10.0
        
        // 实例化
        if (self.contentLabel == nil)
        {
            self.contentLabel = UILabel(frame: CGRectZero)
            self.contentView.addSubview(self.contentLabel)
            
            self.contentLabel.textColor = UIColor.brownColor()
            self.contentLabel.font = UIFont.systemFontOfSize(contentFont)
            self.contentLabel.numberOfLines = 0
            self.contentLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
            
//            self.contentLabel.backgroundColor = UIColor.purpleColor()
        }
        
        // 设置frame
        // 内容
        self.contentLabel.frame = CGRectMake(10.0, 10.0, (CGRectGetWidth(self.frame) - 10.0 * 2), 0.0)
    }
    
    // MARK: 数据处理
    func showModel()
    {
        self.contentLabel.text = self.content
        
        // 计算字生符串的宽度，高度
        var rect = self.contentLabel.frame
        let height = CustomCell2.heightWithText(self.content)
        rect.size.height = CGFloat(height)
        self.contentLabel.frame = rect
    }
    
    // MARK: - 计算高度
    class func cellHeight(model:CustomModel) -> CGFloat
    {
        var height = self.heightWithText(model.content)
        height += (10.0 * 2)
        
        return height
    }
    
    private class func heightWithText(text:String) -> CGFloat
    {
        let size:CGRect = text.boundingRectWithSize(CGSizeMake(width, 999.9), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(contentFont)], context: nil)
        
        return size.height
    }


}
