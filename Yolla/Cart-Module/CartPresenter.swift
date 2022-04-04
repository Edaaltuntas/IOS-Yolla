//
//  CartPresenter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation

class CartPresenter: ViewToPresenterCartProtocol {
    func get() {
        interactor?.get()
    }
    
    func remove(item: Item) {
        interactor?.remove(item: item)
    }
    

    // MARK: Properties
    var view: PresenterToViewCartProtocol?
    var interactor: PresenterToInteractorCartProtocol?
    var router: PresenterToRouterCartProtocol?
}

extension CartPresenter: InteractorToPresenterCartProtocol {
    func getCart() -> Array<Item> {
        return view!.getCart()
    }
    
    func setCart(cart: Array<Item>) {
        view?.setCart(cart: cart)
    }
    
    func reload() {
        view?.reload()
    }
}
