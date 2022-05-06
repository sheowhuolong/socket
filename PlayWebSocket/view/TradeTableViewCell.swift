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
        let timeStamp = data.E
        let timeInterval = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
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
