//
//  MapViewVC.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 11/24/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
  var myProduct : Product! //= Product(productDescription: "", productFirmName: "", productQuantitiy: "", productReason: "", status: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        loadPins()
        
    }
    
    func loadPins(){
        
        FDAClient.getRecalls { recallsresponse, error in
            if error == nil {
                guard let recallsresponse = recallsresponse else {return}
                RecalledProducts.recalledProducts = recallsresponse
                
                var annotations = [MKPointAnnotation]()
                
                for product in RecalledProducts.recalledProducts {
                    let geocoder = CLGeocoder()
                    let address = "\(product.firmline1adr)" + "" + "\(product.firmline2adr ?? " ")" + "," + "\(product.firmcitynam)" + "" + "\(product.firmpostalcd)"
                    
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
    
    //MARK: pin view decoration - right callout accessory view
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if  pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            pinView?.tintColor = .red
            pinView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }else{
            pinView?.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {

        for product in RecalledProducts.recalledProducts {
           
            if  product.productdescriptiontxt == view.annotation?.subtitle {
                myProduct.productQuantitiy = product.productdistributedquantity ?? ""
                myProduct.productDescription = product.productdescriptiontxt
                myProduct.productReason = product.productshortreasontxt
                myProduct.productFirmName = product.firmlegalnam
                
            }
        }
            if let vc = storyboard?.instantiateViewController(withIdentifier: "RecallDescriptionVC") as? RecallDescriptionVC {
                vc.annotation = view.annotation
                vc.myProduct = myProduct 
                navigationController?.pushViewController(vc, animated: true)
            
            }
    }
    //    func mapView(_ mapView: MKMapView, didSelect view : MKAnnotationView){
    //        mapView.deselectAnnotation(view.annotation, animated: false)
    //
    //        if let pin = view.annotation as {
    //            let vc = storyboard?.instantiateViewController(withIdentifier: "RecallDescriptionVC") as? RecallDescriptionVC {
    //                var cell
    //            }
    //        }
    //    }
}

