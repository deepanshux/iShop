//
//  ProductView+CollectionView.swift
//  iShop
//
//  Created by Deepanshu Jain on 08/06/23.
//

import Foundation
import UIKit

extension ProductListViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView(){
        productsCollection.delegate = self
        productsCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productsCollection.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCollectionViewCell
        cell.productPrice.text = "\(products[indexPath.row].price)"
        cell.productTitle.text = products[indexPath.row].name
        cell.productImage.downloadImage(imageURL: URL(string: products[indexPath.row].image)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productDetailVc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as!
            ProductDetailViewController
        productDetailVc.product = products[indexPath.row]
        navigationController?.pushViewController(productDetailVc, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        productViewModel.onScrollingView(scrollView: scrollView)
    }
}
