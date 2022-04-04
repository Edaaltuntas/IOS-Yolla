//
//  CartRouter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation
import UIKit

class CartRouter: PresenterToRouterCartProtocol {
    
    // MARK: Static methods
    static func createModule(ref: CartViewController?) {
        
        let viewController = ref ?? CartViewController()
        
        let presenter: ViewToPresenterCartProtocol & InteractorToPresenterCartProtocol = CartPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CartRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CartInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
    }
    
}
