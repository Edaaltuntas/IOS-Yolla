//
//  ItemDetailContract.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewItemDetailProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterItemDetailProtocol {
    
    var view: PresenterToViewItemDetailProtocol? { get set }
    var interactor: PresenterToInteractorItemDetailProtocol? { get set }
    var router: PresenterToRouterItemDetailProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorItemDetailProtocol {
    
    var presenter: InteractorToPresenterItemDetailProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterItemDetailProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterItemDetailProtocol {
    
}
