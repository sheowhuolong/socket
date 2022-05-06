//
//  File.swift
//  PlayWebSocket
//
//  Created by Mac on 2022/5/6.
//  Copyright © 2022年 Mac. All rights reserved.
//

import Foundation
import SwiftyJSON

class Trade {
    var stream: String
    var data: TradeInfo
    
    init(json: JSON) {
        self.stream = json["stream"].stringValue
        self.data = TradeInfo(json: json["data"])
    }
}

class TradeInfo {
    var e: String
    var E: Double
    var s: String
    var t: Int
    var p: String
    var q: String
    var a: Int
    var T: Int
    var m: Bool
    var M: Bool
    
    init(json: JSON) {
        self.e = json["e"].stringValue
        self.E = json["E"].doubleValue
        self.s = json["s"].stringValue
        self.t = json["t"].intValue
        self.p = json["p"].stringValue
        self.q = json["q"].stringValue
        self.a = json["a"].intValue
        self.T = json["T"].intValue
        self.m = json["m"].boolValue
        self.M = json["M"].boolValue
    }
}
