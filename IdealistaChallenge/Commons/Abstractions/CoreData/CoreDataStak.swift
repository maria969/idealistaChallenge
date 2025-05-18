//
//  CoreDataStak.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 17/5/25.
//

import Foundation
import CoreData

public class CoreDataStack {

    // MARK: - Public Properties 
    public static let shared = CoreDataStack()

    public var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Private properties
    
    private let modelName = "IdealistaFav"

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("CoreData Error: \(error)")
            }
        }
        return container
    }()

    // MARK: - Public Methods
    
    public func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("CoreData: Saved")
            } catch {
                let nserror = error as NSError
                fatalError("CoreData Error Saved: \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
