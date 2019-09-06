//
//  EventFilterCell.swift
//  SAF
//
//  Created by Mudassar on 13/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit

class EventFilterCell: UITableViewCell {

    @IBOutlet weak var awnrnessbtn: UIButton!
    @IBOutlet weak var fundraisingBtn: UIButton!
    @IBOutlet weak var generalBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.awnrnessbtn.layer.borderColor = UIColor.white.cgColor
        self.fundraisingBtn.layer.borderColor = UIColor.white.cgColor
        self.generalBtn.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
