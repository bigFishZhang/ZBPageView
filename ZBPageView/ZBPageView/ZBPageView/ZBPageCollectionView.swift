//
//  ZBPageCollectionView.swift
//  ZBPageView
//
//  Created by zhang zhengbin on 2019/5/5.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit

protocol ZBPageCollectionViewDataSource:class {
    func numberOfSections(in pageCollectionView: ZBPageCollectionView)-> Int
    func pageCollectionView(_ collectionView: ZBPageCollectionView, numberOfItemsInSection section: Int) -> Int
    func pageCollectionView(_ pageCollectionView: ZBPageCollectionView,_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
}



class ZBPageCollectionView: UIView {
    
    weak var dataSource:ZBPageCollectionViewDataSource?
    
    fileprivate var titles:[String]
    fileprivate var isTitleInTop:Bool
    fileprivate var layout:UICollectionViewFlowLayout
    fileprivate var style:ZBTitleStyle
    fileprivate var collectionView:UICollectionView!
    
    init(frame: CGRect,
         titles:[String],
         style:ZBTitleStyle,
         isTitleInTop:Bool,
         layout:ZBPageCollectionViewFlowLayout) {
        
        self.titles = titles
        self.isTitleInTop = isTitleInTop
        self.layout = layout
        self.style = style
       
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - 设置界面
extension ZBPageCollectionView {
    fileprivate func setupUI(){
        // 1 creat title view
        let titleY = isTitleInTop ? 0 : bounds.height - style.titleHeight
        let titleFrame = CGRect(x: 0, y: titleY, width: bounds.width, height: style.titleHeight)
        let titleView = ZBTitleView(frame: titleFrame, titles: titles, style: style)
        titleView.backgroundColor = UIColor.randomColor()
        addSubview(titleView)
        
        // 2 creat UIPageControl
        let pageControlHeight:CGFloat = 20
        let pageControlY = isTitleInTop ? (bounds.height - pageControlHeight):(bounds.height - pageControlHeight - style.titleHeight)
        let pageControlFrame = CGRect(x: 0, y: pageControlY, width: bounds.width, height: pageControlHeight)
        let pageControl = UIPageControl(frame: pageControlFrame)
        pageControl.numberOfPages = 4
        pageControl.backgroundColor = UIColor.randomColor()
        addSubview(pageControl)
        
        // 3 creat UICollectionView
        let collectionViewY = isTitleInTop ? style.titleHeight : 0
        let collectionViewFrame = CGRect(x: 0, y: collectionViewY, width: bounds.width, height: bounds.height - style.titleHeight - pageControlHeight)
        collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        collectionView.dataSource = self;
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.randomColor()
        addSubview(collectionView)
        
    }
}

// MARK: - 对外暴露的方法
extension ZBPageCollectionView{
    
    func register(cell:AnyClass?, identifier:String)  {
        collectionView.register(cell, forCellWithReuseIdentifier: identifier)
    }
    
    func register(nib:UINib, identifier:String)  {
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
        
    }
}


// MARK: - UICollectionViewDataSource
extension ZBPageCollectionView:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource?.numberOfSections(in: self) ?? 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.pageCollectionView(self, numberOfItemsInSection: section) ?? 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return dataSource!.pageCollectionView(self, collectionView, cellForItemAt: indexPath)
    }
    
    
}
