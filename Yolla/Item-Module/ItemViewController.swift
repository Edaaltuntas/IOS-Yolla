//
//  ItemViewController.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import UIKit

class ItemViewController: UIViewController {
    
    @IBOutlet weak var productsCollection: UICollectionView!
    
    var products = [Item]()
    var cart = [Item]()

    // MARK: - Properties
    var presenter: ViewToPresenterItemProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        productsCollection.dataSource = self
        productsCollection.delegate = self
        productsCollection.backgroundColor = UIColor.clear.withAlphaComponent(0)
        setCollectionViewInsets()
        ItemRouter.createModule(ref: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "Products"
        presenter?.get()
    }
    
    func setCollectionViewInsets() {
        let width = UIScreen.main.bounds.width
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: (width - 25) / 2, height: (width - 25) / 2 * 1.5)
        productsCollection.collectionViewLayout = layout
    }
    
}

extension ItemViewController: PresenterToViewItemProtocol{
    func reload() {
        DispatchQueue.main.async {
            self.productsCollection.reloadData()
        }
    }
    
    func getCart() -> Array<Item> {
        return self.cart
    }
    
    func getProduct(index: Int) -> Item {
        return self.products[index]
    }
    
    func setProducts(products: Array<Item>) {
        self.products = products
        self.reload()
    }
    
    func setCart(cart: Array<Item>) {
        self.cart = cart
        self.reload()
    }
    
    func decreaseFromCart(product: Item) {
        self.cart.filter({ $0.name == product.name }).first?.amount -= 1
        self.reload()
    }
    
    func increaseAmount(product: Item) {
        self.products.filter({ $0.name == product.name }).first?.amount += 1
        self.reload()
    }
    
    func reloadCartTab() {
        (self.tabBarController as! TabBarController).update()
    }
}
