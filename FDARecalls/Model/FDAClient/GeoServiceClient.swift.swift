////
////  GeoServiceClient.swift.swift
////  FDARecalls
////
////  Created by Nihal Erdal on 2/13/22.
////
//
//import Foundation
//import CoreData
//
//class GeoServiceClient{
//
//    enum Endpoints{
//
//        struct Auth {
//            static let apiKey = "3304c7e8707742738cea4eefacb9b6f4"
//        }
//
//        static let base = "https://geoservices.tamu.edu/Services/Geocode/WebService/GeocoderWebServiceHttpNonParsed_V04_01.aspx?"
//
//        case getGeoCode
//                        
//        var stringValue: String {
//            switch self {
//            case .getGeoCode: return Endpoints.base
//            }
//        }
//
//        var url: URL{
//            return URL(string: stringValue)!
//        }
//    }
//
//    class func taskForPOSTRequest<RequestType: Encodable, ResponseType: Decodable > (url:URL, responseType: ResponseType.Type, body: RequestType, completion: @escaping (ResponseType?, Error?) -> Void ){
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
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
//            } catch  {
//                DispatchQueue.main.async {
//                    completion(nil, error)
//                }
//            }
//        }
//        task.resume()
//    }
//
//
//
////    class func getGeocode(apiKey: String, version: String, streetAddress: String, city: String, state: String, zip: String, completion: @escaping (Bool, Error?)-> Void){
////
//////        let body = GeocodeRequest(apiKey: Endpoints.Auth.apiKey, streetAddress: self.myProduct.firmAddressLine1!, city: self.myProduct.firmCity!, zip: self.myProduct.postalCode!)
////
////        taskForPOSTRequest(url: Endpoints.getGeoCode.url, responseType: GeocodeResponse.self, body: body) { response, error in
////            if let response = response {
////
////            }
////        }
////
////    }
//}
