//
//  YemeklerResponse.swift
//  Yolla
//
//  Created by Eda Altuntaş on 25.03.2022.
//

import Foundation

// MARK: - YemeklerResponse
class YemeklerResponse: Codable {
    let yemekler: [Item]
    let success: Int

    init(yemekler: [Item], success: Int) {
        self.yemekler = yemekler
        self.success = success
    }
}
