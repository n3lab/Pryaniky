//
//  PictureCell.swift
//  Pryaniky
//
//  Created by n3deep on 21.07.2020.
//  Copyright © 2020 n3deep. All rights reserved.
//

import UIKit

class PictureCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
