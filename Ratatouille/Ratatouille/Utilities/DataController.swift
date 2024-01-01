import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Meals")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error{
                print(error)
            }
            
            print(description)
            
        }
    }
}
