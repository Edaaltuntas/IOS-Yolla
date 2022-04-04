//
//  ItemDetailViewController.swift
//  Yolla
//
//  Created by Eda Altuntaş on 4.04.2022.
//  
//

import UIKit
import Kingfisher

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    var item: Item?
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeNavButton()
        
        itemImage.kf.setImage(with: API.shared.build(url: "resimler/\(item!.image)"), options: [
            .processor(DownsamplingImageProcessor(size: itemImage.bounds.size)),
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
        itemName.text = item!.name
        itemPrice.text = String(format: "₺%g", item!.price)
    }
    
    func changeNavButton() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "back_Normal"), for: .normal)
            button.setTitle("Back", for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: button), animated: true)
    }
    
    @objc func back(){
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Properties
    var presenter: ViewToPresenterItemDetailProtocol?
    
}

extension ItemDetailViewController: PresenterToViewItemDetailProtocol{
    // TODO: Implement View Output Methods
}
