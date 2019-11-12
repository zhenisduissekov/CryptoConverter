//
//  ConvertViewController.swift
//  CryptoConverterMVC
//
//  Created by Zhenis on 11/10/19.
//  Copyright © 2019 Zhenis. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController {
  var timer: Timer?
  static var chosenIndex: Int?
  var quoteProvider = QuoteProvider()
  var quotes: [Quote] = []
  var button: UIButton?
  var myDict = ["BaseQuote": 0, "ConvertQuote": 0]
  
  enum Constants {
    static var quoteNumber = 100
  }
  
  @IBAction func convertQuoteButton(_ sender: UIButton) {
    self.button = sender
  }
  
  
  @IBAction func baseQuoteButton(_ sender: UIButton) {
    self.button = sender
  }
  
  @IBOutlet weak var convertQuoteField: UITextField!
  @IBOutlet weak var baseQuoteField: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    quotes = quoteProvider.generateQuotes(count: Constants.quoteNumber)
    convertQuoteField.text = ""
    convertQuoteField.isUserInteractionEnabled = false
    setTimer()
  }
  
  func setBg(withText text: String, on button: UIButton, withImage image: String) {
    
    button.setTitle(text, for: UIControl.State.normal)
    
    // так как у меня не совпадают картинки к котировкам прошу не сильно ругать если я оставлю сокращения к котировкам так выглядет даже лучше чем с картинками
//    if let image = UIImage(named: image){
//      button.setImage(image, for: UIControl.State.normal)
//       }
//
    
  }
  
  func setTimer(){
    if timer == nil {
      // 2
      timer = Timer.scheduledTimer(timeInterval: 1.0,
                                   target: self,
                                   selector: #selector(updateTimer),
                                   userInfo: nil,
                                   repeats: true)
    }
  }
  
  func quoteObserver() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(received(notif:)),
                                           name: GlobalConstants.notificationName,
                                           object: nil)
  }
  
  @objc func received(notif: Notification) {
    if let object = notif.object as? [Quote] {
      quotes = object
    }
  }
  
  
  func calculate() -> String {
    quoteObserver()
    let basequote = Converter()
    basequote.quote = quotes[myDict["BaseQuote"] ?? 0]
    let convertquote = Converter()
    convertquote.quote = quotes[myDict["ConvertQuote"] ?? 0]
    
    let amountText = baseQuoteField.text
    if let amount = Double(amountText!) {
    return  String(basequote.BaseQuote2ConvertQuote(amount: amount, converter: convertquote))
    } else {
      return "NaN"
    }
  }
}
  
  // MARK: - Timer
  extension ConvertViewController {
    @objc func updateTimer() {
      
      if let button = button as UIButton? {
        setBg(withText: symbol_list[ConvertViewController.chosenIndex ?? 0], on: button, withImage: image_list[ConvertViewController.chosenIndex ?? 0])
        if let a = button.restorationIdentifier as String? {
          myDict[a] = ConvertViewController.chosenIndex ?? 0
        }
      }
      convertQuoteField.text = calculate()
    }
}



