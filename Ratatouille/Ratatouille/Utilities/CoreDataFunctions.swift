import CoreData

struct CoreDataFunctions {
    
    static func saveToCoreDataArchive(for meal: Meal, context moc: NSManagedObjectContext, fromIngredientSearch: Bool? = false, fromNormalSearch: Bool? = false, fromAreaSearch: Bool? = false, fromCategorySearch: Bool?) {
        let coreDataArchive = Archive(context: moc)
        populateRecordArchive(coreDataArchive, with: meal, fromIngredientSearch: fromIngredientSearch ?? false, fromNormalSearch: fromNormalSearch ?? false, fromAreaSearch: fromAreaSearch ?? false, fromCategorySearch: fromCategorySearch ?? false )
        saveContext(context: moc)
    }
    
    static func saveToCoreDataMeal(for meal: Meal, context moc: NSManagedObjectContext) {
        let coreDataMeal = Meals(context: moc)
        populateRecordMeals(coreDataMeal, with: meal)
        saveContext(context: moc)
    }
    
    static func saveToCoreDataIngredient(for meal: Meal, context moc: NSManagedObjectContext) {
        let coreDataIngredient = Ingredient(context: moc)
        populateRecordIngredient(coreDataIngredient, with: meal)
        saveContext(context: moc)
    }
    static func saveToCoreDataCategory(for meal: Meal, context moc: NSManagedObjectContext) {
        let coreDataIngredient = Category(context: moc)
        populateRecordCategory(coreDataIngredient, with: meal)
        saveContext(context: moc)
    }
    
    static func saveToCoreDataArea(for meal: Meal, context moc: NSManagedObjectContext) {
        let coreDataArea = Area(context: moc)
        populateRecordArea(coreDataArea, with: meal)
        saveContext(context: moc)
    }
    
    private static func saveContext(context moc: NSManagedObjectContext) {
        do {
            try moc.save()
            print("Saved to Core Data successfully.")
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }
    
    
    private static func populateRecordArchive(_ record: Archive, with meal: Meal, fromIngredientSearch: Bool?, fromNormalSearch: Bool?, fromAreaSearch: Bool?, fromCategorySearch: Bool?) {
        record.idMeal = meal.idMeal
        record.strMeal = meal.strMeal
        record.strArea = meal.strArea
        record.strCategory = meal.strCategory
        record.strIngredient1 = meal.strIngredient1
        record.strIngredient2 = meal.strIngredient2
        record.strIngredient3 = meal.strIngredient3
        record.strIngredient4 = meal.strIngredient4
        record.strIngredient5 = meal.strIngredient5
        record.strIngredient6 = meal.strIngredient6
        record.strIngredient7 = meal.strIngredient7
        record.strIngredient8 = meal.strIngredient8
        record.strIngredient9 = meal.strIngredient9
        record.strIngredient10 = meal.strIngredient10
        record.strIngredient11 = meal.strIngredient11
        record.strIngredient12 = meal.strIngredient12
        record.strIngredient13 = meal.strIngredient13
        record.strIngredient14 = meal.strIngredient14
        record.strIngredient15 = meal.strIngredient15
        record.strIngredient16 = meal.strIngredient16
        record.strIngredient17 = meal.strIngredient17
        record.strIngredient18 = meal.strIngredient18
        record.strIngredient19 = meal.strIngredient19
        record.strIngredient20 = meal.strIngredient20
        record.strInstructions = meal.strInstructions
        record.strMealThumb = meal.strMealThumb
        record.strMeasure1 = meal.strMeasure1
        record.strMeasure2 = meal.strMeasure2
        record.strMeasure3 = meal.strMeasure3
        record.strMeasure4 = meal.strMeasure4
        record.strMeasure5 = meal.strMeasure5
        record.strMeasure6 = meal.strMeasure6
        record.strMeasure7 = meal.strMeasure7
        record.strMeasure8 = meal.strMeasure8
        record.strMeasure9 = meal.strMeasure9
        record.strMeasure10 = meal.strMeasure10
        record.strMeasure11 = meal.strMeasure11
        record.strMeasure12 = meal.strMeasure12
        record.strMeasure13 = meal.strMeasure13
        record.strMeasure14 = meal.strMeasure14
        record.strMeasure15 = meal.strMeasure15
        record.strMeasure16 = meal.strMeasure16
        record.strMeasure17 = meal.strMeasure17
        record.strMeasure18 = meal.strMeasure18
        record.strMeasure19 = meal.strMeasure19
        record.strTags = meal.strTags
        record.strYoutube = meal.strYoutube
        record.fromIngredient = fromIngredientSearch ?? false
        record.fromMeal = fromNormalSearch ?? false
        record.fromArea = fromAreaSearch ?? false
        record.fromCategory = fromCategorySearch ?? false
        record.archiveDate = Date()
    }
    
    
    private static func populateRecordMeals(_ record: Meals, with meal: Meal) {
        record.idMeal = meal.idMeal
        record.strMeal = meal.strMeal
        record.strArea = meal.strArea
        record.strCategory = meal.strCategory
        record.strIngredient1 = meal.strIngredient1
        record.strIngredient2 = meal.strIngredient2
        record.strIngredient3 = meal.strIngredient3
        record.strIngredient4 = meal.strIngredient4
        record.strIngredient5 = meal.strIngredient5
        record.strIngredient6 = meal.strIngredient6
        record.strIngredient7 = meal.strIngredient7
        record.strIngredient8 = meal.strIngredient8
        record.strIngredient9 = meal.strIngredient9
        record.strIngredient10 = meal.strIngredient10
        record.strIngredient11 = meal.strIngredient11
        record.strIngredient12 = meal.strIngredient12
        record.strIngredient13 = meal.strIngredient13
        record.strIngredient14 = meal.strIngredient14
        record.strIngredient15 = meal.strIngredient15
        record.strIngredient16 = meal.strIngredient16
        record.strIngredient17 = meal.strIngredient17
        record.strIngredient18 = meal.strIngredient18
        record.strIngredient19 = meal.strIngredient19
        record.strIngredient20 = meal.strIngredient20
        record.strInstructions = meal.strInstructions
        record.strMealThumb = meal.strMealThumb
        record.strMeasure1 = meal.strMeasure1
        record.strMeasure2 = meal.strMeasure2
        record.strMeasure3 = meal.strMeasure3
        record.strMeasure4 = meal.strMeasure4
        record.strMeasure5 = meal.strMeasure5
        record.strMeasure6 = meal.strMeasure6
        record.strMeasure7 = meal.strMeasure7
        record.strMeasure8 = meal.strMeasure8
        record.strMeasure9 = meal.strMeasure9
        record.strMeasure10 = meal.strMeasure10
        record.strMeasure11 = meal.strMeasure11
        record.strMeasure12 = meal.strMeasure12
        record.strMeasure13 = meal.strMeasure13
        record.strMeasure14 = meal.strMeasure14
        record.strMeasure15 = meal.strMeasure15
        record.strMeasure16 = meal.strMeasure16
        record.strMeasure17 = meal.strMeasure17
        record.strMeasure18 = meal.strMeasure18
        record.strMeasure19 = meal.strMeasure19
        record.strTags = meal.strTags
        record.strYoutube = meal.strYoutube
        record.fromMeal = meal.fromMeal ?? false
    }
    
    
    private static func populateRecordIngredient(_ record: Ingredient, with meal: Meal) {
        record.idMeal = meal.idMeal
        record.strMeal = meal.strMeal
        record.strArea = meal.strArea
        record.strCategory = meal.strCategory
        record.strIngredient1 = meal.strIngredient1
        record.strIngredient2 = meal.strIngredient2
        record.strIngredient3 = meal.strIngredient3
        record.strIngredient4 = meal.strIngredient4
        record.strIngredient5 = meal.strIngredient5
        record.strIngredient6 = meal.strIngredient6
        record.strIngredient7 = meal.strIngredient7
        record.strIngredient8 = meal.strIngredient8
        record.strIngredient9 = meal.strIngredient9
        record.strIngredient10 = meal.strIngredient10
        record.strIngredient11 = meal.strIngredient11
        record.strIngredient12 = meal.strIngredient12
        record.strIngredient13 = meal.strIngredient13
        record.strIngredient14 = meal.strIngredient14
        record.strIngredient15 = meal.strIngredient15
        record.strIngredient16 = meal.strIngredient16
        record.strIngredient17 = meal.strIngredient17
        record.strIngredient18 = meal.strIngredient18
        record.strIngredient19 = meal.strIngredient19
        record.strIngredient20 = meal.strIngredient20
        record.strInstructions = meal.strInstructions
        record.strMealThumb = meal.strMealThumb
        record.strMeasure1 = meal.strMeasure1
        record.strMeasure2 = meal.strMeasure2
        record.strMeasure3 = meal.strMeasure3
        record.strMeasure4 = meal.strMeasure4
        record.strMeasure5 = meal.strMeasure5
        record.strMeasure6 = meal.strMeasure6
        record.strMeasure7 = meal.strMeasure7
        record.strMeasure8 = meal.strMeasure8
        record.strMeasure9 = meal.strMeasure9
        record.strMeasure10 = meal.strMeasure10
        record.strMeasure11 = meal.strMeasure11
        record.strMeasure12 = meal.strMeasure12
        record.strMeasure13 = meal.strMeasure13
        record.strMeasure14 = meal.strMeasure14
        record.strMeasure15 = meal.strMeasure15
        record.strMeasure16 = meal.strMeasure16
        record.strMeasure17 = meal.strMeasure17
        record.strMeasure18 = meal.strMeasure18
        record.strMeasure19 = meal.strMeasure19
        record.strTags = meal.strTags
        record.strYoutube = meal.strYoutube
        record.fromIngredient = meal.fromIngredient ?? false
        
    }
    
    
    private static func populateRecordArea(_ record: Area, with meal: Meal) {
        record.idMeal = meal.idMeal
        record.strMeal = meal.strMeal
        record.strArea = meal.strArea
        record.strCategory = meal.strCategory
        record.strIngredient1 = meal.strIngredient1
        record.strIngredient2 = meal.strIngredient2
        record.strIngredient3 = meal.strIngredient3
        record.strIngredient4 = meal.strIngredient4
        record.strIngredient5 = meal.strIngredient5
        record.strIngredient6 = meal.strIngredient6
        record.strIngredient7 = meal.strIngredient7
        record.strIngredient8 = meal.strIngredient8
        record.strIngredient9 = meal.strIngredient9
        record.strIngredient10 = meal.strIngredient10
        record.strIngredient11 = meal.strIngredient11
        record.strIngredient12 = meal.strIngredient12
        record.strIngredient13 = meal.strIngredient13
        record.strIngredient14 = meal.strIngredient14
        record.strIngredient15 = meal.strIngredient15
        record.strIngredient16 = meal.strIngredient16
        record.strIngredient17 = meal.strIngredient17
        record.strIngredient18 = meal.strIngredient18
        record.strIngredient19 = meal.strIngredient19
        record.strIngredient20 = meal.strIngredient20
        record.strInstructions = meal.strInstructions
        record.strMealThumb = meal.strMealThumb
        record.strMeasure1 = meal.strMeasure1
        record.strMeasure2 = meal.strMeasure2
        record.strMeasure3 = meal.strMeasure3
        record.strMeasure4 = meal.strMeasure4
        record.strMeasure5 = meal.strMeasure5
        record.strMeasure6 = meal.strMeasure6
        record.strMeasure7 = meal.strMeasure7
        record.strMeasure8 = meal.strMeasure8
        record.strMeasure9 = meal.strMeasure9
        record.strMeasure10 = meal.strMeasure10
        record.strMeasure11 = meal.strMeasure11
        record.strMeasure12 = meal.strMeasure12
        record.strMeasure13 = meal.strMeasure13
        record.strMeasure14 = meal.strMeasure14
        record.strMeasure15 = meal.strMeasure15
        record.strMeasure16 = meal.strMeasure16
        record.strMeasure17 = meal.strMeasure17
        record.strMeasure18 = meal.strMeasure18
        record.strMeasure19 = meal.strMeasure19
        record.strTags = meal.strTags
        record.strYoutube = meal.strYoutube
        record.fromArea = meal.fromArea ?? false
        
        
    }
    
    
    private static func populateRecordCategory(_ record: Category, with meal: Meal) {
        record.idMeal = meal.idMeal
        record.strMeal = meal.strMeal
        record.strArea = meal.strArea
        record.strCategory = meal.strCategory
        record.strIngredient1 = meal.strIngredient1
        record.strIngredient2 = meal.strIngredient2
        record.strIngredient3 = meal.strIngredient3
        record.strIngredient4 = meal.strIngredient4
        record.strIngredient5 = meal.strIngredient5
        record.strIngredient6 = meal.strIngredient6
        record.strIngredient7 = meal.strIngredient7
        record.strIngredient8 = meal.strIngredient8
        record.strIngredient9 = meal.strIngredient9
        record.strIngredient10 = meal.strIngredient10
        record.strIngredient11 = meal.strIngredient11
        record.strIngredient12 = meal.strIngredient12
        record.strIngredient13 = meal.strIngredient13
        record.strIngredient14 = meal.strIngredient14
        record.strIngredient15 = meal.strIngredient15
        record.strIngredient16 = meal.strIngredient16
        record.strIngredient17 = meal.strIngredient17
        record.strIngredient18 = meal.strIngredient18
        record.strIngredient19 = meal.strIngredient19
        record.strIngredient20 = meal.strIngredient20
        record.strInstructions = meal.strInstructions
        record.strMealThumb = meal.strMealThumb
        record.strMeasure1 = meal.strMeasure1
        record.strMeasure2 = meal.strMeasure2
        record.strMeasure3 = meal.strMeasure3
        record.strMeasure4 = meal.strMeasure4
        record.strMeasure5 = meal.strMeasure5
        record.strMeasure6 = meal.strMeasure6
        record.strMeasure7 = meal.strMeasure7
        record.strMeasure8 = meal.strMeasure8
        record.strMeasure9 = meal.strMeasure9
        record.strMeasure10 = meal.strMeasure10
        record.strMeasure11 = meal.strMeasure11
        record.strMeasure12 = meal.strMeasure12
        record.strMeasure13 = meal.strMeasure13
        record.strMeasure14 = meal.strMeasure14
        record.strMeasure15 = meal.strMeasure15
        record.strMeasure16 = meal.strMeasure16
        record.strMeasure17 = meal.strMeasure17
        record.strMeasure18 = meal.strMeasure18
        record.strMeasure19 = meal.strMeasure19
        record.strTags = meal.strTags
        record.strYoutube = meal.strYoutube
        record.fromCategory = meal.fromCategory ?? false
        
        
    }
    
}
