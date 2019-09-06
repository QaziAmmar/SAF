//
//  TeamTVC.swift
//  SAF
//
//  Created by Mudassar on 04/12/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit

class TeamTVC: UITableViewCell {

    
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamDesegination: UILabel!
    @IBOutlet weak var teamDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
