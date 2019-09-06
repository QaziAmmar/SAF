//
//  DonationView.swift
//  SAF
//
//  Created by Mudassar on 11/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit
import Stripe
import Alamofire

class DonationView: UIViewController , STPPaymentCardTextFieldDelegate{
    
    @IBOutlet weak var menuBarBtn: UIBarButtonItem!
    @IBOutlet weak var paybtnOutlet: UIButton!
    
    let paymentCardTextField = STPPaymentCardTextField()
    var payPalConfig = PayPalConfiguration()
    
    var environment:String = PayPalEnvironmentNoNetwork {
        willSet(newEnvironment) {
            if (newEnvironment != environment) {
                PayPalMobile.preconnect(withEnvironment: newEnvironment)
            }
        }
    }
    
    var accepteCreditCard : Bool = true
    {
        didSet{
            payPalConfig.acceptCreditCards = accepteCreditCard
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if self.revealViewController() != nil{
            menuBarBtn.target = self.revealViewController()
            menuBarBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            revealViewController().panGestureRecognizer
            revealViewController().tapGestureRecognizer()
            
        }
        paymentCardTextField.frame = CGRect(x: 15, y: 199, width: 300, height: 44)
        paymentCardTextField.delegate = self
        //        self.view.addSubview(paymentCardTextField)
        paybtnOutlet.isHidden = true
        
        // Set up payPalConfig
        payPalConfig.acceptCreditCards = false
        payPalConfig.merchantName = "Awesome Shirts, Inc."
        payPalConfig.merchantPrivacyPolicyURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
        payPalConfig.merchantUserAgreementURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
        payPalConfig.languageOrLocale = Locale.preferredLanguages[0]
        payPalConfig.payPalShippingAddressOption = .payPal;
        PayPalMobile.preconnect(withEnvironment: environment)
        //        print("PayPal iOS SDK Version: \(PayPalMobile.libraryVersion())")
        
    }
    
    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        // Toggle buy button state
        paybtnOutlet.isHidden = !textField.isValid
    }
    
    
    @IBAction func PayBtnAction(_ sender: Any) {
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
    //MARK:pop up views
    
    @IBAction func directDepostiActionBtn(_ sender: Any) {
        let directDepositView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DirectDeposti") as! DirectDepostiViewController
        self.addChildViewController(directDepositView)
        directDepositView.view.frame = self.view.frame
        
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCurlDown, animations: {
            self.view.addSubview(directDepositView.view)
        }, completion: nil)
        directDepositView.didMove(toParentViewController: self)
    }
    
    @IBAction func masterCardBtnAction(_ sender: Any) {
        let masterCardView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MasterCard") as! MasterCardViewController
        self.addChildViewController(masterCardView)
        masterCardView.view.frame = self.view.frame
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCurlDown, animations: {
            self.view.addSubview(masterCardView.view)
            
        }, completion: nil)
        masterCardView.didMove(toParentViewController: self)
        
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


extension DonationView : PayPalPaymentDelegate
{
    // PayPalPaymentDelegate
    
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        print("PayPal Payment Cancelled")
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
        paymentViewController.dismiss(animated: true, completion: { () -> Void in
            // send completed confirmaion to your server
            print("Here is your proof of payment:\n\n\(completedPayment.confirmation)\n\nSend this to your server for confirmation and fulfillment.")
            
        })
    }
    
    @IBAction func paypallAction(_ sender: Any) {
        
        let item1 = PayPalItem(name: "Old jeans with holes", withQuantity: 2, withPrice: NSDecimalNumber(string: "84.99"), withCurrency: "USD", withSku: "Hip-0037")
        
        let items = [item1]
        let subtotal = PayPalItem.totalPrice(forItems: items)
        
        // Optional: include payment details
        let shipping = NSDecimalNumber(string: "5.99")
        let tax = NSDecimalNumber(string: "2.50")
        let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
        
        let total = subtotal.adding(shipping).adding(tax)
        
        let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "Hipster Clothing", intent: .sale)
        
        payment.items = items
        payment.paymentDetails = paymentDetails
        
        if (payment.processable) {
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
            present(paymentViewController!, animated: true, completion: nil)
        }
        else {
            // This particular payment will always be processable. If, for
            // example, the amount was negative or the shortDescription was
            // empty, this payment wouldn't be processable, and you'd want
            // to handle that here.
            print("Payment not processalbe: \(payment)")
        }
    }
    
}

extension DonationView: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 1
        {
            return 1400
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




