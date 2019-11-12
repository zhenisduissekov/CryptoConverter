//
//  QuotesTableViewController.swift
//  CryptoConverterMVC
//
//  Created by Zhenis on 11/3/19.
//  Copyright © 2019 Zhenis. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController {
  
  var quoteProvider = QuoteProvider()
  var quotes: [Quote] = []
  var timer: Timer?
  
  
  enum Constants {
    static var cellHeight: CGFloat = 220.0
    static var quoteNumber = 100
    static var timeInterval = 5*60.0
  }
  
  @IBAction func refreshQuotesAction(_ sender: UIBarButtonItem) {
    generateTableContent()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    generateTableContent()
    
  }
  
  func generateTableContent() {
    quotes = quoteProvider.generateQuotes(count: Constants.quoteNumber)
    tableView.reloadData()
    setTimer()
  }
  
  
  // MARK: - Table view delegate
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return Constants.cellHeight
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return quotes.count
  }
  
  func setTimer(){
    if timer == nil {
    // 2
      timer = Timer.scheduledTimer(timeInterval: Constants.timeInterval,
                                 target: self,
                                 selector: #selector(updateTimer),
                                 userInfo: nil,
                                 repeats: true)
    }
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCellIdentifier", for: indexPath) as! QuoteCell
    let quote = quotes[indexPath.row]
    
    if UIDevice.current.orientation.isLandscape == false {
      cell.idLabel.text = "ID: " + quote.id
      cell.nameLabel.text = "NAME: " + quote.name
      cell.rankLabel.text = "RANK: " + String(quote.rank)
      cell.symbolLabel.text = "SYMBOL: " + quote.symbol
      cell.priceUSDLabel.text = "PRICE($): " + String(quote.price_usd)
      cell.priceBTCLabel.text = "PRICE(BTC): " + String(quote.price_btc)
      cell.volume24Label.text = "VOL24h($): " + String(quote._24h_volume_usd)
      cell.avalLabel.text = "AV.SUPP.: " + String(quote.available_supply)
      cell.marketLabel.text = "MARKET($): " + String(quote.market_cap_usd)
      cell.dateLabel.text = "DATE: " + String(quote.date_short)
    } else {
      cell.idLabel.text = "ID: " + quote.id
      cell.nameLabel.text = "NAME: " + quote.name
      cell.rankLabel.text = "RANK: " + String(quote.rank)
      cell.symbolLabel.text = "SYMBOL: " + quote.symbol
      cell.priceUSDLabel.text = "PRICE($): " + String(quote.price_usd)
      cell.priceBTCLabel.text = "PRICE(BTC): " + String(quote.price_btc)
      cell.volume24Label.text = "VOL24h($): " + String(quote._24h_volume_usd)
      cell.avalLabel.text = "AV.SUPP.: " + String(quote.available_supply)
      cell.marketLabel.text = "MARKET($): " + String(quote.market_cap_usd)
      cell.dateLabel.text = "DATE: " + String(quote.date_full)
    
    }
     
    if let image = UIImage(named: image_list[quote.rank]){
      cell.LogoImage.image = image
    }
    return cell
  }
  
  // MARK: - Navigation
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == "toDetail" else {
      return
    }
    
    if let quoteDetail = segue.destination as? QuoteInformationController {
      if let cell = sender as? QuoteCell {
        if let indexPath = tableView.indexPath(for: cell) {
          let quote = quotes[indexPath.row]
          quoteDetail.quote = quote
          quoteDetail.quoteIndex = indexPath.row
        }
      }
      
    }
  }
  
}
// MARK: - Timer
extension QuotesTableViewController {
  @objc func updateTimer() {
    quotes = quoteProvider.generateQuotes(count: Constants.quoteNumber)
    
    
    
    NotificationCenter.default.post(name: GlobalConstants.notificationName, 
                                    object: quotes,
                                    userInfo: nil)
    tableView.reloadData()
  }
}
