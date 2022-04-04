//
//  SearchInteractor.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation

class SearchInteractor: PresenterToInteractorSearchProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterSearchProtocol?
    
    func get() {
        API.shared.get { response in
            self.presenter?.setProducts(products: response ?? [], filter: false)
            self.presenter?.setProducts(products: response ?? [], filter: true)
        }
    }
    
    func search(query: String) {
        let result = query.isEmpty ? self.presenter!.getProducts() : self.presenter!.getProducts().filter { (item: Item) -> Bool in
            return item.name.lowercased().contains(query.lowercased())
        }
        self.presenter?.setProducts(products: result, filter: true)
    }

}
