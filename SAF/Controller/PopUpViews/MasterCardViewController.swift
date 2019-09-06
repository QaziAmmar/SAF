//
//  MasterCardViewController.swift
//  SAF
//
//  Created by Mudassar on 17/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit
import Stripe
import Alamofire

class MasterCardViewController: UIViewController {

    @IBOutlet weak var submitBtnOutlet: UIButton!
    let paymentCardTextField = STPPaymentCardTextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        paymentCardTextField.frame = CGRect(x: 25, y: 350, width: 257, height: 44)
        paymentCardTextField.delegate = self
        submitBtnOutlet.isHidden = true
        self.view.addSubview(paymentCardTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.view.removeFromSuperview()
    }
   
 
    
}

extension MasterCardViewController : STPPaymentCardTextFieldDelegate
{

    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        submitBtnOutlet.isHidden = !textField.isValid
    }
    
    @IBAction func masterSubmitBtnAction(_ sender: Any) {
        let card = paymentCardTextField.cardParams
        STPAPIClient.shared().createToken(withCard: card ,completion: {(token, error) -> Void in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
                self.displyError(message: error.localizedDescription)
            }
            else if let token = token {
                print(token)
                self.displyAlert(message: token)
                //                self.createUsingToken(token:token)
                
            }
        })
    }
    
    
        func createUsingToken(token:STPToken) {
            let requestString = "My request URL"
            let params = ["token": token.tokenId, "country": "US"]
            
            //This line of code will suffice, but we want a response
            Alamofire.request(requestString, method: .post, parameters: params).responseJSON { (response) in
                print("REQUEST: \(response.request!)") // original URL request
                print("RESPONSE: \(response.response!)") // URL response
                print("DATA: \(response.data!)") // server data
                print("RESULT: \(response.result)") // result of response serialization
                if let JSON = response.result.error {
                    print("JSON: \(JSON.localizedDescription)")
                }
            }
        }
    
    
    func displyAlert(message : STPToken) {
        let alert = UIAlertController(title: "Welcome to Stripe", message: "\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dissmiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func displyError(message : String) {
        let alert = UIAlertController(title: "Welcome to Stripe", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dissmiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}






