//
//  UIImageViewExtension.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import UIKit

extension UIImageView {
    
    // MARK: - Download image from URL
    
    func setImage(from url: URL?, withPlaceholderImage image: String) {
        
        let placeholder = UIImage(named: image)
        
        guard let url = url else {
            self.image = placeholder
            return
        }
        
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
