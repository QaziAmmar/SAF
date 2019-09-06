//
//  ContactUsViewController.swift
//  SAF
//
//  Created by Mudassar on 06/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit
import GoogleMaps

class ContactUsViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    var check = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil{
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            revealViewController().panGestureRecognizer
            revealViewController().tapGestureRecognizer()
        }
        check = true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.white {
            textView.text = nil
            textView.textColor = UIColor.white
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Your Message"
            textView.textColor = UIColor.white
        }
    }
    
}

extension ContactUsViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(indexPath.row)") as! MapTableViewCell
            
            let marker = GMSMarker()
            let lat = Double("24.853786")
            let long = Double("67.033831")
            marker.position = CLLocationCoordinate2DMake(lat!,long!)
            marker.title = "Sydney"
            marker.snippet = "Australia"
            
            let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
            let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            if(self.check)
            {
                cell.mapview.camera = GMSCameraPosition.camera(withTarget: marker.position , zoom: 6.0)
                self.check = false
            }
            
            marker.map = cell.mapview
            cell.mapview = mapView
            return cell
            
        }
        else if indexPath.row == 2
        {
            let cell: TextViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "\(indexPath.row)") as! TextViewTableViewCell
            cell.messageTextView.delegate = self
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
        else if indexPath.row == 1 
        {
            return 300
        }
        else
        {
            return 1100
        }
    }
}
