//
//  HomeInteractor.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation

class HomeInteractor: PresenterToInteractorHomeProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterHomeProtocol?
    
    func get() {
        API.shared.getCart { response in
            self.presenter?.setCart(cart: response ?? [])
            API.shared.get { response in
                self.presenter?.setProducts(products: Array(response?.choose(2).map {
                    (item) -> Item in {
                        let discount = arc4random_uniform(60) + 10
                        item.price = Double(ceil(item.price * ( Double(discount) / 100 )))
                        item.discount = discount
                        return item
                    }()
                } ?? []))
            }
        }
    }
}

extension Collection {
    func choose(_ n: Int) -> ArraySlice<Element> { shuffled().prefix(n) }
}
