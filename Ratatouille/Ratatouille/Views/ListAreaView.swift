

import SwiftUI

struct ListAreasView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Area.entity(), sortDescriptors: []) var area: FetchedResults<Area>
    var body: some View {
        List {
            ForEach(area, id: \.idMeal) { meal in
                
                
                
                if let convertedAreaMeal = meal.toArea() {
                    NavigationLink(destination: EditAreasView(meal: convertedAreaMeal, mealID: convertedAreaMeal.idMeal)) {
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
                    
                } else {
                    Text("Ukjent måltid")
                }
            }
            
            
            
            
            
        }
    }
}

//struct ListAreasView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCategoriesView()
//    }
//}
