//
//  ProductDetailViewController.swift
//  iShop
//
//  Created by Deepanshu Jain on 06/06/23.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productDetailsImage: UIImageView!
    @IBOutlet weak var productDetailsTitle: UILabel!
    @IBOutlet weak var productDetailsPrice: UILabel!
    @IBOutlet weak var productDetailsDescription: UITextView!
    
    var product : Product?
    var productDetailViewModel = ProductDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
    }
    
    @IBAction func tapOnAddToCartButton(_ sender: Any) {
        
    }
    
    @IBAction func tapOnBuyNowButton(_ sender: Any) {
        
    }
    
    private func loadData(){
        productDetailsTitle.text = product?.name
        productDetailsPrice.text = "\(product?.price ?? 0.0)"
        productDetailsDescription.text = product?.description
        loadImage()
    }
    
    private func loadImage(){
        productDetailsImage.downloadedFrom(link: product?.image ?? "")
    }
}
