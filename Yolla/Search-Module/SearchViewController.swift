//
//  SearchViewController.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var productsCollection: UICollectionView!
    
    var products = [Item]()
    var filtered_products = [Item]()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        productsCollection.delegate = self
        productsCollection.dataSource = self
        setCollectionViewInsets()
        SearchRouter.createModule(ref: self)
        presenter?.interactor?.get()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "Search"
    }
    
    func setCollectionViewInsets() {
        let genislik = UIScreen.main.bounds.width
        let tasarim2 = UICollectionViewFlowLayout()
        tasarim2.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        tasarim2.minimumInteritemSpacing = 5
        tasarim2.minimumLineSpacing = 5
        tasarim2.itemSize = CGSize(width: (genislik - 25) / 2, height: (genislik - 25) / 2 * 1.5)
        productsCollection.collectionViewLayout = tasarim2
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterSearchProtocol?
    
}

extension SearchViewController: PresenterToViewSearchProtocol{
    func setProducts(products: Array<Item>, filter: Bool) {
        if (!filter) {
            self.products = products
        }else{
            self.filtered_products = products
        }
        self.reload()
    }
    
    func getProduct(index: Int) -> Item {
        return self.products[index]
    }
    
    func getProducts() -> Array<Item> {
        return self.products
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.productsCollection.reloadData()
        }
    }
}
