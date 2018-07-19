//
//  newViewController.swift
//  customCell
//
//  Created by DSi on 12/7/18.
//  Copyright © 2018 MAGNUMIUM. All rights reserved.
//

import Foundation
import UIKit
class newViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var newImageview: UIImageView!
    
    @IBOutlet weak var desLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = car[myIndex]
        newImageview.image = UIImage(named: car[myIndex])
        desLabel.text = des[myIndex]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
