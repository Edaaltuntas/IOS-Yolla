//
//  SearchContract.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSearchProtocol {
    func getProduct(index: Int) -> Item
    func getProducts() -> Array<Item>
    func setProducts(products: Array<Item>, filter: Bool)
    func reload()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSearchProtocol {
    
    var view: PresenterToViewSearchProtocol? { get set }
    var interactor: PresenterToInteractorSearchProtocol? { get set }
    var router: PresenterToRouterSearchProtocol? { get set }

    func get()
    func search(query: String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSearchProtocol {
    
    var presenter: InteractorToPresenterSearchProtocol? { get set }

    func get()
    func search(query: String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSearchProtocol {
    func getProduct(index: Int) -> Item
    func getProducts() -> Array<Item>
    func setProducts(products: Array<Item>, filter: Bool)
    func reload()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSearchProtocol {
    
}
