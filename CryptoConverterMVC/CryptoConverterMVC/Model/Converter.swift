//
//  Converter.swift
//  CryptoConverterMVC
//
//  Created by Zhenis on 11/10/19.
//  Copyright © 2019 Zhenis. All rights reserved.
//

import Foundation
class Converter {
  var quote: Quote?
  var description: String {
    return "\t\tquote=\(String(describing: quote))"
  }
  
  enum Constants {
    static var decimalRange = 1000.0
    static var defaultValue = 0.0
  }
  
  
  
  func BaseQuote2ConvertQuote(amount: Double, converter: Converter) -> Double{
    if let a = self.quote?.price_usd, let b = converter.quote?.price_usd {
      return round(a/b*amount*Constants.decimalRange)/Constants.decimalRange
      }
    return Constants.defaultValue
  }
}
