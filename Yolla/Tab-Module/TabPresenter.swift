//
//  TabPresenter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation

class TabPresenter: ViewToPresenterTabProtocol {

    // MARK: Properties
    var view: PresenterToViewTabProtocol?
    var interactor: PresenterToInteractorTabProtocol?
    var router: PresenterToRouterTabProtocol?
}

extension TabPresenter: InteractorToPresenterTabProtocol {
    
}
