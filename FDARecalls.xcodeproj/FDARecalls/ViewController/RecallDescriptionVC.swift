//
//  RecallDescriptionVC.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 1/19/22.
//

import UIKit
import MapKit

class RecallDescriptionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

 
    var annotation : MKAnnotation!
    var myProduct = Product()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
     
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        
        
        cell.textLabel?.text = annotation.subtitle as! String
        cell.detailTextLabel?.text = "Quantity: \(myProduct.productQuantitiy)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "ShowDetailSegue" {

            if let reportVC = segue.destination as? DetailReportVC {

                reportVC.myProduct = myProduct
                reportVC.productTextView.text = myProduct.productDescription
                reportVC.reasonTextView.text = myProduct.productReason
                reportVC.productLabel.text = "Product"
                reportVC.reasonLabel.text = "Reason Of Recall"
            }
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailReportVC") as? DetailReportVC {
//            vc.myProduct = myProduct
//            vc.productTextView.text = myProduct.productDescription
//            vc.reasonTextView.text = myProduct.productReason
//            navigationController?.pushViewController(vc, animated: true)
//        }
//
//    }
}
