import SwiftUI

struct EditIngredientsView: View {
    let meal: Meal
    let mealID: String
    @State private var detailedMeal: Meal?
    @Environment(\.managedObjectContext) var moc
    @State private var editIngredient: String = ""
    @State private var flagImage: UIImage?
    @FetchRequest(entity: Ingredient.entity(), sortDescriptors: []) var ingredients: FetchedResults<Ingredient>
    
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
                
                Text("Måltid navn: \(detailedMeal.strMeal)")
                    .font(.headline)
                if let category = detailedMeal.strCategory {
                    Text("kateogri:  \(category)")
                }
                if let area = detailedMeal.strArea {
                    Text("landområde: \(area)")
                    
                    if let flagImage = flagImage {
                        AsyncImage(url: URL(string: "")) { _ in
                            Image(uiImage: flagImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 80) 
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
                
                ForEach(ingredients) { ingredient in
                    HStack {
                        Text("\(ingredient.strIngredient1 ?? ""): \(ingredient.strMeasure1 ?? "")")
                        Spacer()
                        TextField("Rediger Ingrediens", text: $editIngredient)
                        Button(action: {
                            saveEditedIngredient(ingredient: ingredient)
                        }) {
                            Text("Lagre")
                        }
                    }
                    .padding()
                }
            }
            .padding()
            .onAppear {
                fetchDetailedMeal()
            }
        } else {
            ProgressView("Denter Data...")
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
    
    private func saveEditedIngredient(ingredient: Ingredient) {
        let editedIngredient = editIngredient.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !editedIngredient.isEmpty else {
            return
        }
        
        moc.perform {
            ingredient.strIngredient1 = editedIngredient
            
            do {
                try moc.save()
                print("Saved")
            } catch {
                print("Error saving managed object context: \(error)")
            }
        }
    }
}

//
//struct EditIngrdientsView_Preview: PreviewProvider {
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
//        EditIngredientsView(meal: sampleMeal, mealID: "1234")
//    }
//}
