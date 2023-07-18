//
//  ProductCollectionViewCell.swift
//  iShop
//
//  Created by Deepanshu Jain on 08/06/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: LazyImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productTitle: UILabel!
}
