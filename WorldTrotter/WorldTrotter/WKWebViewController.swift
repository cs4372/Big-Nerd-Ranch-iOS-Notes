//
//  WKWebViewController.swift
//  WorldTrotter
//
//  Created by Catherine Shing on 12/24/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController{
    
    var webView : WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("webview loaded")
        webView = WKWebView()
        let url = URL(string:"https://www.google.com")!
        let myRequest = URLRequest(url: url)
        webView.load(myRequest)
        view = webView
    }
}
