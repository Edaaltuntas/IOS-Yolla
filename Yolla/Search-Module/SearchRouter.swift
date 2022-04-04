//
//  SearchRouter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation
import UIKit

class SearchRouter: PresenterToRouterSearchProtocol {
    
    // MARK: Static methods
    static func createModule(ref: SearchViewController?) {
        
        let viewController = ref ?? SearchViewController()
        
        let presenter: ViewToPresenterSearchProtocol & InteractorToPresenterSearchProtocol = SearchPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SearchRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SearchInteractor()
        viewController.presenter?.interactor?.presenter = presenter
    }
    
}
