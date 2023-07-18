//
//  ProductListViewController.swift
//  iShop
//
//  Created by Deepanshu Jain on 06/06/23.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var productsCollection: UICollectionView!
    
    var productViewModel = ProductListViewModel()
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
        updateUI()
    }
    
    private func updateUI() {
        self.productViewModel.bindProductViewModelToController = { [self] in
            self.products = productViewModel.products
            self.productsCollection.reloadData()
        }
    }

}
