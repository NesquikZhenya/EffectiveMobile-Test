//
//  AppDataController.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 17.03.2023.
//

import Foundation
import CoreData

final class AppDataController {
    
    static let shared = AppDataController()
    
    let container = NSPersistentContainer(name: "EffectiveMobile_Test")
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    private init () {
        container.loadPersistentStores {_, error in
            if let error = error {
                print("CoreData failed to load \(error)")
            }
        }
    }
    
}
