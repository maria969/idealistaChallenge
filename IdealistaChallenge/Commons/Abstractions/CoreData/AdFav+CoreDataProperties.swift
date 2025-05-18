//
//  AdFav+CoreDataProperties.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 17/5/25.
//
//

import Foundation
import CoreData


extension AdFav {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AdFav> {
        return NSFetchRequest<AdFav>(entityName: "AdFav")
    }

    @NSManaged public var id: String?
    @NSManaged public var date: Date?

}

extension AdFav : Identifiable {

}
