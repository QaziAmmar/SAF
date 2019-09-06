//
//  ViewController.swift
//  SAF
//
//  Created by Mudassar on 04/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//


import UIKit
import ImageSlideshow

class HomeViewController: UIViewController {
    
    @IBOutlet weak var showlmoreBtn: UIButton!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableview: UITableView!
    
    var gestureRecognizer = UITapGestureRecognizer()
    var isExpand : Bool! = nil
    var imageSource: [ImageSource] = []
    let imageArray : [UIImage] = [UIImage(named : "project3" )!,UIImage(named : "project4" )!,UIImage(named : "project5" )!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        if self.revealViewController() != nil{
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            revealViewController().panGestureRecognizer
            revealViewController().tapGestureRecognizer()
            
        }
        for image in self.imageArray
        {
            imageSource.append(ImageSource(image: image) )
        }
        
        isExpand = false
        callingHomeApi()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func moveDonationBtnAction(_ sender: Any) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "DonationReveal") as UIViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func showMoreBtnAction(_ sender: Any) {
        UIView.setAnimationsEnabled(false)
        let indexPath = IndexPath(row: 7, section: 0)
        if self.isExpand == false
        {
            self.isExpand = true
        }
        else
        {
            self.isExpand = false
        }
        
        self.tableview.beginUpdates()
        UIView.transition(with: tableview, duration: 0.5, options: .transitionCrossDissolve, animations: {self.tableview.reloadRows(at: [indexPath], with: .automatic)}, completion: nil)
        //        self.tableview.reloadRows(at: [indexPath], with: .automatic)
        self.tableview.endUpdates()
        UIView.setAnimationsEnabled(true)
        
    }
    
    
//    @IBAction func saveLifePopUpAction(_ sender: Any) {
//        let saveLifeView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Life") as! SaveLifeViewController
//
//        self.addChildViewController(saveLifeView)
//        saveLifeView.view.frame = self.view.frame
//
//        UIView.transition(with: self.view, duration: 0.5, options: .transitionCurlDown, animations: {
//            self.view.addSubview(saveLifeView.view)
//        }, completion: nil)
//
//        saveLifeView.didMove(toParentViewController: self)
//    }
    
    
//    @IBAction func helpPopUpActionBtn(_ sender: Any) {
//        let helpView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Education") as! HelpEducateViewController
//
//        //        self.addChildViewController(helpView)
//        //        helpView.view.frame = self.view.frame
//        //
//        //        UIView.transition(with: self.view, duration: 0.5, options: .transitionCurlDown, animations: {
//        //            self.view.addSubview(helpView.view)
//        //        }, completion: nil)
//        //
//        //        helpView.didMove(toParentViewController: self)
//        self.present(helpView, animated: true) {
//
//        }
//    }
    
//    @IBAction func volunteerPopUpActionBtn(_ sender: Any) {
//        let volunteerView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Volunteer") as! VolunteerViewController
//
//        self.addChildViewController(volunteerView)
//        volunteerView.view.frame = self.view.frame
//
//        UIView.transition(with: self.view, duration: 0.5, options: .transitionCurlDown, animations: {
//            self.view.addSubview(volunteerView.view)
//        }, completion: nil)
//
//        volunteerView.didMove(toParentViewController: self)
//
//    }
    
    func callingHomeApi(){
        
    }
    
    
}



extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0
        {
            
            let cell: H1stTableViewCell = tableView.dequeueReusableCell(withIdentifier: "\(indexPath.row)" , for: indexPath) as! H1stTableViewCell
            
            cell.imageSlider.setImageInputs(imageSource)
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(indexPath.row)")
            return cell!
        }
        
    }
    
    
}















