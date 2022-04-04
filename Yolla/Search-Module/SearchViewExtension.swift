//
//  SearchViewExtension.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//

import Foundation
import UIKit
import Kingfisher

extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destination = segue.destination as! ItemDetailViewController
            destination.item = sender as? Item
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.interactor?.search(query: searchText)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtered_products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self.presenter?.view?.getProduct(index: indexPath.row))
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = filtered_products[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "products", for: indexPath) as! SearchCollectionViewCell
        
        cell.indexPath = indexPath
        cell.productImage.kf.setImage(with: API.shared.build(url: "resimler/\(item.image)"), options: [
            .processor(DownsamplingImageProcessor(size: cell.productImage.bounds.size)),
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
        cell.viewObject = self.presenter!.view
        cell.productName.text = item.name
        cell.productPrice.text = String(format: "₺%g", item.price)
        if (item.is_favorite) {
            cell.favoriteButton.setImage(UIImage(named: "heart_Normal"), for: .normal)
        }else{
            cell.favoriteButton.setImage(UIImage(named: "heart1_Normal"), for: .normal)
        }
                
        return cell
    }
}
