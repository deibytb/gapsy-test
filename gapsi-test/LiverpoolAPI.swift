//
//  GapsiAPI.swift
//  gapsi-test
//
//  Created by Deiby Toralva on 7/25/17.
//  Copyright © 2017 deibytb. All rights reserved.
//

import Foundation
import Alamofire

class LiverpoolAPI {
    
    // MARK: - Constants & Parameters
    static let urlResults: String = "https://www.liverpool.com.mx/tienda?s=xbox&d3106047a194921c01969dfdec083925=json"
    
    
    // MARK: - Functions
    func getProducts(completionHandler: (([Product]?) -> Void)?) {
        
        Alamofire.request(LiverpoolAPI.urlResults).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
        
    }
    
}
