//
//  TabContract.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewTabProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterTabProtocol {
    
    var view: PresenterToViewTabProtocol? { get set }
    var interactor: PresenterToInteractorTabProtocol? { get set }
    var router: PresenterToRouterTabProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorTabProtocol {
    
    var presenter: InteractorToPresenterTabProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterTabProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterTabProtocol {
    
}
