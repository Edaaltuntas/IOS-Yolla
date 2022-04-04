//
//  CartViewController.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTable: UITableView!
    var cart = [Item]()
    
    @IBAction func checkoutClicked(_ sender: Any) {
        let errorAlertController = UIAlertController(
          title: "Error",
          message: "TODO: Implement Checkout :)",
          preferredStyle: .alert
        )
        errorAlertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(errorAlertController, animated: true, completion: nil)
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        CartRouter.createModule(ref: self)
        cartTable.delegate = self
        cartTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.get()
        tabBarController?.navigationItem.title = "Cart"
    }

    // MARK: - Properties
    var presenter: ViewToPresenterCartProtocol?
    
}

extension CartViewController: PresenterToViewCartProtocol{
    func reload() {
        DispatchQueue.main.async {
            self.cartTable.reloadData()
        }
    }
    
    func getCart() -> Array<Item> {
        return self.cart
    }
    
    func setCart(cart: Array<Item>) {
        self.cart = cart
        self.reload()
    }
    
}
