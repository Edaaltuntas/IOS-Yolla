//
//  CartInteractor.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation

class CartInteractor: PresenterToInteractorCartProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterCartProtocol?
    
    func get() {
        API.shared.getCart { response in
            self.presenter?.setCart(cart: response ?? [])
        }
    }
    
    func remove(item: Item) {
        API.shared.removeCartItem(food: item) { response in
            self.get()
        }
    }
}
