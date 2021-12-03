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
     
}
