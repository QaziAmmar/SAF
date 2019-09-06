//
//  WebServices.swift
//  SAF
//
//  Created by Mudassar on 23/10/2017.
//  Copyright © 2017 HalfTech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
typealias LoginSuccess = (_ parseObj :Login) -> Void
typealias apiFailuer = (_ errorString : String) -> Void
typealias HTTPfailuer = (_ errorString : String) -> Void

class WebServices : NSObject
{
    
    class func loginApi( success: @escaping LoginSuccess , withApiFailuer apiFailuer: @escaping apiFailuer , failuer: HTTPfailuer )
    {
        
        let url = SAFUrl().baseUrl + "login"
        
        let headers: HTTPHeaders = [ "Client-Service" : "afridisaf-client","Auth-Key":"SaFapIsScured!@)(@"]
        
        Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON(completionHandler: { respones in
            
            switch respones.result {
                
            case .success(let data):
                print(data)
                
               let json = JSON(data)
                
                let mylogin = Login(json: json["Response"])
                success(mylogin)
                
            case .failure(let error):
                print(error)
                apiFailuer(error as! String)
            }
        })
    }
}


//MARK : Base URl Struct
struct SAFUrl
{
    let baseUrl = "http://tandonenterprise.com/services/index.php/auth/"
}
