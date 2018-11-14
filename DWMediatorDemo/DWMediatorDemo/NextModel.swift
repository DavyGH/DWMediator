//
//  NextModel.swift
//  DWMediatorDemo
//
//  Created by Crazy Davy on 2018/11/9.
//  Copyright © 2018 Crazy Davy. All rights reserved.
//

import UIKit

class NextModel: NSObject {
    var bgColor: UIColor?
    var title: String?
    var h_id: Int?
    
    init(bgColor:UIColor,title:String,h_id:Int) {
        self.bgColor = bgColor
        self.title = title
        self.h_id = h_id
    }
}
