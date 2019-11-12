//
//  Quote.swift
//  CryptoConverterMVC
//
//  Created by Zhenis on 11/3/19.
//  Copyright © 2019 Zhenis. All rights reserved.
//

import Foundation

struct Quote {
  var id: String
  var name: String
  var symbol: String
  var rank: Int
  var price_usd: Double
  var price_btc: Double
  var _24h_volume_usd: Double
  var market_cap_usd: Double
  var available_supply: Double
  var total_supply: Double
  var max_supply: Double
  var percent_change_1h: Double
  var percent_change_24h: Double
  var percent_change_7d: Double
  var last_updated: Date
  var date_full: String {
    let calendar = Calendar.current
    let year = calendar.component(.year, from: last_updated)
    let month = calendar.component(.month, from: last_updated)
    let day = calendar.component(.day, from: last_updated)
    let hour = calendar.component(.hour, from: last_updated)
    let minute = calendar.component(.minute, from: last_updated)
    let second = calendar.component(.second, from: last_updated)
    return "\(hour):\(minute):\(second)  \(day)-\(month)-\(year)"
  }
  var date_short: String {
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: last_updated)
    let minute = calendar.component(.minute, from: last_updated)
    let second = calendar.component(.second, from: last_updated)
    return "\(hour):\(minute):\(second)"
  }

  func adjustSize(text: String) -> String {
    return "str"
  }
}
