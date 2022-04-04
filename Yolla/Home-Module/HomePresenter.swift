//
//  HomePresenter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {

    // MARK: Properties
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?

    func get(){
        interactor?.get()
    }
    
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
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
