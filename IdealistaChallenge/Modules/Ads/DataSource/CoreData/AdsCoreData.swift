//
//  AdsCoreData.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 18/5/25.
//

import Foundation
import CoreData

public class AdsCoreData: AdsCoreDataInterface {
    private let context = CoreDataStack.shared.context
    
    // MARK: - Public Methods
    
    public func saveAdFav(ad: AdEntity , completion: @escaping (AdFav?) -> Void, failure: (ErrorEntity) -> Void) {
        if !self.isFav(ad: ad) {
            self._saveAdFav(id: ad.address, completion: completion, failure: failure)
        }
    }
    
    public func deleteAdFav(ad: AdEntity , completion: @escaping () -> Void, failure: (ErrorEntity) -> Void) {
        if self.isFav(ad: ad) {
            self._deleteFav(id: ad.address, completion: completion, failure: failure)
        }
    }
    
    public func isFav(ad: AdEntity) -> Bool {
        return self._isFav(ad: ad)
    }
    
    public func getFav(ad: AdEntity, completion: @escaping (AdFav) -> Void, failure: (ErrorEntity) -> Void) {
        self._getFav(id: ad.address, completion: completion, failure: failure)
    }
    
    // MARK: - Private Methods
    
    public func _isFav(ad: AdEntity) -> Bool {
        var isFav = false
        self._getFav(id: ad.address) { (adFav) in
            isFav = true
        } failure: { (error) in
            isFav = false
        }
        return isFav
    }
    
    private func _getFav(id: String, completion: @escaping (AdFav) -> Void, failure: (ErrorEntity) -> Void) {
        let fetchRequest: NSFetchRequest<AdFav> = AdFav.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let exisingFavs = try context.fetch(fetchRequest)
            guard let fav = exisingFavs.first else {
                failure(ErrorEntity(code: .other, message: "Not Fav"))
                return
            }
            completion(fav)
            
        } catch {
            failure(ErrorEntity(code: .other, message: "CoreData operation failed: \(error.localizedDescription)"))
        }
    }
    
    private func _deleteFav(id: String, completion: @escaping () -> Void, failure: (ErrorEntity) -> Void) {
        
        let fetchRequest: NSFetchRequest<AdFav> = AdFav.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let existingFavs = try context.fetch(fetchRequest)
            if !existingFavs.isEmpty {
                for fav in existingFavs {
                    context.delete(fav)
                }
                try context.save()
                completion()
            } else {
                failure(ErrorEntity(code: .other, message: "Ad not found in favorites"))
            }
            
        } catch {
            failure(ErrorEntity(code: .other, message: "CoreData operation failed: \(error.localizedDescription)"))
        }
    }
    
    public func _saveAdFav(id: String , completion: @escaping (AdFav?) -> Void, failure: (ErrorEntity) -> Void) {
        do {
            let newFav = AdFav(context: context)
            newFav.id = id
            newFav.date = Date()
            
            try context.save()
            completion(newFav)
        } catch {
            failure(ErrorEntity(code: .other, message: "CoreData operation failed: \(error.localizedDescription)"))
        }
    }
    
}
