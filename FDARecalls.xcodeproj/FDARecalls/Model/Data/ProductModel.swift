//
//  ProductModel.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 12/6/21.
//

import Foundation

struct RecalledProducts {
    
    static var recalledProducts = [GetRecalls]()
    
}

struct Product {
    var productDescription : String = ""
     var productFirmName: String = ""
     var productQuantitiy: String = ""
     var productReason: String = ""
     var status : String = ""
}

struct Products {
    static var productList = [Product]()
}
