//
//  RecallDescriptionVC.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 1/19/22.
//

import UIKit
import MapKit
import CoreData

class RecallDescriptionVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

 
    var myProduct : RecalledProduct!
    
    var dataController : DataController!
    var fetchedResultsController: NSFetchedResultsController<RecalledProduct>!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupFetchedResultsController()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
        
//        let aProduct = fetchedResultsController.object(at: indexPath)
        
        cell.textLabel?.text = myProduct.product
        cell.detailTextLabel?.text = "Quantity: \(myProduct.productQuantity)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "ShowDetailSegue" {

            if let reportVC = segue.destination as? DetailReportVC {

                reportVC.myProduct = myProduct
            }
        }
    }
    
    func setupFetchedResultsController(){
        let fetchRequest: NSFetchRequest<RecalledProduct> = RecalledProduct.fetchRequest()
//        let predicate = NSPredicate(format: "recalledProduct == %@", myProduct) //fetch to the photos spesific to the clicked pin.
//        fetchRequest.predicate = predicate
        
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("The fetch couldn't be performed: \(error.localizedDescription)")
        }
    }
}
