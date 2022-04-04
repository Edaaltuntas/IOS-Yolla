//
//  TabRouter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation
import UIKit

class TabRouter: PresenterToRouterTabProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = TabBarController()
        
        let presenter: ViewToPresenterTabProtocol & InteractorToPresenterTabProtocol = TabPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = TabRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = TabInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
