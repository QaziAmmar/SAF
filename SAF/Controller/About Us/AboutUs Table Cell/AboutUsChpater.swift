//
//  ChapterTVC.swift
//  SAF
//
//  Created by Mudassar on 18/12/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit
import SDWebImage

class AboutUsChapterTVC: UITableViewCell {

    @IBOutlet weak var chapterNameLbl: UILabel!
    @IBOutlet weak var chpaterIcon: UIImageView!
    @IBOutlet weak var viewColor: UIView!
    
    //chapter detail cell attribute
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setChapter(tempchapter: Chapter){
        chapterNameLbl.text = tempchapter.chapter_name
        chpaterIcon.sd_setImage(with: URL(string: tempchapter.icon), placeholderImage: UIImage(named: "placeHolder"))
        viewColor.backgroundColor = UIColor(rgb: stringToHexa(colorStr: tempchapter.header_color))
    }
}
