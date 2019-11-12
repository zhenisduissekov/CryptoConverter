//
//  QuoteCell.swift
//  CryptoConverterMVC
//
//  Created by Zhenis on 11/3/19.
//  Copyright © 2019 Zhenis. All rights reserved.
//

import UIKit

class QuoteCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var avalLabel: UILabel!
  @IBOutlet weak var marketLabel: UILabel!
  @IBOutlet weak var volume24Label: UILabel!
  @IBOutlet weak var priceBTCLabel: UILabel!
  @IBOutlet weak var priceUSDLabel: UILabel!
  @IBOutlet weak var symbolLabel: UILabel!
  @IBOutlet weak var rankLabel: UILabel!
  @IBOutlet weak var idLabel: UILabel!

  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var LogoImage: UIImageView!

  @IBOutlet weak var maxsupplyLabel: UILabel!
  
  @IBOutlet weak var percent1hrLabel: UILabel!
  @IBOutlet weak var percent24hrLabel: UILabel!
  @IBOutlet weak var percent7daysLabel: UILabel!
}
