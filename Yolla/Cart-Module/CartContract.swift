//
//  CartContract.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewCartProtocol {
    func getCart() -> Array<Item>
    func setCart(cart: Array<Item>)
    func reload()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCartProtocol {
    
    var view: PresenterToViewCartProtocol? { get set }
    var interactor: PresenterToInteractorCartProtocol? { get set }
    var router: PresenterToRouterCartProtocol? { get set }
    
    func get()
    func remove(item: Item)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCartProtocol {
    
    var presenter: InteractorToPresenterCartProtocol? { get set }
    
    func get()
    func remove(item: Item)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCartProtocol {
    func getCart() -> Array<Item>
    func setCart(cart: Array<Item>)
    func reload()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCartProtocol {
    
}
