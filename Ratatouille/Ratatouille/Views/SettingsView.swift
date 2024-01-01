import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkModeOn") private var isDarkModeOn = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Generelt")) {
                    
                    NavigationLink(destination: ListAreasView()){
                        Label("Redigere landområder", systemImage: "globe" )
                    }
                    
                    NavigationLink(destination: ListCategoriesView()){
                        Label("Redigere kategorier", systemImage: "rectangle.3.group.bubble.left" )
                    }
                    
                    NavigationLink(destination: ListIngredientsView(idMeal: "1", strMeal: "dsad", strMealThumb: Image(systemName: "square.and.arrow.up"))){
                        Label("Redigere ingredienser", systemImage: "carrot.fill" )
                    }
                    
                }
                darkModeToggle
                
                
                Section(header: Text("Andre ting")){
                    NavigationLink(destination: ManageArchiveView()){
                        Label("Administrere arkiv", systemImage: "archivebox.fill" )
                    }
                }
            }
            .navigationTitle("Innstillinger")
        }
    }
    
    private var darkModeToggle: some View {
        Toggle(isOn: $isDarkModeOn) {
            HStack {
                Image(systemName: isDarkModeOn ? "moon.fill" : "moon")
                    .foregroundColor(isDarkModeOn ? .yellow : .gray)
                Text("Aktiver mørk modus")
            }
        }
        .onChange(of: isDarkModeOn) { _ in
            toggleDarkOrLightMode()
        }
    }
    
    private func toggleDarkOrLightMode() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.forEach { window in
                window.overrideUserInterfaceStyle = isDarkModeOn ? .dark : .light
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

