//
//  HomeContract.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {
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
protocol ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }

    func get()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol? { get set }

    func get()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
    func getCart() -> Array<Item>
    func setCart(cart: Array<Item>)
    func setProducts(products: Array<Item>)
    func decreaseFromCart(product: Item)
    func increaseAmount(product: Item)
    func getProduct(index: Int) -> Item
    func reload()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    
}
