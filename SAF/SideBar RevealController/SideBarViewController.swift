//
//  SideBarViewController.swift
//  SAF
//
//  Created by Mudassar on 05/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit

class SideBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var lableArray : [String] = ["Home","About us","Projects","Events","News","Carrers","Contact us","Donation"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = lableArray[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            self.performSegue(withIdentifier: "Home", sender: self)
        }
        else if indexPath.row == 1
        {
            self.performSegue(withIdentifier: "About Us", sender: self)
        }
        else if indexPath.row == 2
        {
            self.performSegue(withIdentifier: "Projects", sender: self)
        }
        else if indexPath.row == 3
        {
            self.performSegue(withIdentifier: "Events", sender: self)
        }
        else if indexPath.row == 4
        {
            self.performSegue(withIdentifier: "News", sender: self)
        }
        else if indexPath.row == 5
        {
            self.performSegue(withIdentifier: "Careers", sender: self)
        }
        else if indexPath.row == 6
        {
            self.performSegue(withIdentifier: "ContactUs", sender: self)
        }
        else
        {
            self.performSegue(withIdentifier: "Donation", sender: self)
        }

        
    }
    
}
