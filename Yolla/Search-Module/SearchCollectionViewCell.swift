//
//  SearchCollectionViewCell.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!

    var indexPath: IndexPath?
    var viewObject: PresenterToViewSearchProtocol?

    @IBAction func favoriteButtonAction(_ sender: Any) {
        let item = viewObject!.getProduct(index: indexPath!.row)
        item.is_favorite = !item.is_favorite
        viewObject!.reload()
    }

}
