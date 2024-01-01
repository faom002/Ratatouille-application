import SwiftUI
import CoreData

struct ManageArchiveView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(
        entity: Archive.entity(),
        sortDescriptors: [.init(key: "meal", ascending: true)],
        predicate: NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                NSPredicate(format: "fromMeal == true"),
                NSPredicate(format: "fromIngredient == false"),
                NSPredicate(format: "fromArea == false")
            ]
        )
    ) var archiveMealBasedOnSearch: FetchedResults<Archive>
    
    @FetchRequest(
        entity: Archive.entity(),
        sortDescriptors: [.init(key: "ingredients", ascending: true)],
        predicate: NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                NSPredicate(format: "fromIngredient == true"),
                NSPredicate(format: "fromMeal == false"),
                NSPredicate(format: "fromArea == false"),
                NSPredicate(format: "fromCategory == false")
            ]
        )
    ) var archiveMealBasedOnIngredients: FetchedResults<Archive>
    
    
    
    @FetchRequest(
        entity: Archive.entity(),
        sortDescriptors: [.init(key: "area", ascending: true)],
        predicate: NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                NSPredicate(format: "fromArea == true"),
                NSPredicate(format: "fromMeal == false"),
                NSPredicate(format: "fromIngredient == false"),
                NSPredicate(format: "fromCategory == false")
            ]
        )
    ) var archiveMealBasedOnAreaMeal: FetchedResults<Archive>
    
    @FetchRequest(
        entity: Archive.entity(),
        sortDescriptors: [.init(key: "ingredients", ascending: true)],
        predicate: NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                NSPredicate(format: "fromIngredient == true"),
                NSPredicate(format: "fromMeal == true"),
                NSPredicate(format: "fromArea == true"),
                NSPredicate(format: "fromCategory == true")
            ]
        )
    ) var archiveMealBasedOnMineRecipes: FetchedResults<Archive>
    
    @FetchRequest(
        entity: Archive.entity(),
        sortDescriptors: [.init(key: "category", ascending: true)],
        predicate: NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                NSPredicate(format: "fromIngredient == false"),
                NSPredicate(format: "fromMeal == false"),
                NSPredicate(format: "fromArea == false"),
                NSPredicate(format: "fromCategory == true")
            ]
        )
    ) var archiveMealBasedOnCategory: FetchedResults<Archive>
    
    
    var body: some View {
        NavigationView {
            List {
                if !archiveMealBasedOnSearch.isEmpty {
                    Section(header: Text("Mat oppskrifter fra normal søk")) {
                        ForEach(archiveMealBasedOnSearch, id: \.id) { archiveItem in
                            if let convertedMeal = archiveItem.toArchiveMeal() {
                                NavigationLink(destination: MealDetailView(meal: convertedMeal, mealID: convertedMeal.idMeal)){
                                    Text(convertedMeal.strMeal)
                                        .bold()
                                    Text("Arkivert: \(FormattedArchiveDate.formattedArchiveDate(for: archiveItem.archiveDate))")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15))
                                }
                                .swipeActions {
                                    Button(role: .destructive) {
                                        deleteArchiveMeal(archiveItem)
                                    } label: {
                                        Label("Slett", systemImage: "trash")
                                    }
                                    
                                    Button {
                                        CoreDataFunctions.saveToCoreDataMeal(for: convertedMeal, context: moc)
                                        deleteArchiveMeal(archiveItem)
                                    } label: {
                                        Label("Gjenopprett", systemImage: "tray.and.arrow.up.fill")
                                    }
                                }
                            }
                        }
                    }
                }
                
                
                if !archiveMealBasedOnCategory.isEmpty {
                    Section(header: Text("Mat oppskrifter fra kategorier")) {
                        ForEach(archiveMealBasedOnCategory, id: \.id) { archiveCategoryItem in
                            if let convertedMeal = archiveCategoryItem.toArchiveMeal() {
                                NavigationLink(destination: MealDetailView(meal: convertedMeal, mealID: convertedMeal.idMeal)){
                                    Text(convertedMeal.strMeal)
                                        .bold()
                                    Text("Arkivert: \(FormattedArchiveDate.formattedArchiveDate(for: archiveCategoryItem.archiveDate))")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15))
                                }
                                .swipeActions {
                                    Button(role: .destructive) {
                                        deleteArchiveMeal(archiveCategoryItem)
                                    } label: {
                                        Label("Slett", systemImage: "trash")
                                    }
                                    
                                    Button {
                                        CoreDataFunctions.saveToCoreDataMeal(for: convertedMeal, context: moc)
                                        deleteArchiveMeal(archiveCategoryItem)
                                    } label: {
                                        Label("Gjenopprett", systemImage: "tray.and.arrow.up.fill")
                                    }
                                }
                            }
                        }
                    }
                }
                
                
                
                
                
                
                if !archiveMealBasedOnIngredients.isEmpty {
                    Section(header: Text("Mat oppskrifter fra ingredienser søk")) {
                        ForEach(archiveMealBasedOnIngredients, id: \.id) { archiveIngredientItem in
                            if let convertedMeal = archiveIngredientItem.toArchiveMeal() {
                                NavigationLink(destination: MealDetailView(meal: convertedMeal, mealID: convertedMeal.idMeal)){
                                    Text(convertedMeal.strMeal)
                                        .bold()
                                    Text("Arkivert: \(FormattedArchiveDate.formattedArchiveDate(for: archiveIngredientItem.archiveDate))")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15))
                                }
                                .swipeActions {
                                    Button(role: .destructive) {
                                        deleteArchiveMeal(archiveIngredientItem)
                                    } label: {
                                        Label("Slett", systemImage: "trash")
                                    }
                                    
                                    Button {
                                        CoreDataFunctions.saveToCoreDataMeal(for: convertedMeal, context: moc)
                                        deleteArchiveMeal(archiveIngredientItem)
                                    } label: {
                                        Label("Gjenopprett", systemImage: "tray.and.arrow.up.fill")
                                    }
                                }
                            }
                        }
                    }
                }
                
                
                
                if !archiveMealBasedOnMineRecipes.isEmpty {
                    Section(header: Text("Ingredienser fra mine oppskrifter")) {
                        ForEach(archiveMealBasedOnMineRecipes, id: \.id) { archiveMineRecipeItem in
                            if let convertedMeal = archiveMineRecipeItem.toArchiveMeal() {
                                NavigationLink(destination: MealDetailView(meal: convertedMeal, mealID: convertedMeal.idMeal)){
                                    Text(convertedMeal.strMeal)
                                        .bold()
                                    Text("Arkivert: \(FormattedArchiveDate.formattedArchiveDate(for: archiveMineRecipeItem.archiveDate))")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15))
                                }
                                .swipeActions {
                                    Button(role: .destructive) {
                                        deleteArchiveMeal(archiveMineRecipeItem)
                                    } label: {
                                        Label("Slett", systemImage: "trash")
                                    }
                                    
                                    Button {
                                        CoreDataFunctions.saveToCoreDataMeal(for: convertedMeal, context: moc)
                                        deleteArchiveMeal(archiveMineRecipeItem)
                                    } label: {
                                        Label("Gjenopprett", systemImage: "tray.and.arrow.up.fill")
                                    }
                                }
                            }
                        }
                    }
                }
                
                
                if !archiveMealBasedOnAreaMeal.isEmpty {
                    Section(header: Text("Ingredienser fra landområder søk")) {
                        ForEach(archiveMealBasedOnAreaMeal, id: \.id) { archiveAreaItem in
                            if let convertedMeal = archiveAreaItem.toArchiveMeal() {
                                NavigationLink(destination: MealDetailView(meal: convertedMeal, mealID: convertedMeal.idMeal)){
                                    Text(convertedMeal.strMeal)
                                        .bold()
                                    Text("Arkivert: \(FormattedArchiveDate.formattedArchiveDate(for: archiveAreaItem.archiveDate))")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15))
                                }
                                .swipeActions {
                                    Button(role: .destructive) {
                                        deleteArchiveMeal(archiveAreaItem)
                                    } label: {
                                        Label("Slett", systemImage: "trash")
                                    }
                                    
                                    Button {
                                        CoreDataFunctions.saveToCoreDataMeal(for: convertedMeal, context: moc)
                                        deleteArchiveMeal(archiveAreaItem)
                                    } label: {
                                        Label("Gjenopprett", systemImage: "tray.and.arrow.up.fill")
                                    }
                                }
                            }
                        }
                    }
                }
                
                if archiveMealBasedOnAreaMeal.isEmpty {
                    Section(header: Text("Mat Oppskrifter fra landområder søk")) {
                        Label("ingen arkivert mat oppskrifter fra Area søk", systemImage: "globe")
                            .foregroundColor(.blue)
                            .font(.system(size: 15))
                        
                    }
                    
                }
                
                if archiveMealBasedOnSearch.isEmpty {
                    Section(header: Text("Mat Oppskrifter fra søk")) {
                        Label("ingen arkivert mat oppskrifter fra søk", systemImage: "magnifyingglass.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 15))
                        
                    }
                    
                }
                
                if archiveMealBasedOnIngredients.isEmpty {
                    Section(header: Text("Mat Oppskrifter fra ingredienser søk")) {
                        Label("ingen arkivert ingredienser fra søk", systemImage: "carrot.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 15))
                        
                    }
                }
                
                if archiveMealBasedOnCategory.isEmpty {
                    Section(header: Text("Ingredienser fra mine kategorier")) {
                        Label("ingen arkivert ingredienser fra kategorier", systemImage: "rectangle.3.group.bubble.left")
                            .foregroundColor(.blue)
                            .font(.system(size: 15))
                        
                    }
                }
                
                
                if archiveMealBasedOnMineRecipes.isEmpty {
                    Section(header: Text("Ingredienser fra mine oppskrifter")) {
                        Label("ingen arkivert ingredienser fra mine oppskrift", systemImage: "fork.knife.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 15))
                        
                    }
                }
                
                
                
                
            }
            .navigationBarTitle("Arkiv")
        }
    }
    
    private func deleteArchiveMeal(_ archiveItem: Archive) {
        moc.delete(archiveItem)
        
        do {
            try moc.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}




struct ManageArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        ManageArchiveView()
    }
}
