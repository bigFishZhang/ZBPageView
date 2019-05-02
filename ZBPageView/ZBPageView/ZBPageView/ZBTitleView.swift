//
//  ZBTitleView.swift
//  ZBPageView
//
//  Created by zzb on 2019/4/15.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit

class ZBTitleView: UIView {
    
    fileprivate var titles: [String]
    fileprivate var style : ZBTitleStyle
    
    fileprivate lazy var titleLabels:[UILabel] = [UILabel]()
    
    fileprivate lazy var scrollView:UIScrollView = {
       let scrollView = UIScrollView(frame: self.bounds)
       scrollView.showsHorizontalScrollIndicator = false
       scrollView.scrollsToTop = false
       return scrollView
    }()
    
    init(frame: CGRect,titles:[String],style:ZBTitleStyle) {
        self.titles = titles
        self.style  = style
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ZBTitleView {
    fileprivate func setupUI() {
        //1 添加scrollView到view
        addSubview(scrollView)
        //2 titlelabes 添加到scrollView
        setupTitleLabel()
        //3 设置titlelabes的Frame
        setupTitleLabelFrame()
        
    }
    
    private func setupTitleLabel() {
        for(i,title) in titles.enumerated() {
            let titleLabel = UILabel()
            
            titleLabel.text = title
            titleLabel.textColor = style.normalColor
            titleLabel.font = style.fontSize
            titleLabel.tag = i
            titleLabel.textAlignment = .center
            titleLabel.textColor = i == 0 ? style.selectedColor :style.normalColor
            
            scrollView.addSubview(titleLabel)
            
            titleLabels.append(titleLabel)
        }
        
    }
    private func setupTitleLabelFrame(){
        let count = titles.count
        for (i,label) in titleLabels.enumerated(){
            var w :CGFloat = 0;
            let h :CGFloat = bounds.height;
            var x :CGFloat = 0;
            let y :CGFloat = 0;
            
            if style.isScrollEnable {//可以滚动
                w =   (titles[i] as NSString).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 0), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:style.fontSize], context: nil).width
                if i == 0{
                    x = style.itemMargin  * 0.5
                }else{
                    let preLabel = titleLabels[i-1]
                    x = preLabel.frame.maxX + style.itemMargin
                }
            }else{
                
                w = bounds.width / CGFloat(count)
                x = w * CGFloat(i)
            }
            
            label.frame = CGRect(x: x, y: y, width: w, height: h)
        }
        
        
        scrollView.contentSize = style.isScrollEnable ?  CGSize(width: titleLabels.last!.frame.maxX+style.itemMargin*0.5, height: 0):CGSize.zero
        
    }
    
}
