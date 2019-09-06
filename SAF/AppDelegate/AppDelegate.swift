//
//  AppDelegate.swift
//  SAF
//
//  Created by Mudassar on 04/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Stripe
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
           IQKeyboardManager.sharedManager().enable = true
        STPPaymentConfiguration.shared().publishableKey = "pk_test_QtlRBP27r6QAc3RzNLDD6RMY"
        GMSServices.provideAPIKey("AIzaSyBEE1r9JYJocEQ6ikfbmSOCiV1XL4Cp45E")
        GMSPlacesClient.provideAPIKey("AIzaSyBEE1r9JYJocEQ6ikfbmSOCiV1XL4Cp45E")
        PayPalMobile.initializeWithClientIds(forEnvironments: [PayPalEnvironmentProduction: "abc",
                                                               PayPalEnvironmentSandbox: "xyz"])
        return true
    }

}

