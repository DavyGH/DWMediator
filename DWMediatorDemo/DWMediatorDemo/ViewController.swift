//
//  ViewController.swift
//  DWMediatorDemo
//
//  Created by Crazy Davy on 2018/11/9.
//  Copyright © 2018 Crazy Davy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func clickSender(_ sender: UIButton) {
        switch sender.tag {
        case 1001: // 传模型
            let model = ["model":NextModel(bgColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), title: "CrazyDavy", h_id: 666)]
            let vc = DWMediator.sharedInstance().dw_routerToNextViewControllerWithModel(model)
            navigationController?.pushViewController(vc!, animated: true)
        case 1002: // 传字典
            let dict: [String:Any] = ["bgColor":#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),"title": "Davy","h_id": 888]
            let vc = DWMediator.sharedInstance().dw_routerToNextViewControllerWithDict(dict)
            navigationController?.pushViewController(vc!, animated: true)
        case 1003: // URL
            let url = URL(string: "http://DWModuleNext/action_ToNextViewControllerWithDict?title=Davy&h_id=999")
            let vc = DWMediator.sharedInstance().dw_routerWithURL(url)
            navigationController?.pushViewController(vc!, animated: true)
        default:
            break
            
        }
    }
}

