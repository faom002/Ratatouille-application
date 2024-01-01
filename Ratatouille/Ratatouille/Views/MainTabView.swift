

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MineRecipesView()
                .tabItem {
                    Label("Mine Oppskrifter", systemImage: "fork.knife.circle.fill")
                }
            
            
            SearchRecipeView()
                .tabItem {
                    Label("Søk", systemImage: "magnifyingglass.circle.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
