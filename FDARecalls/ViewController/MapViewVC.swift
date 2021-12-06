//
//  MapViewVC.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 11/24/21.
//

import UIKit
import MapKit

class MapViewVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func loadPins(){
    
        for pin in RecalledProduct.address{
            
            }

    }
}
