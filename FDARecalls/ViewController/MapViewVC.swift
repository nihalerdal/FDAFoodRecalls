//
//  MapViewVC.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 11/24/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
//    lazy var geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPins()

    }
    
    func loadPins(){
        
        FDAClient.getRecalls { recallsresponse, error in
            if error == nil {
                guard let recallsresponse = recallsresponse else {return}
                RecalledProduct.recalledProduct = recallsresponse
                
                var annotations = [MKPointAnnotation]()
                
                for product in RecalledProduct.recalledProduct {
                    let geocoder = CLGeocoder()
                    let address = "\(product.firmline1adr)" + "," + "\(product.firmcitynam)" + "" + "\(product.firmpostalcd)"//+ "" + "\(product.firmline2adr)"
                    
                    geocoder.geocodeAddressString(address) { placemarks, error in
                        if error == nil{
                            if let coordinate = placemarks?.first?.location?.coordinate{
                                let annotation = MKPointAnnotation()
                                annotation.coordinate = coordinate
                                annotation.title =  "\(product.firmlegalnam)"
                                annotation.subtitle = "\(product.productdescriptiontxt)"
                                
                                annotations.append(annotation)
                                self.mapView.addAnnotation(annotation)
                                geocoder.cancelGeocode()
                            }
                        }else {
                            fatalError("error:\(String(describing: error?.localizedDescription))")
                        }
                        
                    }
                }
                
            }else {
                print("error:\(String(describing: error?.localizedDescription))")
                let alert = UIAlertController(title: "Error", message: "Data couldn't load", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

