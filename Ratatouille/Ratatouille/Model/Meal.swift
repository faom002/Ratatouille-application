struct MealResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    var strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let fromMeal: Bool?
    let fromIngredient: Bool?
    let fromArea: Bool?
    let fromCategory: Bool?
    
    
    var id: Int {
        return Int(idMeal) ?? 0
    }
    
    var ingredients: [String] {
        let nonEmptyIngredients = [strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient15].compactMap { $0 }.filter { !$0.isEmpty }
        return nonEmptyIngredients
    }
    
    var measures: [String?] {
        return [strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15]
    }    
}


extension Meals {
    func toMeal() -> Meal? {
        return Meal(
            idMeal: idMeal ?? "",
            strMeal: strMeal ?? "",
            strCategory: strCategory ?? "",
            strArea: strArea ?? "",
            strInstructions: strInstructions ?? "",
            strMealThumb: strMealThumb ?? "",
            strTags: strTags ?? "",
            strYoutube: strYoutube ?? "",
            strIngredient1: strIngredient1 ?? "",
            strIngredient2: strIngredient2 ?? "",
            strIngredient3: strIngredient3 ?? "",
            strIngredient4: strIngredient4 ?? "",
            strIngredient5: strIngredient5 ?? "",
            strIngredient6: strIngredient6 ?? "",
            strIngredient7: strIngredient7 ?? "",
            strIngredient8: strIngredient8 ?? "",
            strIngredient9: strIngredient9 ?? "",
            strIngredient10: strIngredient10 ?? "",
            strIngredient11: strIngredient11 ?? "",
            strIngredient12: strIngredient12 ?? "",
            strIngredient13: strIngredient13 ?? "",
            strIngredient14: strIngredient14 ?? "",
            strIngredient15: strIngredient15 ?? "",
            strIngredient16: strIngredient16 ?? "",
            strIngredient17: strIngredient17 ?? "",
            strIngredient18: strIngredient18 ?? "",
            strIngredient19: strIngredient19 ?? "",
            strIngredient20: strIngredient20 ?? "",
            strMeasure1: strMeasure1 ?? "",
            strMeasure2: strMeasure2 ?? "",
            strMeasure3: strMeasure3 ?? "",
            strMeasure4: strMeasure4 ?? "",
            strMeasure5: strMeasure5 ?? "",
            strMeasure6: strMeasure6 ?? "",
            strMeasure7: strMeasure7 ?? "",
            strMeasure8: strMeasure8 ?? "",
            strMeasure9: strMeasure9 ?? "",
            strMeasure10: strMeasure10 ?? "",
            strMeasure11: strMeasure11 ?? "",
            strMeasure12: strMeasure12 ?? "",
            strMeasure13: strMeasure13 ?? "",
            strMeasure14: strMeasure14 ?? "",
            strMeasure15: strMeasure15 ?? "",
            strMeasure16: strMeasure16 ?? "",
            strMeasure17: strMeasure17 ?? "",
            strMeasure18: strMeasure18 ?? "",
            strMeasure19: strMeasure19 ?? "",
            strMeasure20: strMeasure20 ?? "",
            fromMeal: true,
            fromIngredient: false,
            fromArea: false,
            fromCategory: false
        )
    }
    
    
    
    
}


extension Archive {
    func toArchiveMeal() -> Meal? {
        return Meal(
            idMeal: idMeal ?? "",
            strMeal: strMeal ?? "",
            strCategory: strCategory ?? "",
            strArea: strArea ?? "",
            strInstructions: strInstructions ?? "",
            strMealThumb: strMealThumb ?? "",
            strTags: strTags ?? "",
            strYoutube: strYoutube ?? "",
            strIngredient1: strIngredient1 ?? "",
            strIngredient2: strIngredient2 ?? "",
            strIngredient3: strIngredient3 ?? "",
            strIngredient4: strIngredient4 ?? "",
            strIngredient5: strIngredient5 ?? "",
            strIngredient6: strIngredient6 ?? "",
            strIngredient7: strIngredient7 ?? "",
            strIngredient8: strIngredient8 ?? "",
            strIngredient9: strIngredient9 ?? "",
            strIngredient10: strIngredient10 ?? "",
            strIngredient11: strIngredient11 ?? "",
            strIngredient12: strIngredient12 ?? "",
            strIngredient13: strIngredient13 ?? "",
            strIngredient14: strIngredient14 ?? "",
            strIngredient15: strIngredient15 ?? "",
            strIngredient16: strIngredient16 ?? "",
            strIngredient17: strIngredient17 ?? "",
            strIngredient18: strIngredient18 ?? "",
            strIngredient19: strIngredient19 ?? "",
            strIngredient20: strIngredient20 ?? "",
            strMeasure1: strMeasure1 ?? "",
            strMeasure2: strMeasure2 ?? "",
            strMeasure3: strMeasure3 ?? "",
            strMeasure4: strMeasure4 ?? "",
            strMeasure5: strMeasure5 ?? "",
            strMeasure6: strMeasure6 ?? "",
            strMeasure7: strMeasure7 ?? "",
            strMeasure8: strMeasure8 ?? "",
            strMeasure9: strMeasure9 ?? "",
            strMeasure10: strMeasure10 ?? "",
            strMeasure11: strMeasure11 ?? "",
            strMeasure12: strMeasure12 ?? "",
            strMeasure13: strMeasure13 ?? "",
            strMeasure14: strMeasure14 ?? "",
            strMeasure15: strMeasure15 ?? "",
            strMeasure16: strMeasure16 ?? "",
            strMeasure17: strMeasure17 ?? "",
            strMeasure18: strMeasure18 ?? "",
            strMeasure19: strMeasure19 ?? "",
            strMeasure20: strMeasure20 ?? "",
            fromMeal: fromMeal,
            fromIngredient: fromIngredient,
            fromArea: fromArea,
            fromCategory: fromCategory
            
        )
    }
    
    
    
    
    
}


extension Ingredient {
    func toIngredient() -> Meal? {
        return Meal(
            idMeal: idMeal ?? "",
            strMeal: strMeal ?? "",
            strCategory: strCategory ?? "",
            strArea: strArea ?? "",
            strInstructions: strInstructions ?? "",
            strMealThumb: strMealThumb ?? "",
            strTags: strTags ?? "",
            strYoutube: strYoutube ?? "",
            strIngredient1: strIngredient1 ?? "",
            strIngredient2: strIngredient2 ?? "",
            strIngredient3: strIngredient3 ?? "",
            strIngredient4: strIngredient4 ?? "",
            strIngredient5: strIngredient5 ?? "",
            strIngredient6: strIngredient6 ?? "",
            strIngredient7: strIngredient7 ?? "",
            strIngredient8: strIngredient8 ?? "",
            strIngredient9: strIngredient9 ?? "",
            strIngredient10: strIngredient10 ?? "",
            strIngredient11: strIngredient11 ?? "",
            strIngredient12: strIngredient12 ?? "",
            strIngredient13: strIngredient13 ?? "",
            strIngredient14: strIngredient14 ?? "",
            strIngredient15: strIngredient15 ?? "",
            strIngredient16: strIngredient16 ?? "",
            strIngredient17: strIngredient17 ?? "",
            strIngredient18: strIngredient18 ?? "",
            strIngredient19: strIngredient19 ?? "",
            strIngredient20: strIngredient20 ?? "",
            strMeasure1: strMeasure1 ?? "",
            strMeasure2: strMeasure2 ?? "",
            strMeasure3: strMeasure3 ?? "",
            strMeasure4: strMeasure4 ?? "",
            strMeasure5: strMeasure5 ?? "",
            strMeasure6: strMeasure6 ?? "",
            strMeasure7: strMeasure7 ?? "",
            strMeasure8: strMeasure8 ?? "",
            strMeasure9: strMeasure9 ?? "",
            strMeasure10: strMeasure10 ?? "",
            strMeasure11: strMeasure11 ?? "",
            strMeasure12: strMeasure12 ?? "",
            strMeasure13: strMeasure13 ?? "",
            strMeasure14: strMeasure14 ?? "",
            strMeasure15: strMeasure15 ?? "",
            strMeasure16: strMeasure16 ?? "",
            strMeasure17: strMeasure17 ?? "",
            strMeasure18: strMeasure18 ?? "",
            strMeasure19: strMeasure19 ?? "",
            strMeasure20: strMeasure20 ?? "",
            fromMeal: false,
            fromIngredient: true,
            fromArea: false,
            fromCategory: false
            
        )
    }
    
}


extension Area {
    func toArea() -> Meal? {
        return Meal(
            idMeal: idMeal ?? "",
            strMeal: strMeal ?? "",
            strCategory: strCategory ?? "",
            strArea: strArea ?? "",
            strInstructions: strInstructions ?? "",
            strMealThumb: strMealThumb ?? "",
            strTags: strTags ?? "",
            strYoutube: strYoutube ?? "",
            strIngredient1: strIngredient1 ?? "",
            strIngredient2: strIngredient2 ?? "",
            strIngredient3: strIngredient3 ?? "",
            strIngredient4: strIngredient4 ?? "",
            strIngredient5: strIngredient5 ?? "",
            strIngredient6: strIngredient6 ?? "",
            strIngredient7: strIngredient7 ?? "",
            strIngredient8: strIngredient8 ?? "",
            strIngredient9: strIngredient9 ?? "",
            strIngredient10: strIngredient10 ?? "",
            strIngredient11: strIngredient11 ?? "",
            strIngredient12: strIngredient12 ?? "",
            strIngredient13: strIngredient13 ?? "",
            strIngredient14: strIngredient14 ?? "",
            strIngredient15: strIngredient15 ?? "",
            strIngredient16: strIngredient16 ?? "",
            strIngredient17: strIngredient17 ?? "",
            strIngredient18: strIngredient18 ?? "",
            strIngredient19: strIngredient19 ?? "",
            strIngredient20: strIngredient20 ?? "",
            strMeasure1: strMeasure1 ?? "",
            strMeasure2: strMeasure2 ?? "",
            strMeasure3: strMeasure3 ?? "",
            strMeasure4: strMeasure4 ?? "",
            strMeasure5: strMeasure5 ?? "",
            strMeasure6: strMeasure6 ?? "",
            strMeasure7: strMeasure7 ?? "",
            strMeasure8: strMeasure8 ?? "",
            strMeasure9: strMeasure9 ?? "",
            strMeasure10: strMeasure10 ?? "",
            strMeasure11: strMeasure11 ?? "",
            strMeasure12: strMeasure12 ?? "",
            strMeasure13: strMeasure13 ?? "",
            strMeasure14: strMeasure14 ?? "",
            strMeasure15: strMeasure15 ?? "",
            strMeasure16: strMeasure16 ?? "",
            strMeasure17: strMeasure17 ?? "",
            strMeasure18: strMeasure18 ?? "",
            strMeasure19: strMeasure19 ?? "",
            strMeasure20: strMeasure20 ?? "",
            fromMeal: false,
            fromIngredient: false,
            fromArea: true,
            fromCategory: false
            
            
        )
    }
    
}


extension Category {
    func toCategory() -> Meal? {
        return Meal(
            idMeal: idMeal ?? "",
            strMeal: strMeal ?? "",
            strCategory: strCategory ?? "",
            strArea: strArea ?? "",
            strInstructions: strInstructions ?? "",
            strMealThumb: strMealThumb ?? "",
            strTags: strTags ?? "",
            strYoutube: strYoutube ?? "",
            strIngredient1: strIngredient1 ?? "",
            strIngredient2: strIngredient2 ?? "",
            strIngredient3: strIngredient3 ?? "",
            strIngredient4: strIngredient4 ?? "",
            strIngredient5: strIngredient5 ?? "",
            strIngredient6: strIngredient6 ?? "",
            strIngredient7: strIngredient7 ?? "",
            strIngredient8: strIngredient8 ?? "",
            strIngredient9: strIngredient9 ?? "",
            strIngredient10: strIngredient10 ?? "",
            strIngredient11: strIngredient11 ?? "",
            strIngredient12: strIngredient12 ?? "",
            strIngredient13: strIngredient13 ?? "",
            strIngredient14: strIngredient14 ?? "",
            strIngredient15: strIngredient15 ?? "",
            strIngredient16: strIngredient16 ?? "",
            strIngredient17: strIngredient17 ?? "",
            strIngredient18: strIngredient18 ?? "",
            strIngredient19: strIngredient19 ?? "",
            strIngredient20: strIngredient20 ?? "",
            strMeasure1: strMeasure1 ?? "",
            strMeasure2: strMeasure2 ?? "",
            strMeasure3: strMeasure3 ?? "",
            strMeasure4: strMeasure4 ?? "",
            strMeasure5: strMeasure5 ?? "",
            strMeasure6: strMeasure6 ?? "",
            strMeasure7: strMeasure7 ?? "",
            strMeasure8: strMeasure8 ?? "",
            strMeasure9: strMeasure9 ?? "",
            strMeasure10: strMeasure10 ?? "",
            strMeasure11: strMeasure11 ?? "",
            strMeasure12: strMeasure12 ?? "",
            strMeasure13: strMeasure13 ?? "",
            strMeasure14: strMeasure14 ?? "",
            strMeasure15: strMeasure15 ?? "",
            strMeasure16: strMeasure16 ?? "",
            strMeasure17: strMeasure17 ?? "",
            strMeasure18: strMeasure18 ?? "",
            strMeasure19: strMeasure19 ?? "",
            strMeasure20: strMeasure20 ?? "",
            fromMeal: false,
            fromIngredient: false,
            fromArea: false,
            fromCategory: true
            
            
        )
    }
    
}

