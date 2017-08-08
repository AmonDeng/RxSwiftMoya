//
//  RequestPlugin.swift
//  RxSwiftMoya
//
//  Created by Amon Deng on 2017/8/8.
//  Copyright © 2017年 ERStone. All rights reserved.
//

import Foundation
import Moya
import Result
import MBProgressHUD
import Toast
/// show or hide the loading hud
class RequsetLoading:PluginType{
    private let viewController: UIViewController
    var HUD:MBProgressHUD
    var hide:Bool
    
    init(_ vc: UIViewController,_ hideView:Bool) {
        self.viewController = vc
        self.hide = hideView
        HUD = MBProgressHUD.init()
        guard self.hide else {
            
            return
        }
        HUD = MBProgressHUD.showAdded(to: self.viewController.view, animated: true)
        
    }
    func willSendRequest(_ request: RequestType, target: TargetType) {
        print("开始请求\(self.viewController)")
        
        if self.hide  != false  {
            
            HUD.mode = MBProgressHUDMode.indeterminate
            HUD.label.text = "加载中"
            HUD.bezelView.color = UIColor.lightGray
            
            HUD.removeFromSuperViewOnHide = true
            HUD.backgroundView.style = .solidColor //或SolidColor
        }
        
    }
    
    func didReceiveResponse(_ result: Result<Moya.Response, Moya.Error>, target: TargetType){
        print("结束请求")
        HUD.hide(animated: true)
    }
    
}
//let newworkActivityPlugin = NetworkActivityPlugin { (change) -> () in
//    
//    
//    switch(change){
//        
//    case .ended:
//        print("bbbb");
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        
//    case .began:
//        print("aaaa");
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        
//    }
//}

//class RequestLoadingPlugin: PluginType {
//    private let viewController: UIViewController
//    var HUD:MBProgressHUD
//    var hide:Bool
//    
//    init(_ vc: UIViewController,_ hideView:Bool) {
//        self.viewController = vc
//        self.hide = hideView
//        HUD = MBProgressHUD.init()
//        guard self.hide else {
//            
//            return
//        }
//        HUD = MBProgressHUD.showAdded(to: self.viewController.view, animated: true)
//        
//    }
//    
//    public func willSend(_ request: RequestType, target: TargetType) {
//        print("开始请求\(self.viewController)")
//        
//        if self.hide  != false  {
//            
//            HUD.mode = MBProgressHUDMode.indeterminate
//            HUD.label.text = "加载中"
//            HUD.bezelView.color = UIColor.lightGray
//            
//            HUD.removeFromSuperViewOnHide = true
//            HUD.backgroundView.style = .solidColor //或SolidColor
//            
//        }
//    }
//    
//    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
//        print("结束请求")
//        HUD.hide(animated: true)
//        
//    }
//    
//}
