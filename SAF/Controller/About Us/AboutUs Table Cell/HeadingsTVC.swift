//
//  HeadingsTVC.swift
//  SAF
//
//  Created by Mudassar on 04/12/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit

class HeadingsTVC: UITableViewCell {

    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var headingNumber: UILabel!
    @IBOutlet weak var headingText: UILabel!
    
    //MARK: Value cell outlets
    @IBOutlet weak var valueHeading: UILabel!
    @IBOutlet weak var valueText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
