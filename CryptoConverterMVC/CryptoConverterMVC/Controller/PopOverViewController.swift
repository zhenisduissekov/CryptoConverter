//
//  PopOverViewController.swift
//  CryptoConverterMVC
//
//  Created by Zhenis on 11/10/19.
//  Copyright © 2019 Zhenis. All rights reserved.
//

import UIKit

class PopOverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var Popupview: UIView!
  
  @IBOutlet weak var tableView: UITableView!
  
  var names: [String] = name_list
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    // Apply radius to Popupview
    Popupview.layer.cornerRadius = 10
    Popupview.layer.masksToBounds = true
    
  }
  
  
  // Returns count of items in tableView
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.names.count;
  }
  
  
  // Select item from tableView
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
    ConvertViewController.chosenIndex = indexPath.row
    Shared.shared.companyName = names[indexPath.row]

    dismiss(animated: true, completion: nil)
  }
  
  //Assign values for tableView
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: "converterCell", for: indexPath)
    
    cell.textLabel?.text = names[indexPath.row]
    return cell
  }
  
  // Close PopUp
  @IBAction func closePopup(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}
