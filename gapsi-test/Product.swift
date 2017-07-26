//
//  Product.swift
//  gapsi-test
//
//  Created by Deiby Toralva on 7/25/17.
//  Copyright © 2017 deibytb. All rights reserved.
//

import Foundation
import UIKit

struct Product {
    
    
    // MARK: - Constants & Parameters
    
    static let dictionaryKeyTitle = "product.displayName"
    static let dictionaryKeyPrice = "sku.sale_Price"
    static let dictionaryKeyGeo = "geo"
    static let dictionaryKeyImageUrl = "product.smallImage"
    
    
    // MARK: - Properties
    
    var title: String?
    var price: String?
    var geo: String? = "Ninguna"
    var image: UIImage?
    
    
    // MARK: - Initialization
    
    init?(dictionary: NSDictionary) {
        
        if let title = dictionary[Product.dictionaryKeyTitle] as? [String] {
            self.title = title.first
        } else {
            self.title = "No se encontró un título"
        }
        
        if let price = dictionary[Product.dictionaryKeyPrice] as? [String] {
            self.price = price.first!
        } else {
            self.price = "No se encontró un precio"
        }
        
        if let imageUrl = dictionary[Product.dictionaryKeyImageUrl] as? [String] {
            if let imageUrl = imageUrl.first {
                if let url = NSURL(string: imageUrl) {
                    if let data = NSData(contentsOf: url as URL) {
                        self.image = UIImage(data: data as Data)
                    }
                }
            }
        }
        
    }
}
