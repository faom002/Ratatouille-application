import SwiftUI

struct MealDetailView: View {
    let meal: Meal
    let mealID: String
    @State private var detailedMeal: Meal?
    @State private var flagImage: UIImage?
    
    var body: some View {
        if let detailedMeal = detailedMeal {
            ScrollView {
                if let urlString = detailedMeal.strMealThumb, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(height: 200)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Text("Måltid Navn: \(detailedMeal.strMeal)")
                    .font(.headline)
                if let category = detailedMeal.strCategory {
                    Text("Kategori: \(category)")
                }
                if let area = detailedMeal.strArea {
                    Text("landområder: \(area)")
                    
                    
                    if let flagImage = flagImage {
                        AsyncImage(url: URL(string: "")) { _ in
                            Image(uiImage: flagImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 50)
                        }
                        .onAppear {
                            fetchFlagImage(for: area) { fetchedFlagImage in
                                self.flagImage = fetchedFlagImage
                            }
                        }
                    } else {
                        ProgressView()
                    }
                }
                if let instructions = detailedMeal.strInstructions {
                    Text("Instruksjoner: \(instructions)")
                }
                Text("Ingredienser:")
                
                ForEach(1...20, id: \.self) { index in
                    if let ingredient = getIngredient(meal: detailedMeal, index: index),
                       let measure = getMeasure(meal: detailedMeal, index: index) {
                        Text("\(ingredient): \(measure)")
                    }
                }
            }
            .padding()
            .onAppear {
                fetchDetailedMeal()
            }
        } else {
            ProgressView("Henter Data...")
                .onAppear {
                    fetchDetailedMeal()
                }
        }
    }
    
    private func fetchDetailedMeal() {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(MealResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.detailedMeal = response.meals.first
                            if let area = self.detailedMeal?.strArea {
                                fetchFlagImage(for: area) { fetchedFlagImage in
                                    self.flagImage = fetchedFlagImage
                                }
                            }
                        }
                    } catch {
                        print("Error decoding detailed API response: \(error)")
                    }
                }
            }
            .resume()
        } else {
            print("Invalid URL for detailed meal information")
        }
    }
    
    private func getIngredient(meal: Meal, index: Int) -> String? {
        switch index {
        case 1: return meal.strIngredient1
        case 2: return meal.strIngredient2
        case 3: return meal.strIngredient3
        case 4: return meal.strIngredient4
        case 5: return meal.strIngredient5
        case 6: return meal.strIngredient6
        case 7: return meal.strIngredient7
        case 8: return meal.strIngredient8
        case 9: return meal.strIngredient9
        case 10: return meal.strIngredient10
        case 11: return meal.strIngredient11
        case 12: return meal.strIngredient12
        case 13: return meal.strIngredient13
        case 14: return meal.strIngredient14
        case 15: return meal.strIngredient15
        case 16: return meal.strIngredient16
        case 17: return meal.strIngredient17
        case 18: return meal.strIngredient18
        case 19: return meal.strIngredient19
        case 20: return meal.strIngredient20
        default: return nil
        }
    }
    
    private func getMeasure(meal: Meal, index: Int) -> String? {
        switch index {
        case 1: return meal.strMeasure1
        case 2: return meal.strMeasure2
        case 3: return meal.strMeasure3
        case 4: return meal.strMeasure4
        case 5: return meal.strMeasure5
        case 6: return meal.strMeasure6
        case 7: return meal.strMeasure7
        case 8: return meal.strMeasure8
        case 9: return meal.strMeasure9
        case 10: return meal.strMeasure10
        case 11: return meal.strMeasure11
        case 12: return meal.strMeasure12
        case 13: return meal.strMeasure13
        case 14: return meal.strMeasure14
        case 15: return meal.strMeasure15
        case 16: return meal.strMeasure16
        case 17: return meal.strMeasure17
        case 18: return meal.strMeasure18
        case 19: return meal.strMeasure19
        case 20: return meal.strMeasure20
        default: return nil
        }
    }
}

//
//struct MealDetailView_Preview: PreviewProvider {
//    static var previews: some View {
//
//        let sampleMeal = Meal(
//            idMeal: "1",
//            strMeal: "Sample Meal",
//            strCategory: "Sample Category",
//            strArea: "Sample Area",
//            strInstructions: "Sample Instructions",
//            strMealThumb: "sdad",
//            strTags: "ASDasd",
//            strYoutube: "Sadasd",
//            strIngredient1: "Ingredient 1",
//            strIngredient2: "sasasas",
//            strIngredient3: "sasas",
//            strIngredient4: "sasa",
//            strIngredient5: "sasas",
//            strIngredient6: "sdasd",
//            strIngredient7: "Sdadas",
//            strIngredient8: "dada",
//            strIngredient9: "dsadas",
//            strIngredient10: "dsad",
//            strIngredient11: "Sadasd",
//            strIngredient12: "Sadasd",
//            strIngredient13: "sadas",
//            strIngredient14: "dsada",
//            strIngredient15: "Sadas",
//            strIngredient16: "sadas",
//            strIngredient17: "sdasd",
//            strIngredient18: "dsasd",
//            strIngredient19: "adsasd",
//            strIngredient20: "adsa",
//            strMeasure1: "Measure 1",
//            strMeasure2: "asdas",
//            strMeasure3: "dasdas",
//            strMeasure4: "dasd",
//            strMeasure5: "Sdad",
//            strMeasure6: "ASdasd",
//            strMeasure7: "adsa",
//            strMeasure8: "ASDasd",
//            strMeasure9: "ADSasd",
//            strMeasure10: "DSAd",
//            strMeasure11: "ADS",
//            strMeasure12: "ASD",
//            strMeasure13: "DSAas",
//            strMeasure14: "ADSas",
//            strMeasure15: "ADS",
//            strMeasure16: "ASDasd",
//            strMeasure17: "dsadas",
//            strMeasure18: "SDad",
//            strMeasure19: "ASDas",
//            strMeasure20: "ASDas",
//            fromMeal: true,
//            fromIngredient: false,
//            fromArea: false,
//            fromCategory: false
//        )
//
//
//        MealDetailView(meal: sampleMeal, mealID: "1234")
//    }
//}




