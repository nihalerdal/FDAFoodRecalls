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
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
     
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return RecalledProduct.recalledProduct.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        
        
        cell.textLabel?.text = annotation.title as! String
        cell.detailTextLabel?.text = annotation.subtitle as! String
        
        return cell
    }
}
