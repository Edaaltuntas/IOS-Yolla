//
//  ItemContract.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation
import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewItemProtocol {
    func getCart() -> Array<Item>
    func setCart(cart: Array<Item>)
    func setProducts(products: Array<Item>)
    func getProduct(index: Int) -> Item
    func decreaseFromCart(product: Item)
    func increaseAmount(product: Item)
    func reloadCartTab()
    func reload()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterItemProtocol {
    
    var view: PresenterToViewItemProtocol? { get set }
    var interactor: PresenterToInteractorItemProtocol? { get set }
    var router: PresenterToRouterItemProtocol? { get set }
    
    func get()
    func addFavorite(id: String)
    func removeFavorite(id: String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorItemProtocol {
    
    var presenter: InteractorToPresenterItemProtocol? { get set }
    
    func get()
    func addFavorite(id: String)
    func removeFavorite(id: String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterItemProtocol {
    func getCart() -> Array<Item>
    func setCart(cart: Array<Item>)
    func setProducts(products: Array<Item>)
    func decreaseFromCart(product: Item)
    func increaseAmount(product: Item)
    func getProduct(index: Int) -> Item
    func reload()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterItemProtocol {

}
