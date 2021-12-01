//
//  FDAClient.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 11/24/21.
//

import Foundation

class FDAClient{
    
    
    class func randomChar() -> String {
        
        let len = 5
        let stringChars = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
        var signature = ""
        
        for _ in 0..<len {
            let random = arc4random() % UInt32(stringChars.count)
            signature.append(stringChars[Int(random)])
            print(signature)
        }
        
        return signature
    }
    
    struct RandomSignature{
        static var signature = randomChar()
    }
    
    
    enum Endpoints{
        
        static let base = "https://www.accessdata.fda.gov/rest/iresapi/"
        
        case getReports
                
        var stringValue: String {
            switch self {
            case .getReports: return Endpoints.base + "/recalls/?signature=\(RandomSignature.signature)"
            }
        }
        
        var url: URL{
            return URL(string: stringValue)!
        }
    }
}


