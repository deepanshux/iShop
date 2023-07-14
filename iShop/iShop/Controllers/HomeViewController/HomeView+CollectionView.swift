//
//  HomeView+CollectionView.swift
//  iShop
//
//  Created by Deepanshu Jain on 07/06/23.
//

import Foundation
import UIKit

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView(){
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryLabel.text = "\(indexPath.row)"
//        cell.categoryImage.image =
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dest = storyboard?.instantiateViewController(withIdentifier: "ProductListViewController") as!
            ProductListViewController
        
//        dest.urlPara = filteredData?[indexPath.row].category
        navigationController?.pushViewController(dest, animated: true)
    }
    
}
