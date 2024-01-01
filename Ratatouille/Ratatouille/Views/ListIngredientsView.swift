

import SwiftUI
import CoreData
struct ListIngredientsView: View {
    
    var idMeal: String
    var strMeal: String
    var strMealThumb: Image
    
    init(idMeal: String, strMeal: String, strMealThumb: Image) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb
    }
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ingredient.entity(), sortDescriptors: []) var ingredients: FetchedResults<Ingredient>
    var body: some View {
        
        
        
        
        List {
            ForEach(ingredients, id: \.idMeal) { meal in
                
                
                
                if let convertedIngredientMeal = meal.toIngredient() {
                    NavigationLink(destination: EditIngredientsView(meal: convertedIngredientMeal, mealID: convertedIngredientMeal.idMeal)) {
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
                        Text(convertedIngredientMeal.strMeal)
                        
                    }
                    
                } else {
                    Text("Ukjent måltid")
                }
            }
            
            
            
            
            
        }
        
        
    }
}

//struct ListIngredientsView_Previews: PreviewProvider {
//    static var previews: some View {
//     
//
//        ListIngredientsView(idMeal: "2", strMeal: "sas", strMealThumb: Image(systemName:"square.and.arrow.up"))
//            
//    
//    }
//}
