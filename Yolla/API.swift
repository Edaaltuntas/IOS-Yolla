//
//  API.swift
//  Yolla
//
//  Created by Eda Altuntaş on 25.03.2022.
//

import Foundation
import Alamofire
import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseSharedSwift

class API {
    static let shared = API()
    static let BaseUrl: URL = URL(string: "http://kasimadalan.pe.hu/yemekler")!
    let ref = FirebaseDatabase.Database.database().reference()
    
    func build(url: String)  -> URL {
        return API.BaseUrl.appendingPathComponent(url)
    }
    
    func get(completion:@escaping (((Array<Item>?) -> Void))) {
        AF.request(self.build(url: "tumYemekleriGetir.php"), method: .get).responseDecodable(of: YemeklerResponse.self) { response in
            switch response.result {
            case let .success(data):
                self.getFavorites() { response in
                    completion(data.yemekler.map{ (arr) -> Item in
                        if ( response.contains(arr.id) ) {
                            arr.is_favorite = true
                        }
                        return arr
                    })
                }
            case let .failure(error):
                print(error)
                completion(nil)
            }
        }
    }
    
    func getCart(completion: @escaping (((Array<Item>?) -> Void))) {
        AF.request(self.build(url: "sepettekiYemekleriGetir.php"), method: .post, parameters: [
            "kullanici_adi": self.getUniqueIdentifier()
        ]).responseDecodable(of: CartResponse.self) { response in
            switch response.result {
            case let .success(data):
                (UIApplication.shared.windows[0].rootViewController?.children[0] as? TabBarController)?.update()
                completion(data.sepetYemekler.reversed().unique{ $0.name })
            case let .failure(error):
                print(error)
                completion(nil)
            }
        }
    }
    
    func removeCartItem(food: Item, completion: @escaping (((Bool) -> Void))) {
        if (food.cart_id == nil) { return }
        AF.request(self.build(url: "sepettenYemekSil.php"), method: .post, parameters: [
            "sepet_yemek_id": food.cart_id!,
            "kullanici_adi": self.getUniqueIdentifier()
        ]).responseDecodable(of: RemoveCartItem.self) { response in
            switch response.result {
            case let .success(data):
                completion(data.success == 1)
            case let .failure(error):
                print(error)
                completion(false)
            }
        }
    }
    
    func addCartItem(food: Item, completion: @escaping (((Bool) -> Void))) {
        removeCartItem(food: food) { response in }
        AF.request(self.build(url: "sepeteYemekEkle.php"), method: .post, parameters: [
            "yemek_adi": food.name,
            "yemek_resim_adi": food.image,
            "yemek_fiyat": food.price,
            "yemek_siparis_adet": food.amount,
            "kullanici_adi": self.getUniqueIdentifier()
        ]).responseDecodable(of: RemoveCartItem.self) { response in
            switch response.result {
            case let .success(data):
                completion(data.success == 1)
            case .failure:
                completion(false)
            }
        }
        
    }
    
    func getUniqueIdentifier() -> String {
        if ( Auth.auth().currentUser != nil ){
            return Auth.auth().currentUser!.uid
        }
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    func getFavorites(completion: @escaping (((Array<String>) -> Void))) {
        ref.child("favorites").child(self.getUniqueIdentifier()).observeSingleEvent(of: .value) { snapshot in
            if ( snapshot.exists() ){
                completion(snapshot.children.map { (i) -> String in {
                    return ( i as! DataSnapshot ).key
                }()})
            }
            completion([String]())
        }
    }
    
    func addFavorite(id: String, completion: @escaping (((Bool) -> Void))) {
        ref.child("favorites/\(self.getUniqueIdentifier())").updateChildValues([id: true]) { error, ref in
            completion(error == nil)
        }
    }
    
    func removeFavorite(id: String, completion: @escaping (((Bool) -> Void))) {
        ref.child("favorites/\(self.getUniqueIdentifier())/\(id)").removeValue() { error, refer in
            completion(error == nil)
        }
    }
}

extension Array {
    func unique<T:Hashable>(map: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>()
        var arrayOrdered = [Element]()
        for value in self {
            if !set.contains(map(value)) {
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }
        
        return arrayOrdered
    }
}
