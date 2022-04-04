//
//  HomeRouter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {
    
    // MARK: Static methods
    static func createModule(ref: HomeViewController?) {
        
        let viewController = ref ?? HomeViewController()
        
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
    }
    
}
