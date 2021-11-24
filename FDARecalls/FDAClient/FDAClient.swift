//
//  FDAClient.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 11/24/21.
//

import Foundation

class FDAClient{
    
    
    enum Endpoints{
        
        static let base = "https://api.fda.gov/food/enforcement.json"
        
        case getReports
        
        struct Auth {
            static let apikey = "WzQzV4WvFtPquIjaxjGyXyOyjxVL5zmKjkH0tmfg"
        }
        
        var stringValue: String {
            switch self {
            case .getReports: return Endpoints.base + "?api_key=\(Auth.apikey)?search=recall_initiation_date:20210101&limit=25"
            }
            
        }
        
        var url: URL{
            return URL(string: stringValue)!
        }
    }
    
}


