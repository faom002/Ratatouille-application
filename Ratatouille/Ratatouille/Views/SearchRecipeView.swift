import SwiftUI
import CoreData

struct SearchRecipeView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var selectedButtonIndex = 0
    
    @State private var isGlobeButtonSelected = false
    @State private var isCarrotButtonSelected = false
    @State private var isRectangleButtonSelected = false
    @State private var isMagnifyingGlassButtonSelected = false
    @State private var searchText = ""
    @State private var searchTextForIngrediense = ""
    @State private var searchTextForArea = ""
    @State private var searchTextForCategory = ""
    @State private var searchResultsForMeal: [Meal] = []
    @State private var searchResultsForIngredientMeal: [Meal] = []
    @State private var searchResultsForCategoryMeal: [Meal] = []
    
    let buttons = ["globe", "carrot", "rectangle.3.group.bubble.left", "magnifyingglass"]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selectedButtonIndex, label: Text("Buttons")) {
                    ForEach(0..<buttons.count) { index in
                        Image(systemName: buttons[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                
                
                if buttons[selectedButtonIndex] == "carrot"{
                    TextField("Søk etter ingredienser (#Eksempel garlic, beef)", text: $searchTextForIngrediense)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onChange(of: searchTextForIngrediense, perform: { newValue in
                            SearchFunctions.searchForFoodBasedOnIngredient(searchTextForIngredient: newValue) { (meals, error) in
                                if let meals = meals {
                                    searchResultsForIngredientMeal = meals
                                } 
                            }
                        })
                    
                    List(searchResultsForIngredientMeal, id: \.idMeal) { meal in
                        
                        NavigationLink(destination: MealDetailView(meal: meal, mealID: meal.idMeal)) {
                            AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 30, height: 30)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                @unknown default:
                                    fatalError("Unknown case.")
                                }
                            }
                            
                            Text(meal.strMeal)
                                .swipeActions(edge: .leading) {
                                    
                                    Button {
                                        
                                        CoreDataFunctions.saveToCoreDataIngredient(for: meal, context: moc)
                                        
                                    } label: {
                                        Label("Star", systemImage: "star")
                                    }
                                    .tint(.yellow)
                                }
                                .swipeActions(edge: .trailing) {
                                    
                                    Button {
                                        
                                        CoreDataFunctions.saveToCoreDataArchive(for: meal, context: moc,fromIngredientSearch: true, fromNormalSearch: false, fromAreaSearch: false, fromCategorySearch: false)
                                        
                                    } label: {
                                        Label("Archive", systemImage: "archivebox.fill")
                                    }
                                    .tint(.blue)
                                }
                        }
                    }
                    
                }
                
                if buttons[selectedButtonIndex] == "magnifyingglass" {
                    TextField("Søk etter oppskrifter (#Eksempel pizza)", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onChange(of: searchText, perform: { newValue in
                            SearchFunctions.searchForFood(searchText: newValue) { (meals, error) in
                                if let meals = meals {
                                    searchResultsForMeal = meals
                                }
                            }
                        })
                    
                    List(searchResultsForMeal, id: \.idMeal) { meal in
                        NavigationLink(destination: MealDetailView(meal: meal, mealID: meal.idMeal)) {
                            AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 30, height: 30)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                @unknown default:
                                    fatalError("Unknown case.")
                                }
                            }
                            
                            Text(meal.strMeal)
                                .swipeActions(edge: .leading) {
                                    
                                    Button {
                                        
                                        CoreDataFunctions.saveToCoreDataMeal(for: meal, context: moc)
                                        
                                    } label: {
                                        Label("Star", systemImage: "star")
                                    }
                                    .tint(.yellow)
                                }
                                .swipeActions(edge: .trailing) {
                                    
                                    Button {
                                        
                                        CoreDataFunctions.saveToCoreDataArchive(for: meal, context: moc,fromIngredientSearch: false, fromNormalSearch: true, fromAreaSearch: false,fromCategorySearch: false)
                                        
                                    } label: {
                                        Label("Archive", systemImage: "archivebox.fill")
                                    }
                                    .tint(.blue)
                                }
                        }
                    }
                }
                
                
                
                if buttons[selectedButtonIndex] == "globe" {
                    TextField("Søk etter landområder (#Eksempel Italian, Spanish)", text: $searchTextForArea)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onChange(of: searchTextForArea, perform: { newValue in
                            SearchFunctions.searchForFoodBasedOnArea(searchTextForArea: newValue) { (meals, error) in
                                if let meals = meals {
                                    searchResultsForMeal = meals
                                }
                            }
                        })
                    
                    List(searchResultsForMeal, id: \.idMeal) { meal in
                        NavigationLink(destination: MealDetailView(meal: meal, mealID: meal.idMeal)) {
                            AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 30, height: 30)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                @unknown default:
                                    fatalError("Unknown case.")
                                }
                            }
                            
                            Text(meal.strMeal)
                                .swipeActions(edge: .leading) {
                                    
                                    Button {
                                        
                                        CoreDataFunctions.saveToCoreDataArea(for: meal, context: moc)
                                        
                                    } label: {
                                        Label("Star", systemImage: "star")
                                    }
                                    .tint(.yellow)
                                }
                                .swipeActions(edge: .trailing) {
                                    
                                    Button {
                                        
                                        CoreDataFunctions.saveToCoreDataArchive(for: meal, context: moc,fromIngredientSearch: false, fromNormalSearch: false ,fromAreaSearch: true, fromCategorySearch: false)
                                        
                                    } label: {
                                        Label("Archive", systemImage: "archivebox.fill")
                                    }
                                    .tint(.blue)
                                }
                        }
                    }
                }
                
                
                if buttons[selectedButtonIndex] == "rectangle.3.group.bubble.left"{
                    TextField("Søk etter kategorier (#Eksempel Seafood)", text: $searchTextForCategory)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onChange(of: searchTextForCategory, perform: { newValue in
                            SearchFunctions.searchForFoodBasedOnCategory(searchTextForCategory: newValue) { (meals, error) in
                                if let meals = meals {
                                    searchResultsForMeal = meals
                                }
                            }
                        })
                    
                    List(searchResultsForMeal, id: \.idMeal) { meal in
                        NavigationLink(destination: MealDetailView(meal: meal, mealID: meal.idMeal)) {
                            AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 30, height: 30)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .frame(width: 50, height: 50)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                @unknown default:
                                    fatalError("Unknown case.")
                                }
                            }
                            
                            Text(meal.strMeal)
                                .swipeActions(edge: .leading) {
                                    
                                    Button {
                                        
                                        CoreDataFunctions.saveToCoreDataCategory(for: meal, context: moc)
                                        
                                    } label: {
                                        Label("Star", systemImage: "star")
                                    }
                                    .tint(.yellow)
                                }
                                .swipeActions(edge: .trailing) {
                                    
                                    Button {
                                        
                                        CoreDataFunctions.saveToCoreDataArchive(for: meal, context: moc,fromIngredientSearch: false, fromNormalSearch: false ,fromAreaSearch: false, fromCategorySearch: true)
                                        
                                    } label: {
                                        Label("Archive", systemImage: "archivebox.fill")
                                    }
                                    .tint(.blue)
                                }
                        }
                    }
                }
                
                
                
                
            }
            .navigationBarTitle("Søk")
        }
        
        .onAppear {
            if let storeURL = moc.persistentStoreCoordinator?.persistentStores.first?.url {
                print("Core Data Store URL: \(storeURL)")
            }
        }
    }
    
    
    
    
    
    
}








struct SearchRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipeView()
            .environmentObject(DataController())
    }
}
