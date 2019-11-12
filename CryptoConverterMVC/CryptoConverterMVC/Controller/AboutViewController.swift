//
//  AboutViewController.swift
//  CryptoConverterMVC
//
//  Created by Zhenis on 11/11/19.
//  Copyright © 2019 Zhenis. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      aboutLabel.text = "Shortly about me: Zhenis Duissekov"
        // Do any additional setup after loading the view.
    }
    
  @IBOutlet weak var aboutLabel: UILabel!
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
