//
//  TabViewController.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import UIKit
import FirebaseAuth

class TabBarController: UITabBarController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavButtons()
        changeTint(selectedItem: nil)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        changeTint(selectedItem: item)
    }
    
    func changeTint(selectedItem: UITabBarItem?) {
        for item in tabBar.items! {
            if selectedItem == nil {
                if item.title == "Home" {
                    item.selectedImage = item.selectedImage?.withRenderingMode(.alwaysOriginal)
                }
            }else if selectedItem == item {
                item.selectedImage = item.selectedImage?.withRenderingMode(.alwaysOriginal)
            }else{
                item.selectedImage = item.selectedImage?.withRenderingMode(.alwaysTemplate)
            }
        }
    }
    
    func createNavButton(image: String) -> UIBarButtonItem {
        let image = UIImage(named: image)
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        let button = UIBarButtonItem(image: tintedImage, style: .plain, target: self, action: nil)
        button.tintColor = .white
        return button
    }
    
    func setNavButtons() {
        navigationItem.title = "Home"
        let b = createNavButton(image: "regularLogout_Normal")
        b.action = #selector(logout)
        navigationItem.rightBarButtonItem = b
    }
    
    @objc func logout(){
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toLogin", sender: nil)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func update() {
        API.shared.getCart() { response in
            if ( response?.count == 0 ) {
                self.resetCartTab()
            }else{
                let total_amount = response?.map { (i) -> Double in {
                    return Double(i.amount) * i.price
                }()}.reduce(0, +)
                if ( total_amount == nil ) {
                    self.resetCartTab()
                }else{
                    self.tabBar.items?[3].badgeValue = String(response?.filter { $0.amount > 0 }.count ?? 0)
                    self.tabBar.items?[3].title = "\(String(format: "%g", total_amount as! CVarArg)) TL"
                }
            }
        }
    }
    
    func resetCartTab() {
        self.tabBar.items?[3].badgeValue = nil
        self.tabBar.items?[3].title = "Cart"
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterTabProtocol?
    
}

extension TabBarController: PresenterToViewTabProtocol{
    // TODO: Implement View Output Methods
}
