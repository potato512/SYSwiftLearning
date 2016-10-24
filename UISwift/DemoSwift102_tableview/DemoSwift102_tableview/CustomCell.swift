//
//  CustomCell.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/9/27.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit


// cell复用标识
let CustomCellIdentifier = "CustomCell"

let width:CGFloat = UIScreen.mainScreen().bounds.width
let contentFont:CGFloat = 12.0

// 默认高度
let originXY = 10.0
let labelHeight = 30.0
let CustomCellHeightDefault = CGFloat(originXY + labelHeight + originXY + originXY + 0.0)

class CustomCell: UITableViewCell {

    // 标题标签
    private var titleLabel:UILabel!
    // 详情按钮
    var contentButton:UIButton!
    // 显示或隐藏图标
    private var statusImage:UIImageView!
    // 副标题标签
    private var contentLabel:UILabel!
    
    // 消息数据结构
    var cellModel:CustomModel!
    private var cellIndex:NSIndexPath!
    
    
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
    init(model data:CustomModel, cellIndex index:NSIndexPath, reuseIdentifier cellId:String)
    {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier:cellId)
        // cell属性设置
//        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.backgroundColor = UIColor.whiteColor()
        
        self.cellModel = data
        self.cellIndex = index
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
            frame.size.width = width
            super.frame = frame
        }
    }
    
    // MARK: 视图
    
    func setUI()
    {
        // 10.0 + 40.0 + 10.0 + 10.0 + 自适应?（40.0）
        
        // 实例化
        if (self.titleLabel == nil)
        {
            self.titleLabel = UILabel(frame: CGRectZero)
            self.contentView.addSubview(self.titleLabel)
            
            self.titleLabel.textColor = UIColor.blackColor()
            self.titleLabel.font = UIFont.systemFontOfSize(14.0)
        }
        
        if (self.contentButton == nil)
        {
            self.contentButton = UIButton(type: .Custom)
            self.contentView.addSubview(self.contentButton)
            
            self.contentButton.backgroundColor = UIColor.orangeColor()
            self.contentButton.layer.cornerRadius = 5.0
            self.contentButton.layer.masksToBounds = true
            self.contentButton.titleLabel!.font = UIFont.systemFontOfSize(12.0)
            self.contentButton.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        }
     
        if (self.statusImage == nil)
        {
            self.statusImage = UIImageView(frame: CGRectZero)
            self.contentView.addSubview(self.statusImage)
            
            self.statusImage.contentMode = .ScaleAspectFit
        }
        
        if (self.contentLabel == nil)
        {
            self.contentLabel = UILabel(frame: CGRectZero)
            self.contentView.addSubview(self.contentLabel)
            
            self.contentLabel.textColor = UIColor.brownColor()
            self.contentLabel.font = UIFont.systemFontOfSize(contentFont)
            self.contentLabel.numberOfLines = 0
            self.contentLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        }
        
        
        // 设置frame
        // 标题
        self.titleLabel.frame = CGRectMake(CGFloat(originXY), CGFloat(originXY), (CGRectGetWidth(self.frame) - CGFloat(originXY) * 3 - 60.0), CGFloat(labelHeight))
        var currentView = self.titleLabel as UIView
        // 按钮
        self.contentButton.frame = CGRectMake((CGRectGetWidth(self.frame) - CGFloat(originXY) - 60.0), CGRectGetMinY(currentView.frame), 60.0, CGRectGetHeight(currentView.frame))
        // 分割线
        let lineH = UIView(frame: CGRectMake(CGFloat(originXY), (CGRectGetMinY(currentView.frame) + CGRectGetHeight(currentView.frame) + CGFloat(originXY) - 0.5), (CGRectGetWidth(self.frame) - CGFloat(originXY) * 2), 0.5))
        self.contentView.addSubview(lineH)
        lineH.backgroundColor = UIColor.lightGrayColor()
        // 状态图标
        self.statusImage.frame = CGRectMake(CGRectGetMinX(currentView.frame), (CGRectGetMinY(currentView.frame) + CGRectGetHeight(currentView.frame) + CGFloat(originXY)), CGFloat(originXY), CGFloat(originXY))
        currentView = self.statusImage as UIView
        // 详情
        self.contentLabel.frame = CGRectMake(CGFloat(originXY), (CGRectGetMinY(currentView.frame) + CGRectGetHeight(currentView.frame)), (width - CGFloat(originXY) * 2), 0.0)
    }
    
    // MARK: 数据处理
    func showModel()
    {
        self.titleLabel.text = self.cellModel.title
        self.contentLabel.text = self.cellModel.content
        self.contentButton.indexPath = self.cellIndex
        
        let status = self.cellModel.contentStatus
        if status.boolValue
        {
            self.contentButton.setTitle("隐藏详情", forState: .Normal)
            self.contentButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
            
            self.statusImage.image = UIImage(named: "statusDown_image")
            
            // 计算字生符串的宽度，高度
            var rect = self.contentLabel.frame
            let height = CustomCell.heightWithText(self.cellModel.content)
            rect.size.height = height
            self.contentLabel.frame = rect
        }
        else
        {
            self.contentButton.setTitle("显示详情", forState: .Normal)
            self.contentButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            
            self.statusImage.image = UIImage(named: "statusUp_image")
            
            // 隐藏
            var rect = self.contentLabel.frame
            rect.size.height = 0.0
            self.contentLabel.frame = rect
        }
    }
    
    // MARK: - 计算高度
    class func cellHeight(model:CustomModel) -> CGFloat
    {
        let status = model.contentStatus
        if status.boolValue
        {
            let height = self.heightWithText(model.content)
            return CustomCellHeightDefault + height
        }
        else
        {
            return CustomCellHeightDefault
        }
    }
    
    private class func heightWithText(text:String) -> CGFloat
    {
        let size:CGRect = text.boundingRectWithSize(CGSizeMake(width, 999.9), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(contentFont)], context: nil)
        
        return size.height
    }
}
