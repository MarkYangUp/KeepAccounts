//
//  ChooseItemVC.swift
//  KeepAccounts
//
//  Created by admin on 16/2/16.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

protocol ChooseItemProtocol{
    func setCostBarIconAndTitle(icon:String, title:String)
}


class ChooseItemVC: UIViewController,ChooseItemProtocol {

    let ScreenWidth = UIScreen.mainScreen().bounds.width
    let ScreenHeight = UIScreen.mainScreen().bounds.height
    
    let ComputeBoardHeight =  UIScreen.mainScreen().bounds.height/2 - 20 + 72
    
    let TopBarHeight: CGFloat = 44.0
    var ComputedBar:ComputeBoardView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        //创建顶部栏
        setupTopBar()
        //创建图标项
        setupItem()
        //消费金额和计算面板栏
        setupComputeBoard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //创建顶部栏
    func setupTopBar(){
        
        //底部栏
        let topBar = TopBarView(frame: CGRectMake(0, 20, ScreenWidth, TopBarHeight))
        //添加到主view上
        self.view.addSubview(topBar)
    }
    
    //创建图标项
    func setupItem(){
        let ItemBarHeight = ScreenHeight - 20 - TopBarHeight - ComputeBoardHeight
        let itemBar = ItemBarView(frame: CGRectMake(0, 20 + TopBarHeight , ScreenWidth, ItemBarHeight))
        itemBar.delegate = self
        self.view.addSubview(itemBar)
    }
    
    //创建计算面板
    func setupComputeBoard(){
        //创建计算面板
        let computeBoard = ComputeBoardView(frame: CGRectMake(0, ScreenHeight - ComputeBoardHeight, ScreenWidth, ComputeBoardHeight))
        ComputedBar = computeBoard
        //添加到self.view
        self.view.addSubview(computeBoard)
    }
    
    func setCostBarIconAndTitle(icon: String, title: String) {
        ComputedBar?.title.text = title
        ComputedBar?.icon = UIImage(named: icon)
    }
    
}
