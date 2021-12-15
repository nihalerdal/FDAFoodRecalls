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
    let firmline2adr: String?
    let firmpostalcd: String
    let productid: String
    let productdescriptiontxt: String
    let productshortreasontxt: String
    let centerclassificationtypetxt: String
    let productdistributedquantity: String
    let phasetxt: String
    let centercd: String
    let rid: Int

    enum CodingKeys: String, CodingKey{
        case firmlegalnam = "FIRMLEGALNAM"
        case firmcitynam = "FIRMCITYNAM"
        case firmcountrynam = "FIRMCOUNTRYNAM"
        case firmline1adr = "FIRMLINE1ADR"
        case firmline2adr = "FIRMLINE2ADR"
        case firmpostalcd = "FIRMPOSTALCD"
        case productid = "PRODUCTID"
        case productdescriptiontxt = "PRODUCTDESCRIPTIONTXT"
        case productshortreasontxt = "PRODUCTSHORTREASONTXT"
        case centerclassificationtypetxt = "CENTERCLASSIFICATIONTYPETXT"
        case productdistributedquantity = "PRODUCTDISTRIBUTEDQUANTITY"
        case phasetxt =  "PHASETXT"
        case centercd = "CENTERCD"
        case rid =  "RID"
    }
}
