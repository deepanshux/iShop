//
//  HomeViewController.swift
//  iShop
//
//  Created by Deepanshu Jain on 06/06/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollection: UICollectionView!
    
    var homeViewModel : HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupNavigationBar(){
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

}
