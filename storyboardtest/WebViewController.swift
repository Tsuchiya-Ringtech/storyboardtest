//
//  WebViewController.swift
//  storyboardtest
//
//  Created by Kazunori Tsuchiya on 2023/06/08.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    var AddressData = "https://www.google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: AddressData) {
                    let request = NSURLRequest(url: url as URL)
                    webView.load(request as URLRequest)
                }
    }

}
