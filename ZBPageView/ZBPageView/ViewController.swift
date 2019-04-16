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
        
        let titles  = ["英雄联盟","王者荣耀","绝地求生","皇室战争"]
        var childVcs = [UIViewController]()
        let style = ZBTitleStyle()
        style.titleHeight = 44
        for _ in 0..<titles.count {
            let vc =  UIViewController()
            vc.view.backgroundColor = UIColor.randomColor()
            childVcs.append(vc)
            
        }
        let pageFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        let pageView = ZBPageView(frame: pageFrame, titles: titles, childVcs: childVcs, parentVc: self,style: style)
        view.addSubview(pageView)
        
        
        // Do any additional setup after loading the view.
    }


}

