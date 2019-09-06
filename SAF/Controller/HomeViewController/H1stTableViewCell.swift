//
//  H1stTableViewCell.swift
//  SAF
//
//  Created by Mudassar on 04/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit
import ImageSlideshow

class H1stTableViewCell: UITableViewCell {
    @IBOutlet weak var imageSlider: ImageSlideshow!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
