//
//  Yemekler.swift
//  Yolla
//
//  Created by Eda Altuntaş on 25.03.2022.
//

import Foundation

// MARK: - Product
class Item: Codable {
    let user : String?
    let id, name, image: String
    var cart_id: String?
    var amount: Int = 0
    var price: Double = 0
    var is_favorite: Bool = false
    var discount: UInt32 = 0
    
    enum CodingKeys: String, CodingKey {
        case cart_id = "sepet_yemek_id"
        case id = "yemek_id"
        case name = "yemek_adi"
        case image = "yemek_resim_adi"
        case price = "yemek_fiyat"
        case amount = "yemek_siparis_adet"
        case user = "kullanici_adi"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cart_id = try container.decodeIfPresent(String.self, forKey: .cart_id)
        self.id  = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.name  = try container.decode(String.self, forKey: .name)
        self.image  = try container.decode(String.self, forKey: .image)
        self.price = Double(try container.decode(String.self, forKey: .price)) ?? 0
        self.amount = Int(try container.decodeIfPresent(String.self, forKey: .amount) ?? "0") ?? 0
        self.user  = try container.decodeIfPresent(String.self, forKey: .user)
        self.discount = 0
    }
}
