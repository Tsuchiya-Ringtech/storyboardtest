//
//  ViewController.swift
//  storyboardtest
//
//  Created by Kazunori Tsuchiya on 2023/06/08.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNext1" {
            let AddressView = segue.destination as! AddressViewController
            AddressView.AddressData = nameTextField.text!
        }
        if segue.identifier == "toNext2" {
            let WebView = segue.destination as! WebViewController
            WebView.AddressData = nameTextField.text!
        }
        if segue.identifier == "toNext3" {
            let GitHubListView = segue.destination as! GitHubListViewViewController
            GitHubListView.UserData = nameTextField.text!
        }
    }

}

