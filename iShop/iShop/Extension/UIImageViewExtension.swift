//
//  UIImage.swift
//  iShop
//
//  Created by Deepanshu Jain on 11/07/23.
//

import Foundation
import UIKit

class LazyImageView : UIImageView {
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    func downloadImage(imageURL : URL){
        self.image = UIImage(named: Global.placeholderImage)
        
        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject){
            debugPrint("Image loaded from Cache.")
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            [weak self] in
            if let imageData = try? Data(contentsOf: imageURL){
                debugPrint("Image downloaded from server.")
                if let image = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        self?.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self?.image = image
                    }
                }
            }
        }
    }
}
