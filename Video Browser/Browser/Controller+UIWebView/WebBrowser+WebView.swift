//
//  WebBrowser+WebView.swift
//  Video Browser
//
//  Created by mayc on 2020/4/26.
//  Copyright © 2020 MC Equipment. All rights reserved.
//

import UIKit

extension WebBrowser: UIWebViewDelegate {
    
    func load(urlString: String) {
        if let url = URL(string: urlString) {
            webView.loadRequest(URLRequest(url: url))
        }
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        tabBar.searchItemTitle = webView.stringByEvaluatingJavaScript(from: "document.title")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        tabBar.searchItemTitle = request.url?.absoluteString
        return true
    }
}
