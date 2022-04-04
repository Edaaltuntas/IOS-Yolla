//
//  ItemRouter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation
import UIKit

class ItemRouter: PresenterToRouterItemProtocol {
    
    // MARK: Static methods
    static func createModule(ref: ItemViewController?) {
        
        let viewController = ref ?? ItemViewController()
        
        let presenter: ViewToPresenterItemProtocol & InteractorToPresenterItemProtocol = ItemPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ItemRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ItemInteractor()
        viewController.presenter?.interactor?.presenter = presenter
    }
    
}
