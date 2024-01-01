

import SwiftUI

struct ListCategoriesView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Category.entity(), sortDescriptors: []) var categories: FetchedResults<Category>
    var body: some View {
        List {
            ForEach(categories, id: \.idMeal) { meal in
                
                
                
                if let convertedCategoryMeal = meal.toCategory() {
                    NavigationLink(destination: EditCategoriesView(meal: convertedCategoryMeal, mealID: convertedCategoryMeal.idMeal)) {
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
                    
                } else {
                    Text("Ukjent måltid")
                }
            }
            
            
            
            
            
        }
    }
}

//struct ListCategoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCategoriesView()
//    }
//}
