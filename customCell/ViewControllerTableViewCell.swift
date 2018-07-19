//
//  ViewControllerTableViewCell.swift
//  customCell
//
//  Created by Sebastian Hette on 23.09.2016.
//  Copyright © 2016 MAGNUMIUM. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var myImage: UIImageView!
    
    
    
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myImage.layer.cornerRadius = myImage.frame.size.width / 2
        myImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func congigureCell(text: String) {
        
        myLabel.text = text
    }

}
