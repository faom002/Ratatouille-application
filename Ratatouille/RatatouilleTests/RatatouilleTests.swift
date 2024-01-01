import XCTest
@testable import Ratatouille

class RatatouilleTests: XCTestCase {
    
    
    func testSearchForFood() {
        let expectation = XCTestExpectation(description: "Search for food")
        
        SearchFunctions.searchForFood(searchText: "Pasta") { (meals, error) in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(meals, "Meals should not be nil")
            
            if let meals = meals {
                print("Search for Food Results:")
                for meal in meals {
                    print(meal.strMeal)
                }
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testSearchForFoodBasedOnIngredient() {
        let expectation = XCTestExpectation(description: "Search for food based on ingredient")
        
        SearchFunctions.searchForFoodBasedOnIngredient(searchTextForIngredient: "Chicken") { (meals, error) in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(meals, "Meals should not be nil")
            
            if let meals = meals {
                print("Search for Food Based on Ingredient Results:")
                for meal in meals {
                    print(meal.strMeal)
                }
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testSearchForFoodBasedOnArea() {
        let expectation = XCTestExpectation(description: "Search for food based on area")
        
        SearchFunctions.searchForFoodBasedOnArea(searchTextForArea: "Italian") { (meals, error) in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(meals, "Meals should not be nil")
            
            if let meals = meals {
                print("Search for Food Based on Area Results:")
                for meal in meals {
                    print(meal.strMeal)
                }
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testSearchForFoodBasedOnCategory() {
        let expectation = XCTestExpectation(description: "Search for food based on category")
        
        SearchFunctions.searchForFoodBasedOnCategory(searchTextForCategory: "Seafood") { (meals, error) in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(meals, "Meals should not be nil")
            
            if let meals = meals {
                print("Search for Food Based on Category Results:")
                for meal in meals {
                    print(meal.strMeal)
                }
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    
    
}
