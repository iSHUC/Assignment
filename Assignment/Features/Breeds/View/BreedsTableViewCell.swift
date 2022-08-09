//
//  BreedsTableViewCell.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import UIKit

class BreedsTableViewCell: UITableViewCell {

    // MARK: - Properties

    static var identifier: String { "BreedsTableViewCell" }
    
    // MARK: - Configure
    
    func configure(_ breed: String) {
        
        textLabel?.text = breed
    }
}
