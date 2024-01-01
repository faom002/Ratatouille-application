import SwiftUI

@main
struct RatatouilleApp: App {
    @State private var isSplashScreenPresented = true
    
    @StateObject var dataController = DataController()
    
    
    
    var body: some Scene {
        WindowGroup {
            
            SplashScreenView()
                .environment(\.managedObjectContext,dataController.container.viewContext)
            
        }
        
    }
    
}







