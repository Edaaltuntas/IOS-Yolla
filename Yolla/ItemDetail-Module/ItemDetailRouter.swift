//
//  ItemDetailRouter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation
import UIKit

class ItemDetailRouter: PresenterToRouterItemDetailProtocol {
    
    // MARK: Static methods
    static func createModule(ref: ItemDetailViewController?) -> UIViewController {
        
        let viewController = ref ?? ItemDetailViewController()
        
        let presenter: ViewToPresenterItemDetailProtocol & InteractorToPresenterItemDetailProtocol = ItemDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ItemDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ItemDetailInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
