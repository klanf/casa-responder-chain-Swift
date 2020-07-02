# casa-responder-chain-Swift
一种基于响应链传递数据的方式-Swift版

### 简单的代码
~~~
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
~~~

### 发送事件时
~~~
next?.routerEvent(name: ATableViewCell.ATableViewCellAEvent, info: ["aTitle":index])
~~~

### 响应事件时
~~~
func routerEvent(withName: String, info: [String : Any]) {
         /*
            do things you want
        */

    // 如果需要让事件继续往上传递，则继续调用下面的语句
    next?.routerEvent(name: BTableViewCell.BTableViewCellAEvent, info: ["bTitle":index])
    }
~~~


引用资料：
<br>[一种基于ResponderChain的对象交互方式](https://casatwy.com/responder_chain_communication.html)
<br>[一种基于响应链传递数据的方式-OC版](https://github.com/objbee/casa-responder-chain)
<br>swift版本的出处暂时没有找到
