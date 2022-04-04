//
//  ItemCollectionViewController.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//

import Foundation
import UIKit
import Kingfisher

extension ItemViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destination = segue.destination as! ItemDetailViewController
            destination.item = sender as? Item
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = products[indexPath.row]
        if let i = cart.filter({ $0.name == item.name }).last {
            item.amount = i.amount
            item.cart_id = i.cart_id
        }else{
            item.amount = 0
            item.cart_id = ""
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "products", for: indexPath) as! ItemCollectionViewCell
        
        cell.indexPath = indexPath
        cell.viewObject = self.presenter!.view
        cell.presenter = self.presenter!
        cell.productImage.kf.setImage(with: API.shared.build(url: "resimler/\(item.image)"), options: [
            .processor(DownsamplingImageProcessor(size: cell.productImage.bounds.size)),
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
        cell.productName.text = item.name
        cell.productPrice.text = String(format: "₺%g", item.price)
        cell.amountLabel.text = String(item.amount)
        cell.amountView.isHidden = item.amount == 0
        cell.minusButton.isHidden = item.amount == 0
        cell.minusButton.isEnabled = true
        cell.plusButton.isEnabled = true
        self.view.bringSubviewToFront(cell.plusButton)
        self.view.sendSubviewToBack(cell.amountView)
        cell.amountView.layer.masksToBounds = true
        cell.amountView.layer.borderWidth = 1.0
        cell.amountView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.1).cgColor
        
        if (item.is_favorite) {
            cell.favoriteButton.setImage(UIImage(named: "heart_Normal"), for: .normal)
        }else{
            cell.favoriteButton.setImage(UIImage(named: "heart1_Normal"), for: .normal)
        }
        
        let mutablePath = CGMutablePath()
        let mask = CAShapeLayer()
        mutablePath.addRect(CGRect(x: 0, y: -CGFloat(2), width: cell.amountView.bounds.width, height: cell.amountView.bounds.height))
        mutablePath.addRect(CGRect(x: 0, y: CGFloat(2) , width: cell.amountView.bounds.width , height: cell.amountView.bounds.height))
        mask.path = mutablePath
        mask.fillRule = CAShapeLayerFillRule.evenOdd
        mask.fillColor  = UIColor(white:1.0, alpha: 0.2).cgColor
        for layer in cell.amountView.layer.sublayers! {
            if layer.isKind(of: CAShapeLayer.self) {
                layer.removeFromSuperlayer()
            }
        }
        cell.amountView.layer.mask = mask
        cell.amountView.layer.addSublayer(mask)
        mask.shadowColor = UIColor.black.cgColor
        mask.shadowRadius = CGFloat(5)
        mask.shadowOpacity = 1.0
        mask.shadowOffset = CGSize(width: 0, height: -1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self.presenter?.view?.getProduct(index: indexPath.row))
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
