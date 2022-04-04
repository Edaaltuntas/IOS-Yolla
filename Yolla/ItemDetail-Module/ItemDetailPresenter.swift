//
//  ItemDetailPresenter.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation

class ItemDetailPresenter: ViewToPresenterItemDetailProtocol {

    // MARK: Properties
    var view: PresenterToViewItemDetailProtocol?
    var interactor: PresenterToInteractorItemDetailProtocol?
    var router: PresenterToRouterItemDetailProtocol?
}

extension ItemDetailPresenter: InteractorToPresenterItemDetailProtocol {
    
}
