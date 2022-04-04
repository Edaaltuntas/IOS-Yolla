//
//  SearchPresenter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation

class SearchPresenter: ViewToPresenterSearchProtocol {

    // MARK: Properties
    var view: PresenterToViewSearchProtocol?
    var interactor: PresenterToInteractorSearchProtocol?
    var router: PresenterToRouterSearchProtocol?
    
    func get(){
        interactor?.get()
    }

    func search(query: String) {
        interactor?.search(query: query)
    }
}

extension SearchPresenter: InteractorToPresenterSearchProtocol {
    func setProducts(products: Array<Item>, filter: Bool = true) {
        view?.setProducts(products: products, filter: filter)
    }

    func getProduct(index: Int) -> Item {
        return view!.getProduct(index: index)
    }

    func getProducts() -> Array<Item> {
        return view!.getProducts()
    }

    func reload() {
        view?.reload()
    }
}
