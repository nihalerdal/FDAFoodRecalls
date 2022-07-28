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
        productTextView.layer.cornerRadius = 10
        reasonTextView.layer.cornerRadius = 10
    }


}
