//
//  UIImagePickerController+Extension.swift
//  DemoSwift203_imagePickerController
//
//  Created by zhangshaoyu on 16/10/19.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//
/*
当然，想要修改相册页面为中文还的在Info.plist配置文件中添加"Localized resources can be mixed"属性并设置为YES。

*/

import Foundation
import UIKit
import Photos

/// 相片选择器类型：相册 PhotoLibrary，图库 SavedPhotosAlbum，相机 Camera，前置摄像头 Front，后置摄像头 Rear
public enum UIImagePickerType:Int
{
    /// 相册 PhotoLibrary
    case UIImagePickerTypePhotoLibrary = 1
    
    /// 图库 SavedPhotosAlbum
    case UIImagePickerTypeSavedPhotosAlbum = 2
    
    /// 相机 Camera
    case UIImagePickerTypeCamera = 3
    
    /// 前置摄像头 Front
    case UIImagePickerTypeCameraFront = 4
    
    /// 后置摄像头 Rear
    case UIImagePickerTypeCameraRear = 5
}

extension UIImagePickerController
{
    /// MARK: - 实例化方法
//    convenience public init(type sourceType:UIImagePickerControllerSourceType, target:AnyObject, isEditing:Bool)
//    {
//        super.init()
//        self.sourceType = sourceType
//        self.delegate = target
//        self.allowsEditing = isEditing
//    }
    
    // MARK: - 设备使用有效性判断
    // 相册 PhotoLibrary，图库 SavedPhotosAlbum，相机 Camera，前置摄像头 Front，后置摄像头 Rear
    public class func isValidImagePickerType(type imagePickerType:UIImagePickerType) -> Bool
    {
        switch imagePickerType
        {
        case .UIImagePickerTypePhotoLibrary:
            if self.isValidPhotoLibrary
            {
                return true
            }
            return false
            
            break
            
        case .UIImagePickerTypeSavedPhotosAlbum:
            if self.isValidSavedPhotosAlbum
            {
                return true
            }
            return false
            
            break
            
        case .UIImagePickerTypeCamera:
            if self.isValidCameraEnable && self.isValidCamera
            {
                return true
            }
            return false
            
            break
            
        case .UIImagePickerTypeCameraFront:
            if self.isValidCameraEnable && self.isValidCameraFront
            {
                return true
            }
            return false
            
            break
            
        case .UIImagePickerTypeCameraRear:
            if self.isValidCamera && self.isValidCameraRear
            {
                return true
            }
            return false
            
            break
            
        default: return false
        }
    }
    
    /// 相机设备是否启用
    public class var isValidCameraEnable:Bool
    {
        get
        {
            let cameraStatus = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeAudio)
            if cameraStatus == AVAuthorizationStatus.Denied
            {
                return false
            }
            
            return true
        }
    }
    
    /// 相机Camera是否可用（是否有摄像头）
    public class var isValidCamera:Bool
    {
        get
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
            {
                return true
            }
            
            return false
        }
    }
    
    /// 前置相机是否可用
    public class var isValidCameraFront:Bool
    {
        get
        {
            if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Front)
            {
                return true
            }
            
            return false
        }
    }
    
    /// 后置相机是否可用
    public class var isValidCameraRear:Bool
    {
        get
        {
            if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Rear)
            {
                return true
            }
            
            return false
        }
    }
    
    /// 相册PhotoLibrary是否可用
    public class var isValidPhotoLibrary:Bool
    {
        get
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)
            {
                return true
            }
            
            return false
        }
    }
    
    /// 图库SavedPhotosAlbum是否可用
    public class var isValidSavedPhotosAlbum:Bool
    {
        get
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum)
            {
                return true
            }
            
            return false
        }
    }
    
    
    // MARK: - 属性设置
    func setImagePickerStyle(bgroundColor:UIColor, titleColor:UIColor, buttonTitleColor:UIColor)
    {
        // 改navigationBar背景色
        if let bgroundColorTmp:UIColor = bgroundColor
        {
            self.navigationBar.barTintColor = bgroundColorTmp
        }
        
        // 改navigationBar标题色
        if let titleColorTmp:UIColor = titleColor
        {
            self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: titleColorTmp]
        }
        
        // 改navigationBar的button字体色
        if let buttonTitleColorTmp:UIColor = buttonTitleColor
        {
            self.navigationBar.tintColor = buttonTitleColorTmp
        }
    }
}



