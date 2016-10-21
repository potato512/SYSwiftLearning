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
            frame.size.width = UIScreen.mainScreen().bounds.width
            super.frame = frame
        }
    }
    
    // MARK: 视图
    
    func setUI()
    {
        // 10.0 + 40.0 + 10.0 + 10.0 + 自适应?（40.0）
        
        if (self.titleLabel == nil)
        {
            self.titleLabel = UILabel(frame: CGRectMake(CGFloat(originXY), CGFloat(originXY), (CGRectGetWidth(self.bounds) - CGFloat(originXY) * 2 - (CGFloat(originXY) - CGFloat(originXY) - 60.0)), CGFloat(labelHeight)))
            self.contentView.addSubview(self.titleLabel)
            self.titleLabel.textColor = UIColor.blackColor()
            self.titleLabel.font = UIFont.systemFontOfSize(14.0)
        }
        
        var currentView = self.titleLabel as UIView
   
        if (self.contentButton == nil)
        {
            self.contentButton = UIButton(type: .Custom)
            self.contentView.addSubview(self.contentButton)
            self.contentButton.frame = CGRectMake((CGRectGetWidth(self.bounds) - CGFloat(originXY) - 60.0), CGRectGetMinY(currentView.frame), 60.0, CGRectGetHeight(currentView.frame))
            
            self.contentButton.backgroundColor = UIColor.orangeColor()
            self.contentButton.layer.cornerRadius = 5.0
            self.contentButton.layer.masksToBounds = true
            self.contentButton.titleLabel!.font = UIFont.systemFontOfSize(12.0)
            self.contentButton.setTitleColor(UIColor.redColor(), forState: .Highlighted)
            
            self.contentButton.indexPath = self.cellIndex
        }
        
        let lineH = UIView(frame: CGRectMake(CGFloat(originXY), (CGRectGetMinY(currentView.frame) + CGRectGetHeight(currentView.frame) + CGFloat(originXY) - 0.5), (CGRectGetWidth(self.frame) - CGFloat(originXY) * 2), 0.5))
        self.contentView.addSubview(lineH)
        lineH.backgroundColor = UIColor.lightGrayColor()
        
        if (self.statusImage == nil)
        {
            self.statusImage = UIImageView(frame: CGRectMake(CGRectGetMinX(currentView.frame), (CGRectGetMinY(currentView.frame) + CGRectGetHeight(currentView.frame) + CGFloat(originXY)), CGFloat(originXY), CGFloat(originXY)))
            self.contentView.addSubview(self.statusImage)
            self.statusImage.contentMode = .ScaleAspectFit
        }
        
        currentView = self.statusImage as UIView
        
        if (self.contentLabel == nil)
        {
            self.contentLabel = UILabel(frame: CGRectMake(CGFloat(originXY), (CGRectGetMinY(currentView.frame) + CGRectGetHeight(currentView.frame)), (CGRectGetWidth(self.bounds) - CGFloat(originXY) * 2), 40.0))
            self.contentView.addSubview(self.contentLabel)
            self.contentLabel.textColor = UIColor.brownColor()
            self.contentLabel.font = UIFont.systemFontOfSize(10.0)
            self.contentLabel.numberOfLines = 0
        }
    }
    
    // MARK: 数据处理
    func showModel()
    {
        self.titleLabel.text = self.cellModel.title
        self.contentLabel.text = self.cellModel.content
        
        let status = self.cellModel.contentStatus
        if status.boolValue
        {
            self.contentButton.setTitle("隐藏详情", forState: .Normal)
            self.contentButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
            
            self.statusImage.image = UIImage(named: "statusDown_image")
            
            self.contentLabel.hidden = false
        }
        else
        {
            self.contentButton.setTitle("显示详情", forState: .Normal)
            self.contentButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            
            self.statusImage.image = UIImage(named: "statusUp_image")
            
            self.contentLabel.hidden = true
        }
    }
    
    // MARK: - setter/getter
    var cellHeight:CGFloat
    {
        get
        {
            let status = self.cellModel.contentStatus
            if status.boolValue
            {
                return CustomCellHeightDefault
            }
            else
            {
                return 160.0
            }
        }
    }
}
