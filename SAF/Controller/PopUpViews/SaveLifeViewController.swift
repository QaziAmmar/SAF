//
//  SaveLifeViewController.swift
//  SAF
//
//  Created by Mudassar on 16/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit

class SaveLifeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtnAction(_ sender: Any) {
        
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCurlUp, animations: {
            self.view.removeFromSuperview()
        }, completion: nil)
        
    }

}
