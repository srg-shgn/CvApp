//
//  FormationViewController.swift
//  CvApp
//
//  Created by Serge Sahaguian on 24/03/2017.
//  Copyright © 2017 Serge Sahaguian. All rights reserved.
//

import UIKit

class FormationViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.delegate = self
        spinner.hidesWhenStopped = true
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "Planning formation mobile 3wa", ofType: "pdf")!)
        let request = URLRequest(url: path)
        myWebView.loadRequest(request)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        spinner.startAnimating()
        print("START LOADING PDF !")
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinner.stopAnimating()
        print("PDF LOADED !")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        spinner.stopAnimating()
        print("problème de chargement du pdf !")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
