//
//  GetReportsResponse.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 11/24/21.
//

import Foundation

struct GetReportsResponse: Codable {
    let message: String
    let resultcount: Int
    let statuscode: Int
    let result: [GetRecalls]
    
}
