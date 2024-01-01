import Foundation

struct SearchFunctions {
    static func searchForFood(searchText: String, completion: @escaping ([Meal]?, Error?) -> Void) {
        guard !searchText.isEmpty else {
            print("Item not found")
            return
        }
        
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(searchText)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(MealResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(response.meals, nil)
                        }
                    } catch {
                        print("")
                        completion(nil, error)
                    }
                }
            }
            .resume()
        } else {
            print("Invalid URL")
        }
    }
    
    static func searchForFoodBasedOnIngredient(searchTextForIngredient: String, completion: @escaping ([Meal]?, Error?) -> Void) {
        guard !searchTextForIngredient.isEmpty else {
            print("Item not found")
            return
        }
        
        let filterUrlString = "https://www.themealdb.com/api/json/v1/1/filter.php?i=\(searchTextForIngredient)"
        
        if let filterUrl = URL(string: filterUrlString) {
            let session = URLSession(configuration: .default)
            session.dataTask(with: filterUrl) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(MealResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(response.meals, nil)
                        }
                    } catch {
                        print("")
                        completion(nil, error)
                    }
                }
            }
            .resume()
        } else {
            print("Invalid Filter URL")
        }
    }
    
    
    static func searchForFoodBasedOnArea(searchTextForArea: String, completion: @escaping ([Meal]?, Error?) -> Void) {
        guard !searchTextForArea.isEmpty else {
            print("Item not found")
            return
        }
        
        let filterUrlString = "https://www.themealdb.com/api/json/v1/1/filter.php?a=\(searchTextForArea)"
        
        if let filterUrl = URL(string: filterUrlString) {
            let session = URLSession(configuration: .default)
            session.dataTask(with: filterUrl) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(MealResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(response.meals, nil)
                        }
                    } catch {
                        print("")
                        completion(nil, error)
                    }
                }
            }
            .resume()
        } else {
            print("Invalid Filter URL")
        }
    }
    
    
    static func searchForFoodBasedOnCategory(searchTextForCategory: String, completion: @escaping ([Meal]?, Error?) -> Void) {
        guard !searchTextForCategory.isEmpty else {
            print("Item not found")
            return
        }
        
        let filterUrlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(searchTextForCategory)"
        if let filterUrl = URL(string: filterUrlString) {
            let session = URLSession(configuration: .default)
            session.dataTask(with: filterUrl) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(MealResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(response.meals, nil)
                        }
                    } catch {
                        print("")
                        completion(nil, error)
                    }
                }
            }
            .resume()
        } else {
            print("Invalid Filter URL")
        }
    }
}
