//
//  GetRecalls.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 12/3/21.
//

import Foundation

struct GetRecalls: Codable {
    
    let productid: String
    let firmcitynam: String
    let firmcountrynam: String
    let firmline1adr: String
    let firmline2adr: String?
    let firmpostalcd: String
    let phasetxt: String
    let firmlegalnam: String
    let centercd: String
    let centerclassificationtypetxt: String
    let productdescriptiontxt: String
    let productshortreasontxt: String
    let productdistributedquantity: String?
    let rid: Int
    
    enum CodingKeys: String, CodingKey{
        case productid = "PRODUCTID"
        case firmcitynam = "FIRMCITYNAM"
        case firmcountrynam = "FIRMCOUNTRYNAM"
        case firmline1adr = "FIRMLINE1ADR"
        case firmline2adr = "FIRMLINE2ADR"
        case firmpostalcd = "FIRMPOSTALCD"
        case phasetxt =  "PHASETXT"
        case firmlegalnam = "FIRMLEGALNAM"
        case centercd = "CENTERCD"
        case centerclassificationtypetxt = "CENTERCLASSIFICATIONTYPETXT"
        case productdescriptiontxt = "PRODUCTDESCRIPTIONTXT"
        case productshortreasontxt = "PRODUCTSHORTREASONTXT"
        case productdistributedquantity = "PRODUCTDISTRIBUTEDQUANTITY"
        case rid =  "RID"
        
    }
}
