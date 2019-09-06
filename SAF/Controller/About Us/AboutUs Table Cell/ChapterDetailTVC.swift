//
//  ChapterDetailTVC.swift
//  SAF
//
//  Created by Mudassar on 18/12/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit

class ChapterDetailTVC: UITableViewCell {

    @IBOutlet weak var personPosition: UILabel!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var email: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
