//
//  Product.swift
//  gapsi-test
//
//  Created by Deiby Toralva on 7/25/17.
//  Copyright © 2017 deibytb. All rights reserved.
//

import Foundation

class Product {
    // MARK: - Constants & Parameters
    
    static let dictionaryKeyTitle = "product.displayName"
    static let dictionaryKeyPrice = "sku.sale_Price"
    static let dictionaryKeyGeo = "geo"
    static let dictionaryKeyImageUrl = "product.smallImage"
    
    
    // MARK: - Properties
    
    var title: String?
    var price: Float = Float(0.0)
    var geo: String? = "Ninguna"
    var imageUrl: String?
    
    
    // MARK: - Initialization
    
    init?(dictionary: NSDictionary) {
        
        guard let title = dictionary[Product.dictionaryKeyTitle] as? String
            where title.characters.count > 0 else {
                return
        }
        
        guard let price = dictionary[Product.dictionaryKeyPrice] as? Float
            where price > 0.0 else {
                return
        }
        
        guard let imageUrl = dictionary[Product.dictionaryKeyImageUrl] as? String
            where imageUrl.characters.count > 0 else {
                return
        }
        
        self.title = title
        self.price = price
        self.imageUrl = imageUrl
    }
}
