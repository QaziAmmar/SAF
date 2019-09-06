//
//  MapTableViewCell.swift
//  SAF
//
//  Created by Mudassar on 12/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mapview: GMSMapView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  

}
