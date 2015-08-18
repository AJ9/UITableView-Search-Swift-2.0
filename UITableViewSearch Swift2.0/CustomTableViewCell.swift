//
//  CustomTableViewCell.swift
//  UITableViewSearch Swift2.0
//
//  Created by Adam Gask on 18/08/2015.
//  Copyright © 2015 AJ9. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
