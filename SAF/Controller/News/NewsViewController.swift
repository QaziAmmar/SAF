//
//  NewsViewController.swift
//  SAF
//
//  Created by Mudassar on 06/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
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
    
    
}
extension NewsViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0
        {
            return 350
        }
            else if indexPath.row == 1
        {
            return 650
        }
        else
        {
            return 550
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(indexPath.row)")
        //            let cell = tableView.dequeueReusableCell(withIdentifier: , for: indexPath)
        return cell!
        
    }
    
}
