//
//  ZBContentView.swift
//  ZBPageView
//
//  Created by zzb on 2019/4/15.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit

class ZBContentView: UIView {
    
    fileprivate var childVcs: [UIViewController]
    fileprivate var parentVc: UIViewController
    
    init(frame: CGRect,childVcs:[UIViewController],parentVc:UIViewController) {
        self.childVcs = childVcs
        self.parentVc = parentVc
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
