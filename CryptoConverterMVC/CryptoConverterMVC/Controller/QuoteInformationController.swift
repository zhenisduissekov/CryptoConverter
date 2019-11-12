//
//  QuoteInformationController.swift
//  CryptoConverterMVC
//
//  Created by Zhenis on 11/6/19.
//  Copyright © 2019 Zhenis. All rights reserved.
//

import UIKit

class QuoteInformationController: UITableViewController {
  var quoteArray = [String]()
  var quote: Quote?
  var quoteIndex: Int?
  
  enum Constants {
    static var cellHeight: CGFloat = 35.0
    static var cellColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0 )
    static var logoBGColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0 )
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    generateQuoteDataTable()
    tableView.reloadData()
    quoteObserver()
  }
  
  func quoteObserver() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(received(notif:)),
                                           name: GlobalConstants.notificationName,
                                           object: nil)
    
    
  }
  
  @objc func received(notif: Notification) {
    if let object = notif.object as? [Quote] {
      if let quoteIndex = quoteIndex {
        quote = object[quoteIndex]
        generateQuoteDataTable()
        tableView.reloadData()
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return Constants.cellHeight
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return quoteArray.count
  }
  
  
  func generateQuoteDataTable() {
    if let quote = quote {
      
      quoteArray = ["ID: " + quote.id,
                    "NAME: " + quote.name,
                    "SYMBOL: " + quote.symbol,
                    "RANK: " + String(quote.rank),
                    "PRICE(USD): " + String(quote.price_usd),
                    "PRICE(BTC): " + String(quote.price_btc),
                    "VOLUME 24H(USD): " + String(quote._24h_volume_usd),
                    "MARKET CAP(USD): " + String(quote.market_cap_usd),
                    "CHANGE 1h(%): " + String(quote.percent_change_1h),
                    "CHANGE 24h(%): " + String(quote.percent_change_24h),
                    "CHANGE 7d(%): " + String(quote.percent_change_7d),
                    "LAST UPDATED: " + quote.date_full]
    }
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "quoteDetIdentifier", for: indexPath) as! QuoteDetailCellTableViewCell
    
    let currentIndex = indexPath.row + 1
    cell.quoteInfoLabel.text = quoteArray[indexPath.row]
    cell.backgroundColor = indexPath.row % 2 == 1 ? Constants.cellColor : UIColor.clear
    
    
    if currentIndex == 1, let quote = quote {
      if let image = UIImage(named: image_list[quote.rank]){
        cell.LogoImageQInfo.image = image
        cell.LogoImageQInfo.backgroundColor = Constants.logoBGColor
      }
    }
    
    return cell
  }
  
}


