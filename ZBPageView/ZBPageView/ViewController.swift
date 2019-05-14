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
        
        //            addPageView()
        addPageCollectionView()
    }
    
    func addPageCollectionView()  {
        automaticallyAdjustsScrollViewInsets = false
        let titles  = ["DNF","编程大赛","英雄联盟","王者"]
        
        //TitleStyle样式
        let style = ZBTitleStyle()
        style.isShowScrollLine  = true
        // 初始化所有子控制器
        
        
        let layout = ZBPageCollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
        layout.minimumLineSpacing  = 20
        layout.minimumInteritemSpacing = 18
//        layout.
        //创建 pageView
        let pageFrame = CGRect(x: 0, y: 64, width: view.bounds.width, height: view.bounds.height-64)
        let pageCollectionView = ZBPageCollectionView(frame: pageFrame, titles: titles, style: style, isTitleInTop: true, layout: layout)
        
        //pageView添加到控制器的View中
        view.addSubview(pageCollectionView)
    }
    
    func addPageView()  {
        automaticallyAdjustsScrollViewInsets = false
        let titles  = ["DNF","编程大赛","英雄联盟","王者","绝地求生"]
        
        //TitleStyle样式
        let style = ZBTitleStyle()
        style.titleHeight = 44
        style.isScrollEnable = true
        style.isShowScrollLine = true
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

