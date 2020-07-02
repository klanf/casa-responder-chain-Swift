//
//  UIResponder+Router.swift
//  casa-responder-chain-Swift
//
//  Created by klanf on 2020/7/2.
//  Copyright © 2020 com.klanf.ios. All rights reserved.
//
import UIKit

// 基于响应链传递view层数据的一种方式
@objc protocol KRouter {
    func routerEvent(withName : String , info : [String:Any])
}

extension UIResponder {
    
    func routerEvent(name : String , info : [String:Any]) {
        if self.conforms(to: KRouter.self) {
            (self as! KRouter).routerEvent(withName: name, info: info)
        } else {
            self.next?.routerEvent(name: name, info: info)
        }
    }
}
