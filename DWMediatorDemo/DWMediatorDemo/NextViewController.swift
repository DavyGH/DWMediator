//
//  NextViewController.swift
//  DWMediatorDemo
//
//  Created by Crazy Davy on 2018/11/9.
//  Copyright © 2018 Crazy Davy. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var dict: [String:Any]? // 传递过来的字典
    var model: NextModel? // 传递过来的模型

    override func viewDidLoad() {
        super.viewDidLoad()
        if model != nil {
            view.backgroundColor = model?.bgColor ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            title = "\(model?.title ?? "")\(model?.h_id ?? 0)"
        }
        if dict != nil {
            view.backgroundColor = (dict?["bgColor"] as? UIColor) ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            title = "\(dict?["title"] ?? "")\(dict?["h_id"] ?? 0)"
        }
    }
}
