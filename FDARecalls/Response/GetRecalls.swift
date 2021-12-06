//
//  GetRecalls.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 12/3/21.
//

import Foundation

struct GetRecalls: Codable {
    
    let firmlegalnam: String
    let firmcitynam: String
    let firmcountrynam: String
    let firmline1adr: String
    let firmline2adr: String
    let firmpostalcd: String
    let productid: String
    let productdescriptiontxt: String
    let productshortreasontxt: String
    let createdt: Date
    let centerclassificationtypetxt: String
    let productdistributedquantity: String
    let phasetxt : String
    let centercd : String
    
    init(firmlegalnam: String, firmcitynam: String, firmcountrynam: String, firmline1adr: String,firmline2adr:String, firmpostalcd: String, productid:String, productdescriptiontxt:String, productshortreasontxt:String, createdt:Date, centerclassificationtypetxt: String, productdistributedquantity: String, phasetxt:String, centercd:String   ) {
        
        self.firmlegalnam = firmlegalnam
        self.firmcitynam = firmcitynam
        self.firmcountrynam = firmcountrynam
        self.firmline1adr = firmline1adr
        self.firmline2adr = firmline2adr
        self.productid = productid
        self.productdescriptiontxt = productdescriptiontxt
        self.productshortreasontxt = productshortreasontxt
        self.createdt = createdt
        self.centerclassificationtypetxt = centerclassificationtypetxt
        self.productdistributedquantity = productdistributedquantity
        self.phasetxt = phasetxt
        self.centercd = centercd
    }
    
}
