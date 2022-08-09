//
//  UIViewControllerExtension.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import UIKit

extension UIViewController {
    
    // MARK: - Show Error Alert
    
    func showError(_ message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel))
        present(alert, animated: true)
    }
    
    // MARK: - Show Loader
    
    func showLoader() {
        
        let loader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        loader.backgroundColor = .black.withAlphaComponent(0.8)
        loader.tag = 111
        loader.isUserInteractionEnabled = true
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.color = .orange
        activityIndicator.startAnimating()
        activityIndicator.center = loader.center
        loader.addSubview(activityIndicator)
        
        view.addSubview(loader)
    }
    
    // MARK: - Hide Loader
    
    func hideLoader() {
        
        let loader = view.viewWithTag(111)
        loader?.removeFromSuperview()
    }
}
