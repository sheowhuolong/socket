//
//  ViewController.swift
//  PlayWebSocket
//
//  Created by Mac on 2022/5/6.
//  Copyright © 2022年 Mac. All rights reserved.
//

import UIKit
import SnapKit
import Starscream
import SwiftyJSON

class ViewController: UIViewController {
    
    private var tableView = UITableView()
    private var socket: WebSocketClient?
    private var tradeInfo = [TradeInfo]()
    
    private var socketURL = "wss://stream.yshyqxx.com/stream?streams=btcusdt@trade"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchData()
    }
    
    private func configureUI() {
        setTableView()
    }
    
    private func fetchData() {
        guard let url = URL(string: socketURL) else { return }
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 5
        
    
        socket = WebSocket(request: request)
        socket?.delegate = self
        socket?.connect()
    }
    
    private func clearData() {
        if tradeInfo.count > 40 {
            tradeInfo.removeLast()
        }
    }

    private func setTableView() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        tableView.separatorStyle = .none
        tableView.estimatedSectionHeaderHeight = 30
        tableView.register(TradeTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

extension ViewController: WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print(text)
        
        guard let textString = text.data(using: .utf8) else { return }
        let json = JSON(textString)
        
        let data = Trade(json: json)
        self.tradeInfo.insert(data.data, at: 0)
        self.clearData()
        self.tableView.reloadData()
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return TradeTableViewHeaderView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tradeInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TradeTableViewCell else { return UITableViewCell() }
        cell.setContent(data: tradeInfo[indexPath.row])
        return cell
    }
}

