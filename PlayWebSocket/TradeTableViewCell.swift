//
//  TradeTableViewCell.swift
//  PlayWebSocket
//
//  Created by Mac on 2022/5/6.
//  Copyright © 2022年 Mac. All rights reserved.
//

import UIKit

class TradeTableViewCell: UITableViewCell {

    private var timeLabel = UILabel()
    private var priceLabel = UILabel()
    private var countLabel = UILabel()
    
    private func setTimeLabel() {
        self.contentView.addSubview(timeLabel)
        timeLabel.textAlignment = .center
    }
    
    private func setPriceLabel() {
        self.contentView.addSubview(priceLabel)
        priceLabel.textColor = .red
        priceLabel.textAlignment = .center
    }
    
    private func setCountLabel() {
        self.contentView.addSubview(countLabel)
        countLabel.textAlignment = .center
    }
    
    func setContent(data: TradeInfo) {
        
        
        // 我們上面 print 出的時間戳
        let timeStamp = data.E
        // 將時間戳轉換成 TimeInterval
        let timeInterval = TimeInterval(timeStamp)
        // 初始化一個 Date
        let date = Date(timeIntervalSince1970: timeInterval)
        // 實例化一個 DateFormatter
        let dateFormatter = DateFormatter()
        // 設定日期格式
        dateFormatter.dateFormat = "HH:mm:ss"
        // 將日期轉換成 string 輸出給 today
        let time = dateFormatter.string(from: date)
        
        
        
        timeLabel.text = time
        priceLabel.text = data.p
        countLabel.text = data.q
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }

    private func setUI() {
        setTimeLabel()
        setPriceLabel()
        setCountLabel()
        setConstraint()
    }
    
    private func setConstraint() {
        timeLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(8)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.centerY.width.equalTo(timeLabel)
            make.left.equalTo(timeLabel.snp.right)
        }
        
        countLabel.snp.makeConstraints { (make) in
            make.centerY.width.equalTo(priceLabel)
            make.left.equalTo(priceLabel.snp.right)
            make.right.equalToSuperview().offset(-8)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
