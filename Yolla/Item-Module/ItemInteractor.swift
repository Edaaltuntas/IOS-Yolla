//
//  ItemInteractor.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation

class ItemInteractor: PresenterToInteractorItemProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterItemProtocol?
    
    func get() {
        API.shared.getCart { response in
            self.presenter?.setCart(cart: response ?? [])
            API.shared.get { response in
                self.presenter?.setProducts(products: response ?? [])
            }
        }
    }
    
    func addFavorite(id: String) {
        API.shared.addFavorite(id: id) { respose in
            API.shared.get { response in
                self.presenter?.setProducts(products: response ?? [])
            }
        }
    }
    
    func removeFavorite(id: String) {
        API.shared.removeFavorite(id: id) { response in
            API.shared.get { response in
                self.presenter?.setProducts(products: response ?? [])
            }
        }
    }

}
