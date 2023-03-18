//
//  PhonesDataStorage.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 17.03.2023.
//

import Foundation
import CoreData

struct PhonesDataStorage {
    
    private let context = AppDataController.shared.context
    
    func save(bestSellerPhone: BestSellerPhone) {
        context.perform {
            let phone = StoredBestSellerPhone(context: context)
            phone.id = Int32(bestSellerPhone.id)
            phone.isFavorites = bestSellerPhone.isFavorites
            phone.title = bestSellerPhone.title
            phone.picture = bestSellerPhone.picture
            phone.priceWithoutDiscount = Int32(bestSellerPhone.priceWithoutDiscount)
            phone.discountPrice = Int32(bestSellerPhone.discountPrice)
            try! context.save()
        }
    }
    
    func saveAll(bestSellerPhones: [BestSellerPhone]) {
        for bestSellerPhone in bestSellerPhones {
            context.perform {
                let phone = StoredBestSellerPhone(context: context)
                phone.id = bestSellerPhone.id
                phone.isFavorites = bestSellerPhone.isFavorites
                phone.title = bestSellerPhone.title
                phone.picture = bestSellerPhone.picture
                phone.priceWithoutDiscount = bestSellerPhone.priceWithoutDiscount
                phone.discountPrice = bestSellerPhone.discountPrice
                try! context.save()
            }
        }
    }
    
    func updateFavourite(bestSellerPhone: BestSellerPhone) {
        context.perform {
            let fetchRequest = StoredBestSellerPhone.fetchRequest() as! NSFetchRequest<StoredBestSellerPhone>
            let storedBestSellerPhones = try! context.fetch(fetchRequest)
            let storedBestSellerPhone = storedBestSellerPhones.first(where:{$0.id == bestSellerPhone.id})
            storedBestSellerPhone?.isFavorites = bestSellerPhone.isFavorites
            try! context.save()
        }
    }
    
    func updateAll(bestSellerPhones: [BestSellerPhone]) {
        context.perform {
            let fetchRequest = StoredBestSellerPhone.fetchRequest() as! NSFetchRequest<StoredBestSellerPhone>
            let storedBestSellerPhones = try! context.fetch(fetchRequest)
            for i in 0...bestSellerPhones.count - 1 {
                storedBestSellerPhones[i].isFavorites = bestSellerPhones[i].isFavorites
                storedBestSellerPhones[i].setValue("GЫСА", forKey: "title")
            }
            try! context.save()
        }
    }
    
    func fetchFavourites(completion: @escaping ([StoredBestSellerPhone]) -> ()?) {
        context.perform {
            let fetchRequest = StoredBestSellerPhone.fetchRequest() as! NSFetchRequest<StoredBestSellerPhone>
            let storedBestSellerPhones = try! context.fetch(fetchRequest)
            let favouriteStoredBestSellerPhones = storedBestSellerPhones.filter({$0.isFavorites == true})
            completion(favouriteStoredBestSellerPhones)
        }
    }
    
    func fetchAll(completion: @escaping ([StoredBestSellerPhone]) -> ()?) {
        context.perform {
            let fetchRequest = StoredBestSellerPhone.fetchRequest() as! NSFetchRequest<StoredBestSellerPhone>
            let storedBestSellerPhones = try! context.fetch(fetchRequest)
            completion(storedBestSellerPhones)
        }
    }
    
    
    func remove(by id: UUID){
        
    }
    
    func removeAll() {
        
    }
}

