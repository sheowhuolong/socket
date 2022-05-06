//
//  TradeTableViewHeaderView.swift
//  PlayWebSocket
//
//  Created by Mac on 2022/5/6.
//  Copyright © 2022年 Mac. All rights reserved.
//

import UIKit

class TradeTableViewHeaderView: UIView {

    private var timeLabel = UILabel()
    private var priceLabel = UILabel()
    private var countLabel = UILabel()
    
    private func setTimeLabel() {
        self.addSubview(timeLabel)
        timeLabel.text = "時間"
        timeLabel.textAlignment = .center
    }
    
    private func setPriceLabel() {
        self.addSubview(priceLabel)
        priceLabel.textColor = .red
        priceLabel.text = "價格"
        priceLabel.textAlignment = .center
    }
    
    private func setCountLabel() {
        self.addSubview(countLabel)
        countLabel.text = "數量"
        countLabel.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
