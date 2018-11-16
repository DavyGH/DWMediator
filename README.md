# DWMediator
组件化管理

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

可以对每个模块写一个类进行管理

    func action_ToNextViewControllerWithModel(params: [String:Any]?) -> UIViewController? {
        let vc = NextViewController()
        if let model = params?["model"] as? NextModel {
            vc.model = model
        }
        return vc
    }
    
    // 模块类 模块中的方法名称 传递的参数
    func dw_routerToNextViewControllerWithModel(_ params: [String:Any]?) -> UIViewController? {
        guard let vc = performTarget("DWModuleNext", action: "action_ToNextViewControllerWithModel", params: params ?? [:], shouldCacheTarget: false) as? UIViewController else {
            print("未找到NextViewController")
            // 这里处理异常场景，具体如何处理取决于产品
            return UIViewController()
        }
        return vc
    }
