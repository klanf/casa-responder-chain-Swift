//
//  ViewController.swift
//  casa-responder-chain-Swift
//
//  Created by jaime on 2020/7/2.
//  Copyright © 2020 com.klanf.ios. All rights reserved.
//

import UIKit

//MARK:- life cycle
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
}

//MARK:- UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: ATableViewCell.identifier, for: indexPath)
    }
}

//MARK:- UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ATableViewCell else { return }
        cell.config(data: indexPath.row)
        
    }
}

//MARK:- KRouter
extension ViewController: KRouter {
    func routerEvent(withName: String, info: [String : Any]) {
        print("------routerEvent------")
        print("class:\(object_getClassName(self))" + withName + "\(info)" )
    }
}

//MARK:- lazy load
class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 66
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.register(ATableViewCell.self, forCellReuseIdentifier: ATableViewCell.identifier)
        return tableView
    }()
    


}

