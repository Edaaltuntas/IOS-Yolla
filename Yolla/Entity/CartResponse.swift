//
//  CartResponse.swift
//  Yolla
//
//  Created by Eda Altuntaş on 25.03.2022.
//

import Foundation

struct CartResponse: Codable {
    let sepetYemekler: [Item]
    let success: Int

    enum CodingKeys: String, CodingKey {
        case sepetYemekler = "sepet_yemekler"
        case success
    }
}
