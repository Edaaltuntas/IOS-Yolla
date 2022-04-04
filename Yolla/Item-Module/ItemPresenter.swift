//
//  ItemPresenter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation

class ItemPresenter: ViewToPresenterItemProtocol {

    // MARK: Properties
    var view: PresenterToViewItemProtocol?
    var interactor: PresenterToInteractorItemProtocol?
    var router: PresenterToRouterItemProtocol?

    func get(){
        interactor?.get()
    }
    
    func addFavorite(id: String) {
        interactor?.addFavorite(id: id)
    }

    func removeFavorite(id: String) {
        interactor?.removeFavorite(id: id)
    }
}

extension ItemPresenter: InteractorToPresenterItemProtocol {
    func getCart() -> Array<Item> {
        return view!.getCart()
    }
    
    func getProduct(index: Int) -> Item {
        return view!.getProduct(index: index)
    }
    
    func setCart(cart: Array<Item>) {
        view?.setCart(cart: cart)
    }
    
    func setProducts(products: Array<Item>) {
        view?.setProducts(products: products)
    }
    
    func decreaseFromCart(product: Item) {
        view?.decreaseFromCart(product: product)
    }
    
    func increaseAmount(product: Item) {
        view?.increaseAmount(product: product)
    }
    
    func reload() {
        view?.reload()
    }
}
