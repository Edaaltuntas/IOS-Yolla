//
//  CartViewExtension.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//

import Foundation
import UIKit
import Kingfisher

extension CartViewController : UITableViewDelegate, UITableViewDataSource {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destination = segue.destination as! ItemDetailViewController
            destination.item = sender as? Item
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = cart[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "items", for: indexPath) as! CartTableViewCell
        cell.cartImage.kf.setImage(with: API.shared.build(url: "resimler/\(item.image)"), options: [
            .processor(DownsamplingImageProcessor(size: cell.cartImage.bounds.size)),
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
        cell.cartName.text = item.name
        cell.cartPrice.text = String(format: "Quantity: %d - Total Price: ₺%g", item.amount, item.price * Double(item.amount))
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let remove = UIContextualAction(style: .destructive, title: "Remove"){ (contextualAction,view,bool) in
            let item = self.presenter!.view!.getCart()[indexPath.row]
            
            let alert = UIAlertController(title: "Remove Action", message: "Are you sure you want to remove \(item.name) item in your cart?", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel){ action in }
            alert.addAction(cancel)
            
            let yes = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.presenter?.interactor!.remove(item: item)
            }
            alert.addAction(yes)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [remove])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self.presenter?.view?.getCart()[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
