//
//  DWModuleNext.swift
//  DWMediatorDemo
//
//  Created by Crazy Davy on 2018/11/9.
//  Copyright © 2018 Crazy Davy. All rights reserved.
//

import UIKit

@objc(DWModuleNext)
class DWModuleNext: NSObject {
    @objc func action_ToNextViewControllerWithModel(params: [String:Any]?) -> UIViewController? {
        let vc = NextViewController()
        if let model = params?["model"] as? NextModel {
            vc.model = model
        }
        return vc
    }
    
    @objc func action_ToNextViewControllerWithDict(params: [String:Any]?) -> UIViewController? {
        let vc = NextViewController()
        if params != nil {
            vc.dict = params
        }
        return vc
    }
}

extension DWMediator {
    
    // 模块类 模块中的方法名称 传递的参数
    func dw_routerToNextViewControllerWithModel(_ params: [String:Any]?) -> UIViewController? {
        guard let vc = performTarget("DWModuleNext", action: "action_ToNextViewControllerWithModel", params: params ?? [:], shouldCacheTarget: false) as? UIViewController else {
            print("未找到NextViewController")
            // 这里处理异常场景，具体如何处理取决于产品
            return UIViewController()
        }
        return vc
    }
    
    func dw_routerToNextViewControllerWithDict(_ params: [String:Any]?) -> UIViewController? {
        guard let vc = performTarget("DWModuleNext", action: "action_ToNextViewControllerWithDict", params: params ?? [:], shouldCacheTarget: false) as? UIViewController else {
            print("未找到NextViewController")
            return UIViewController()
        }
        return vc
    }
    
    // URL
    func dw_routerWithURL(_ url: URL?) -> UIViewController? {
        guard let vc = performAction(with: url!, completion: { (dict) in
            print(dict)
        }) as? UIViewController else {
            print("未找到NextViewController")
            return UIViewController()
        }
        return vc
    }
}
