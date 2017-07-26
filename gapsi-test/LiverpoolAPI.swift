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
    static let prevUrlResults: String = "https://www.liverpool.com.mx/tienda?s="
    static let postUrlResults: String = "&d3106047a194921c01969dfdec083925=json"
    
    
    // MARK: - Functions
    func getProducts(wordSearch: String, completionHandler: (([Product]?) -> Void)?) {
        
        let completeUrlResult = LiverpoolAPI.prevUrlResults + wordSearch + LiverpoolAPI.postUrlResults

        Alamofire.request(completeUrlResult).responseJSON { response in
            
            var productsList = [Product]()
            
            if let result = response.result.value {
                let json = result as! NSDictionary
                let contents = json["contents"] as! [[String: AnyObject]]
                
                for content in contents {
                    let mainContent = content["mainContent"] as! [[String: AnyObject]]
                    let results = mainContent.last?["contents"] as! [[String: AnyObject]]
                    
                    for result in results {
                        let records = result["records"] as! [[String: AnyObject]]
                        for record in records {
                            let attributes = record["attributes"] as! NSDictionary
                            let newProduct = Product(dictionary: attributes)
                            productsList.append(newProduct!)
                        }
                    }

                }
                completionHandler?(productsList)

            }
            
        }
        
    }
    
}
