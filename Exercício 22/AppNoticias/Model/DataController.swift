import Foundation
import CoreData
import SwiftUI

class DataController {
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
        
    }
    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func loadData(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { stroreDescription, error in
            guard error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            completion?()
        }
    }
}

