//
//  CareersViewController.swift
//  SAF
//
//  Created by Mudassar on 06/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit

class CareersViewController: UIViewController {
    
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
    
    @IBAction func saveLifePopUpAction(_ sender: Any) {
        let saveLifeView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Life") as! SaveLifeViewController
       
        self.addChildViewController(saveLifeView)
        saveLifeView.view.frame = self.view.frame
        
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCurlDown, animations: {
            self.view.addSubview(saveLifeView.view)
        }, completion: nil)
        
        saveLifeView.didMove(toParentViewController: self)
    }
    
    
    @IBAction func helpPopUpActionBtn(_ sender: Any) {
        let helpView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Education") as! HelpEducateViewController
        
        self.addChildViewController(helpView)
        helpView.view.frame = self.view.frame
        
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCurlDown, animations: {
            self.view.addSubview(helpView.view)
        }, completion: nil)
        
        helpView.didMove(toParentViewController: self)
    }
    
    @IBAction func volunteerPopUpActionBtn(_ sender: Any) {
        let volunteerView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Volunteer") as! VolunteerViewController
 
        self.addChildViewController(volunteerView)
        volunteerView.view.frame = self.view.frame
        
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCurlDown, animations: {
            self.view.addSubview(volunteerView.view)
        }, completion: nil)
        
        volunteerView.didMove(toParentViewController: self)
        
    }
    
    
    @IBAction func moveDonationBtnAction(_ sender: Any) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "DonationReveal") as UIViewController
        self.present(vc, animated: true, completion: nil)
    }
}

extension CareersViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 1
        {
            return 1500
        }
        else
        {
            return 350
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(indexPath.row)")
        //            let cell = tableView.dequeueReusableCell(withIdentifier: , for: indexPath)
        return cell!
        
    }
    
}


