//
//  DetailReportVC.swift
//  FDARecalls
//
//  Created by Nihal Erdal on 1/28/22.
//

import UIKit

class DetailReportVC: UIViewController {

    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var productTextView: UITextView!
    @IBOutlet weak var reasonTextView: UITextView!
    
    var myProduct : RecalledProduct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTextView.text = myProduct.product
        reasonTextView.text = myProduct.recallReason
        productLabel.text = "Product"
        reasonLabel.text = "Reason Of Recall"
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
