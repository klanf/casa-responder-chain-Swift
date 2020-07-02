//
//  ATableViewCell.swift
//  casa-responder-chain-Swift
//
//  Created by jaime on 2020/7/2.
//  Copyright © 2020 com.klanf.ios. All rights reserved.
//

import UIKit

//MARK:- life cycle
extension ATableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding: CGFloat = 10
        aButton.center = contentView.center
        bButton.frame = CGRect(x: aButton.frame.maxX + padding, y: aButton.frame.minY, width: aButton.frame.width, height: aButton.frame.height)
    }
}

//MARK:- Event Response
extension ATableViewCell {
    @objc func onClickAButton() {
        print("------onClickAButton------")
        next?.routerEvent(name: ATableViewCell.ATableViewCellAEvent, info: ["aTitle":index])
    }
    
    @objc func onClickBButton() {
        print("------onClickBButton------")
        next?.routerEvent(name: ATableViewCell.BTableViewCellBEvent, info: ["bTitle":index])
    }
}

//MARK:- Public Method
extension ATableViewCell {
    func config(data: Int) {
        textLabel?.text = "第\(data)行"
        index = data
    }
    
}

//MARK:- lazy load
class ATableViewCell: UITableViewCell {

    static let identifier = "ATableViewCellIdentifier"
    static let ATableViewCellAEvent = "ATableViewCell_AEvent"
    static let BTableViewCellBEvent = "BTableViewCell_BEvent"
    var index = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(aButton)
        contentView.addSubview(bButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var aButton: UIButton = {
        let aButton = UIButton.init(type: .system)
        aButton.backgroundColor = .lightGray
        aButton.sizeToFit()
        aButton.setTitle("A", for: .normal)
        aButton.clipsToBounds = true
        aButton.layer.cornerRadius = 5
        aButton.addTarget(self, action: #selector(onClickAButton), for: .touchUpInside)
        return aButton
    }()
    
    lazy var bButton: UIButton = {
        let bButton = UIButton.init(type: .system)
        bButton.backgroundColor = .lightGray
        bButton.sizeToFit()
        bButton.setTitle("B", for: .normal)
        bButton.clipsToBounds = true
        bButton.layer.cornerRadius = 5
        bButton.addTarget(self, action: #selector(onClickBButton), for: .touchUpInside)
        return bButton
    }()

}
