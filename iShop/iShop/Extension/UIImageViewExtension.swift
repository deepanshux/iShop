//
//  UIImage.swift
//  iShop
//
//  Created by Deepanshu Jain on 11/07/23.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(imageURL : URL){
        
        self.image = UIImage(named: Global.placeholderImage)
        DispatchQueue.global().async {
            [weak self] in
            if let imageData = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
