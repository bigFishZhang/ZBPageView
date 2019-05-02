//
//  ViewController.swift
//  ZBPageView
//
//  Created by zzb on 2019/4/15.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        let titles  = ["DNF","编程大赛","英雄联盟","王者","绝地求生","皇室战争","MSI冠军"]
        
        //TitleStyle样式
        let style = ZBTitleStyle()
        style.titleHeight = 44
        style.isScrollEnable = true
        
        // 初始化所有子控制器
        var childVcs = [UIViewController]()
        for _ in 0..<titles.count {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.randomColor()
            childVcs.append(vc)
        }
        
        //创建 pageView
        let pageFrame = CGRect(x: 0, y: 64, width: view.bounds.width, height: view.bounds.height-64)
        let pageView = ZBPageView(frame: pageFrame,
                                  titles: titles,
                                  childVcs: childVcs,
                                  parentVc: self,
                                  style: style)
        
        //pageView添加到控制器的View中
        view.addSubview(pageView)
        

    }


}

