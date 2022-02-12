//
//  MapViewVC.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 11/24/21.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class MapViewVC: UIViewController, MKMapViewDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var dataController : DataController!
    var fetchedResultsController: NSFetchedResultsController<RecalledProduct>!
    
//    var myProduct = Product()// = Product(productDescription: "", productFirmName: "", productQuantitiy: "", productReason: "", status: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        setupFetchedResultsController()
        loadPins()

    }
    
    func loadPins(){
        
        FDAClient.getRecalls { recallsresponse, error in
            if error == nil {
                guard let recallsresponse = recallsresponse else {return}
                self.deleteObjects()
                for myProduct in recallsresponse {
                    let product = RecalledProduct(context: self.dataController.viewContext)
                    product.productId = myProduct.productid
                    product.product = myProduct.productdescriptiontxt
                    product.firmName = myProduct.firmlegalnam
                    product.productQuantity = myProduct.productdistributedquantity
                    product.recallReason = myProduct.productshortreasontxt
                    product.firmAddressLine1 = myProduct.firmline1adr
                    product.firmAddressLine2 = myProduct.firmline2adr
                    product.firmCity = myProduct.firmcitynam
                    product.postalCode = myProduct.firmpostalcd
                    product.creationDate = Date()
                    
                    
                    do {
                        try self.dataController.viewContext.save()
//                        if let objects = self.fetchedResultsController.fetchedObjects{
//                            for object in objects{
//                                if object.productId == "153538"{
//                                    print("\(object)")
//                                }
//                            }
//                        }
                    }catch{
                        fatalError("Unable to save data: \(error.localizedDescription)")
                    }
                }
                
                self.setupFetchedResultsController()
                
                var annotations = [MKPointAnnotation]()
                
//                if let products = recallsresponse{
                    for product in recallsresponse {
                        let geocoder = CLGeocoder()
                        let address = "\(product.firmline1adr)" + "" + "\(product.firmline2adr ?? " ")" + "," + "\(product.firmcitynam)" + "" + "\(product.firmpostalcd)"
                
                    
                        geocoder.geocodeAddressString(address) { placemarks, error in
                            if error == nil{
                                if let coordinate = placemarks?.first?.location?.coordinate{
                                    let annotation = MKPointAnnotation()
                                    annotation.coordinate = coordinate
                                    annotation.title =  "\(String(describing: product.firmcitynam))"
                                    annotation.subtitle = "\(String(describing: product.productdescriptiontxt))"
                                    
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
//    }
    
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
//        setupFetchedResultsController()
        if let products = fetchedResultsController.fetchedObjects {
            for product in products{
                if product.product == view.annotation?.subtitle {
//                    print("\(product)")
                    if let vc = storyboard?.instantiateViewController(withIdentifier: "RecallDescriptionVC") as? RecallDescriptionVC {
                        vc.myProduct = product
                        vc.dataController = dataController
                        
                        navigationController?.pushViewController(vc, animated: true)
                        
                    }else {
                        fatalError("error!")
                        
                    }
                }
            }
        }
    }
    
     func setupFetchedResultsController() {
        //creat fetchRequest
        let fetchRequest: NSFetchRequest<RecalledProduct> = RecalledProduct.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "productId", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
         do {
             try fetchedResultsController.performFetch()
         } catch {
             fatalError("The fetch couldn't be performed: \(error.localizedDescription)")
         }
     }
        
        
        func deleteObjects(){
            if self.fetchedResultsController.fetchedObjects?.count != 0 {
                if let objects = fetchedResultsController.fetchedObjects {
                    for object in objects{
                        self.dataController.viewContext.delete(object)
                    }
                }
                
            }
        }
        
}

