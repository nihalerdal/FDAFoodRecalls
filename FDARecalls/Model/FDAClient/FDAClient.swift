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
        }
        print(signature)
        return signature
    }
    
    struct RandomSignature{
        static var signature = randomChar()
    }
    
    
    enum Endpoints{
        
        static let base = "https://www.accessdata.fda.gov/rest/iresapi"
                
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
    
//    class func taskForPOSTRequest<RequestType: Encodable, ResponseType: Decodable > (url:URL, responseType: ResponseType.Type, body: RequestType, completion: @escaping (ResponseType?, Error?) -> Void ){
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/x-www-form-urlencoded.", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try! JSONEncoder().encode(body)
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else{
//                DispatchQueue.main.async {
//                    completion(nil, error)
//                }
//                return
//            }
//
//            do {
//                let responseObject = try JSONDecoder().decode(ResponseType.self, from: data)
//                DispatchQueue.main.async {
//                    completion(responseObject, nil)
//                }
//
//            } catch {
//                DispatchQueue.main.async {
//                    completion(nil,error)
//                }
//            }
//        }
//
//        task.resume()
//    }
    
    class func getRecalls(completion: @escaping ([GetRecalls]?, Error?)-> Void ) {
        var request = URLRequest(url: Endpoints.getReports.url)
        request.httpMethod = "POST"
        request.addValue("pZW5tSRqfn6jGph0",forHTTPHeaderField: "Authorization-Key")
        request.addValue("nihalerdall@gmail.com",forHTTPHeaderField: "Authorization-User")
        request.addValue("application/x-www-form-urlencoded",forHTTPHeaderField: "Content-Type")
        
        let parameters = "payLoad={\"displaycolumns\": \"firmlegalnam,firmcitynam,firmcountrynam,firmline1adr,firmline2adr,firmpostalcd,productid,productdescriptiontxt,productshortreasontxt,centerclassificationtypetxt,productdistributedquantity,phasetxt,centercd,rid\",\"filter\":\"[{'centercd':['CFSAN']},{'phasetxt':['ongoing']},{'centerclassificationtypetxt':['1']},{'firmcountrynam':'United States'}]\",\"start\": 1,\"rows\": 25, \"sort\": \"productid\", \"sortorder\": \"asc\"}"
        
        let postData =  parameters.data(using: .utf8)
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion([], error)
                }
                return
            }
            
            let decoder = JSONDecoder()
            print(String(data: data, encoding: .utf8)!)
            
            do {
                let responseObject = try decoder.decode(GetReportsResponse.self, from: data)
                
//                for recalledproduct in responseObject.result{
//                    let address = recalledproduct.firmline1adr + "" + recalledproduct.firmline2adr
//                    RecalledProduct.addresses.append(address)
//                }
                
                DispatchQueue.main.async {
                    completion(responseObject.result, nil)
                }
                
            }catch{
                DispatchQueue.main.async {
                    completion([], error)
                }
            }
        }
        task.resume()
    }
    
}


