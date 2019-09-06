//
//  TextViewTableViewCell.swift
//  SAF
//
//  Created by Mudassar on 12/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit

class TextViewTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var messageTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageTextView.delegate = self
        messageTextView.text = "Your Message"
        messageTextView.textColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
