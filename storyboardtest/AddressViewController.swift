//
//  AddressViewController.swift
//  storyboardtest
//
//  Created by Kazunori Tsuchiya on 2023/06/08.
//

import UIKit

class AddressViewController: UIViewController {
    @IBOutlet weak var AddressText: UILabel!
    var AddressData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddressText.text = AddressData
    }

}
