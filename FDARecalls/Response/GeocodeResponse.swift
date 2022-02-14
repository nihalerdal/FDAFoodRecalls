//
//  GeocodeResponse.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 2/13/22.
//

import Foundation

struct GeocodeResponse: Codable {
    
    
    let TransactionId: String
    var version: String = "4.01"
    let QueryStatusCodeValue: String
    let Latitude: Double
    let Longitude: Double
    let NAACCRGISCoordinateQualityCode: String
    let NAACCRGISCoordinateQualityType: String
    let MatchScore: Int
    let MatchType: String
    let FeatureMatchingResultType: String
    let FeatureMatchingResultCount: Int
    let FeatureMatchingGeographyType: String
    let RegionSize:Double
    let RegionSizeUnits: String
    let MatchedLocationType: String
    let TimeTaken: Double

}
