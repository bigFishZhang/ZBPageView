//
//  ZBPageView.swift
//  ZBPageView
//
//  Created by zzb on 2019/4/15.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit

class ZBPageView: UIView {

    fileprivate var titles   : [String]
    fileprivate var childVcs : [UIViewController]
    fileprivate var parentVc : UIViewController
    fileprivate var style    : ZBTitleStyle
    fileprivate var titleView: ZBTitleView!
    
    init(frame: CGRect,titles:[String],childVcs:[UIViewController],
         parentVc:UIViewController,style:ZBTitleStyle) {
        
        self.titles   = titles
        self.childVcs = childVcs
        self.parentVc = parentVc
        self.style    = style
        
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK UI设置
extension ZBPageView {
    fileprivate func setupUI(){
        setupTitleView()
        setupContentView()
    }
    
    private func  setupTitleView() {
        let titleFrame = CGRect(x: 0, y: 0, width: bounds.width, height: style.titleHeight)
        titleView  = ZBTitleView(frame: titleFrame, titles: titles)
        addSubview(titleView)
        titleView.backgroundColor = UIColor.randomColor()
    }
    private func setupContentView() {
        
        let ContentFrame = CGRect(x: 0,
                                  y: style.titleHeight,
                                  width: bounds.width,
                                  height: bounds.height - style.titleHeight)
        
        let contentView = ZBContentView(frame: ContentFrame, childVcs: childVcs, parentVc: parentVc)
        contentView.backgroundColor = UIColor.randomColor()
        addSubview(contentView)
        
    }
    
    
    
    
}



