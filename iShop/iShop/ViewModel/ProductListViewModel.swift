//
//  ProductListViewModel.swift
//  iShop
//
//  Created by Deepanshu Jain on 08/06/23.
//

import Foundation
import UIKit

class ProductListViewModel : NSObject {

    var bindProductViewModelToController : (() -> ()) = {}
    
    private(set) var products : [Product]! {
        didSet {
            self.bindProductViewModelToController()
        }
    }
    
    private var fetchingMore = true
    private var reachingEnd = false
    private var leadingScreenForFetching:CGFloat = 1.0
    private var currentPage:Int = 1;
    
    override init() {
        super.init()
        getProducts()
    }
    
    public func onScrollingView(scrollView: UIScrollView){
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight-scrollView.frame.size.height * leadingScreenForFetching{
            if (fetchingMore && reachingEnd == false){
                beginFetchingMore()
            }
        }
    }
    
    private func getProducts(){
        ProductService.getByLimit(completion: {products in
            self.products = products
        })
    }
    
    private func beginFetchingMore(){
        fetchingMore = false
        let id = products[self.products.count-1].id
        ProductService.getByLimit(lastProductId:id, completion: { newProducts in
            self.products.append(contentsOf: newProducts)
            self.updatePagination(count: newProducts.count)
        })
    }
    
    private func updatePagination(count:Int){
        currentPage += 1;
        print("Total Pages : ",currentPage)
        fetchingMore = true
        reachingEnd = count == 0
    }
}
