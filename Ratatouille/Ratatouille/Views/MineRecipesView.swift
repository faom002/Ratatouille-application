import SwiftUI
import CoreData

struct MineRecipesView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Meals.entity(), sortDescriptors: []) var meals: FetchedResults<Meals>
    
    @FetchRequest(entity: Ingredient.entity(), sortDescriptors: []) var ingredient: FetchedResults<Ingredient>
    @FetchRequest(entity: Area.entity(), sortDescriptors: []) var area: FetchedResults<Area>
    @FetchRequest(entity: Category.entity(), sortDescriptors: []) var category: FetchedResults<Category>
    var body: some View {
        NavigationView {
            if meals.isEmpty && ingredient.isEmpty && area.isEmpty && category.isEmpty{
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 190, height: 190)
                    
                    Spacer()
                    
                    Image(systemName: "square.stack.3d.up.slash")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("ingen matoppskrifter")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
            } else {
                List {
                    ForEach(meals, id: \.idMeal) { meal in
                        
                        
                        
                        if let convertedMeal = meal.toMeal() {
                            NavigationLink(destination: MealDetailView(meal: convertedMeal, mealID: convertedMeal.idMeal)) {
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
                                Text(convertedMeal.strMeal)
                            }
                            .swipeActions(edge: .trailing){
                                Button{
                                    
                                    CoreDataFunctions.saveToCoreDataArchive(for: convertedMeal, context: moc, fromIngredientSearch: true, fromNormalSearch: true, fromAreaSearch: true, fromCategorySearch: true)
                                    deleteMeal(meal)
                                    
                                }label: {
                                    Label("Archive", systemImage: "archivebox.fill")
                                }
                                .tint(.blue)
                                
                            }
                        } else {
                            Text("Ukjent måltid")
                        }
                    }
                    
                    
                    ForEach(ingredient, id: \.idMeal) { meal in
                        
                        
                        
                        if let convertedMeal = meal.toIngredient() {
                            NavigationLink(destination: MealDetailView(meal: convertedMeal, mealID: convertedMeal.idMeal)) {
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
                                Text(convertedMeal.strMeal)
                            }
                            .swipeActions(edge: .trailing){
                                Button{
                                    
                                    CoreDataFunctions.saveToCoreDataArchive(for: convertedMeal, context: moc, fromIngredientSearch: true, fromNormalSearch: true, fromAreaSearch: true,fromCategorySearch: true)
                                    deleteIngredientMeal(meal)
                                    
                                }label: {
                                    Label("Archive", systemImage: "archivebox.fill")
                                }
                                .tint(.blue)
                                
                            }
                        } else {
                            Text("Ukjent måltid")
                        }
                    }
                    
                    ForEach(area, id: \.idMeal) { meal in
                        
                        
                        
                        if let convertedAreaMeal = meal.toArea() {
                            NavigationLink(destination: MealDetailView(meal: convertedAreaMeal, mealID: convertedAreaMeal.idMeal)) {
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
                                Text(convertedAreaMeal.strMeal)
                                
                            }
                            .swipeActions(edge: .trailing){
                                
                                Button{
                                    
                                    CoreDataFunctions.saveToCoreDataArchive(for: convertedAreaMeal, context: moc, fromIngredientSearch: true, fromNormalSearch: true, fromAreaSearch: true,fromCategorySearch: true)
                                    deleteAreaMeal(meal)
                                    
                                }label: {
                                    Label("Archive", systemImage: "archivebox.fill")
                                }
                                .tint(.blue)
                                
                            }
                        } else {
                            Text("Ukjent måltid")
                        }
                    }
                    
                    ForEach(category, id: \.idMeal) { meal in
                        
                        
                        
                        if let convertedCategoryMeal = meal.toCategory() {
                            NavigationLink(destination: MealDetailView(meal: convertedCategoryMeal, mealID: convertedCategoryMeal.idMeal)) {
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
                                Text(convertedCategoryMeal.strMeal)
                                
                            }
                            .swipeActions(edge: .trailing){
                                
                                Button{
                                    
                                    CoreDataFunctions.saveToCoreDataArchive(for: convertedCategoryMeal, context: moc, fromIngredientSearch: true, fromNormalSearch: true, fromAreaSearch: true,fromCategorySearch: true)
                                    deleteCategoryMeal(meal)
                                    
                                }label: {
                                    Label("Archive", systemImage: "archivebox.fill")
                                }
                                .tint(.blue)
                                
                            }
                        } else {
                            Text("Ukjent måltid")
                        }
                    }
                    
                    
                    
                }
                
                
                .navigationTitle("Mine Oppskrift")
                
            }
            
            
        }
    }
    
    private func deleteMeal(_ meal: Meals) {
        
        
        
        moc.delete(meal)
        
        do {
            try moc.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    private func deleteCategoryMeal(_ meal: Category) {
        
        
        
        moc.delete(meal)
        
        do {
            try moc.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
    
    private func deleteIngredientMeal(_ meal: Ingredient) {
        
        
        
        moc.delete(meal)
        
        do {
            try moc.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
    
    private func deleteAreaMeal(_ meal: Area) {
        
        
        
        moc.delete(meal)
        
        do {
            try moc.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
}








struct MineRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        MineRecipesView()
    }
}
