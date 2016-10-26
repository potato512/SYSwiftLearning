//
//  ViewController.swift
//  DemoSwift203_imagePickerController
//
//  Created by zhangshaoyu on 16/10/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit
// 使用相机设备（AVCaptureDevice）功能时
import Photos
// 使用图片库功能
import AssetsLibrary
// 使用录制视频功能
import MobileCoreServices
//import AVKit
//import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imageview:UIImageView! = nil
    
    var imagePicker:UIImagePickerController! = nil
    var photosPicker:UIImagePickerController! = nil
    var cameraPicker:UIImagePickerController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "image pickerController"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "image", style: .Done, target: self, action: Selector("imageClick"))
        
        // 显示图片
        self.imageview = UIImageView(frame: CGRectMake((CGRectGetWidth(self.view.frame) - 300.0) / 2, 10.0, 300.0, 300.0))
        self.view.addSubview(self.imageview)
        self.imageview.backgroundColor = UIColor.lightGrayColor()
        self.imageview.contentMode = .ScaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor.whiteColor()
        
        // UI适配
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    func imageClick()
    {
        print("图片选择")
        
        // 图片选择
        let sheetView = UIAlertController(title: nil, message: "选择相片", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let photosAction = UIAlertAction(title: "图库", style: UIAlertActionStyle.Default, handler: {
            action in
            print("图库")
            
            self.photosShow()
        })
        let imageAction = UIAlertAction(title: "相册", style: UIAlertActionStyle.Default, handler: {
            action in
            print("相册")
            
            self.imageShow()
        })
        let cameraAction = UIAlertAction(title: "相机", style: UIAlertActionStyle.Default, handler: {
            action in
            print("相机")
            
            self.cameraShow()
        })
        let videoAction = UIAlertAction(title: "摄像", style: UIAlertActionStyle.Default, handler: {
            action in
            print("摄像")
            
            self.videoShow()
        })
        sheetView.addAction(cancelAction)
        sheetView.addAction(photosAction)
        sheetView.addAction(imageAction)
        sheetView.addAction(cameraAction)
        sheetView.addAction(videoAction)
        self.presentViewController(sheetView, animated: true, completion: nil)
    }
    
    // MARK: - 图片选择
    // 相册 PhotoLibrary，图库 SavedPhotosAlbum，相机 Camera
    // MARK: 图库
    func photosShow()
    {
        // 是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum)
        {
            if self.photosPicker == nil
            {
                // 实例化
                self.photosPicker = UIImagePickerController()
                // 图库类型
                self.photosPicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
                // 代理对象（注意添加协议 UIImagePickerControllerDelegate、UINavigationControllerDelegate，及实现代理方法）
                self.photosPicker.delegate = self
                // 设置图片可编辑
                self.photosPicker.allowsEditing = true
                // 改navigationBar背景色
                self.photosPicker.navigationBar.barTintColor = UIColor.greenColor()
                // 改navigationBar标题色
                self.photosPicker.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.redColor()]
                // 改navigationBar的button字体色
                self.photosPicker.navigationBar.tintColor = UIColor.blueColor()
            }
            // 弹出图库视图控制器
            self.presentViewController(self.photosPicker, animated: true, completion: nil)
        }
        else
        {
            print("读取图库失败")
        }
    }
    
    // MARK: 相册
    func imageShow()
    {
        // 是否支持相册
        if UIImagePickerController.isValidImagePickerType(type: UIImagePickerType.UIImagePickerTypePhotoLibrary)
        {
            if self.imagePicker == nil
            {
                self.imagePicker = UIImagePickerController()
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.imagePicker.delegate = self
                self.imagePicker.setImagePickerStyle(UIColor.brownColor(), titleColor: UIColor.greenColor(), buttonTitleColor: UIColor.yellowColor())
            }
            // 弹出图库视图控制器
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        else
        {
            print("读取相册失败")
        }
    }
    
    // MARK: 相机
    func cameraShow()
    {
        // 是否有相机设备
        if UIImagePickerController.isValidCameraEnable
        {
            // 是否支持相机 Camera
            if UIImagePickerController.isValidCamera
            {
                // 是否支持图片库
                if self.cameraPicker == nil
                {
                    self.cameraPicker = UIImagePickerController()
                    self.cameraPicker.sourceType = .Camera
                    self.cameraPicker.delegate = self
                    self.cameraPicker.setImagePickerStyle(UIColor.yellowColor(), titleColor: UIColor.redColor(), buttonTitleColor: UIColor.blackColor())
                }
             
                self.presentViewController(self.cameraPicker, animated: true, completion: nil)
            }
            else
            {
                print("相机打开失败")
            }
        }
        else
        {
            print("没有相机设备")
        }
    }
    
    // MARK: 摄像
    func videoShow()
    {
        /*
        使用如下属性时，注意添加framework：MobileCoreServices
        
        KUTTypeImage 包含
        const CFStringRef  kUTTypeImage ;抽象的图片类型
        const CFStringRef  kUTTypeJPEG ;
        const CFStringRef  kUTTypeJPEG2000 ;
        const CFStringRef  kUTTypeTIFF ;
        const CFStringRef  kUTTypePICT ;
        const CFStringRef  kUTTypeGIF ;
        const CFStringRef  kUTTypePNG ;
        const CFStringRef  kUTTypeQuickTimeImage ;
        const CFStringRef  kUTTypeAppleICNS
        const CFStringRef  kUTTypeBMP;
        const CFStringRef  kUTTypeICO;
       
        KUTTypeMovie 包含：
        const CFStringRef  kUTTypeAudiovisualContent ;抽象的声音视频
        const CFStringRef  kUTTypeMovie ;抽象的媒体格式（声音和视频）
        const CFStringRef  kUTTypeVideo ;只有视频没有声音
        const CFStringRef  kUTTypeAudio ;只有声音没有视频
        const CFStringRef  kUTTypeQuickTimeMovie ;
        const CFStringRef  kUTTypeMPEG ;
        const CFStringRef  kUTTypeMPEG4 ;
        const CFStringRef  kUTTypeMP3 ;
        const CFStringRef  kUTTypeMPEG4Audio ;
        const CFStringRef  kUTTypeAppleProtectedMPEG4Audio;
        */
        
        // 获得相机模式下支持的媒体类型
        let availableMediaTypes:Array = UIImagePickerController.availableMediaTypesForSourceType(.Camera)!
        var canTakeVideo = false
        for mediaType in availableMediaTypes
        {
            if mediaType == (kUTTypeImage as String)
            {
                // 支持摄像
                canTakeVideo = true
                break;
            }
        }
        // 检查是否支持摄像
        if (!canTakeVideo)
        {
            print("sorry, capturing video is not supported.!!!");
            return;
        }
        
        // 创建图像选取控制器
        let videoPicker = UIImagePickerController()
        // 设置图像选取控制器的来源模式为相机模式
        videoPicker.sourceType = UIImagePickerControllerSourceType.Camera
        // 设置图像选取控制器的类型为动态图像，即视频文件
        videoPicker.mediaTypes = [kUTTypeMovie as String]
        // 设置摄像图像品质
        videoPicker.videoQuality = UIImagePickerControllerQualityType.TypeHigh
        // 设置最长摄像时间
        videoPicker.videoMaximumDuration = 30
        // 允许用户进行编辑
        videoPicker.allowsEditing = false
        // 设置委托对象
        videoPicker.delegate = self
        // 以模式视图控制器的形式显示
        self.presentViewController(videoPicker, animated: true, completion: nil)
    }
    
    
    
    // MARK: UIImagePickerControllerDelegate, UINavigationControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("1 图片选择：\(info)")
        
        // 相册、图库
        if picker.isEqual(self.imagePicker) || picker.isEqual(self.photosPicker)
        {
            // 选择的图片参数
            /*
            指定用户选择的媒体类型 UIImagePickerControllerMediaType
            原始图片 UIImagePickerControllerOriginalImage
            修改后的图片 UIImagePickerControllerEditedImage
            裁剪尺寸 UIImagePickerControllerCropRect
            媒体的URL UIImagePickerControllerMediaURL
            原件的URL UIImagePickerControllerReferenceURL
            当来数据来源是照相机的时候这个值才有效 UIImagePickerControllerMediaMetadata
            */
            
            // 获取选择的原图
            let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            print(pickedImage)
            
            // 获取选择的图片引用路径（注意：添加类 import Photos）
            let pickedURL:NSURL = info[UIImagePickerControllerReferenceURL] as! NSURL
            let fetchResult:PHFetchResult = PHAsset.fetchAssetsWithALAssetURLs([pickedURL], options: nil)
            let asset:PHAsset = fetchResult.firstObject as! PHAsset
            PHImageManager.defaultManager().requestImageDataForAsset(asset, options: nil, resultHandler: {
                    (imageData: NSData?, dataUTI: String?, orientation: UIImageOrientation,
                    info: [NSObject : AnyObject]?) in
                    //获取实际路径
                    let imageNSURL: NSURL = info!["PHImageFileURLKey"] as! NSURL
                    print("路径：",imageNSURL)
                    print("文件名：",imageNSURL.lastPathComponent)
                })
            
            // 显示图片
            self.imageview.image = pickedImage
            
            // 图片保存到相册
            // UIImageWriteToSavedPhotosAlbum(pickedImage, self, Selector("imageSave:error:contextInfo:"), nil)
        }
        
        // 拍照
        else if picker.isEqual(self.cameraPicker)
        {
            let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            // 显示图片
            self.imageview.image = pickedImage
        }
        
        // 录像
        else
        {
            // 获取媒体类型
            let mediaType = info[UIImagePickerControllerMediaType] as! String

            // 判断是静态图像还是视频
            if mediaType == (kUTTypeImage as String)
            {
            
            }
            else if mediaType == (kUTTypeMovie as String)
            {
                // 获取视频文件的url
                let mediaURL = info[UIImagePickerControllerMediaURL] as! NSURL
                // 视频文件的地址
                let pathString = mediaURL.relativePath
                print("视频地址：\(pathString)")
                
                // 创建ALAssetsLibrary对象并将视频保存到媒体库（注意添加frame：AssetsLibrary）
                let assetsLibrary = ALAssetsLibrary()
                assetsLibrary.writeVideoAtPathToSavedPhotosAlbum(mediaURL, completionBlock: {
                    (assetURL:NSURL!, error:NSError!) -> Void in
                    if let errorTmp = error
                    {
                        print("保存失败：\(errorTmp)");
                    }
                    else
                    {
                        print("保存成功");
                    }
                })
            }
        }

        
        // 退出图片选择控制器
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("2 放弃图片选择")
        
        // 退出图片选择控制器
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - 图片保存
    func imageSave(image:UIImage, error:NSError, contextInfo:Void)
    {
        if let errorTmp:NSError = error
        {
            print("error occured while saving the picture：\(errorTmp)")
        }
        else
        {
            print("picture saved with no error.")
        }
    }
}


