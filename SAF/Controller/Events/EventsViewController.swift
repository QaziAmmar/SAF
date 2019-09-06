//
//  EventsViewController.swift
//  SAF
//
//  Created by Mudassar on 06/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil{
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            revealViewController().panGestureRecognizer
            revealViewController().tapGestureRecognizer()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension EventsViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(indexPath.row)") as! EventFilterCell
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(indexPath.row)")
            return cell!
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 350
        }
//        else if indexPath.row == 1
//        {
//            return 620
//        }
//        else if indexPath.row == 2
//        {
//            return 500
//        }
        else
        {
            return 480
        }
    }
}



