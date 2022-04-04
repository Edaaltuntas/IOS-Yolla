//
//  HomeViewCell.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var amountView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var indexPath: IndexPath?
    var viewObject: PresenterToViewHomeProtocol?
    var presenter: ViewToPresenterHomeProtocol?
    
    @IBAction func plusButtonAction(_ sender: Any) {
        plusButton.isEnabled = false
        let item = viewObject!.getProduct(index: indexPath!.row)
        item.amount += 1
        API.shared.addCartItem(food: item) {
            response in
            self.reloadCart()
        }
    }
    
    @IBAction func minusButtonAction(_ sender: Any) {
        self.minusButton.isEnabled = false
        let item = viewObject!.getProduct(index: indexPath!.row)
        if ( item.amount > 0) {
            item.amount -= 1
            let results = viewObject!.getCart().filter{ $0.name == item.name}
            if ( results.count == 0 ){
                return
            }
            let nitem = results.last!
            API.shared.removeCartItem(food: nitem ) {
                response in
                nitem.amount -= 1
                if ( nitem.amount > 0 ){
                    API.shared.addCartItem(food: nitem ) { response in
                        self.reloadCart()
                    }
                }else{
                    self.reloadCart()
                }
            }
        }
    }
    
    func reloadCart() {
        API.shared.getCart() { response in
            DispatchQueue.main.async {
                self.viewObject!.setCart(cart: response ?? [])
            }
        }
    }
    
    func updateCartTotal() {
        self.viewObject!.reloadCartTab()
    }
    
}
