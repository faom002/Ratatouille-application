import UIKit
import Foundation



func fetchFlagImage(for country: String, completion: @escaping (UIImage?) -> Void) {
    let flagsAPIBaseUrl = "https://flagsapi.com/"
    
    let countryMappings = [
        "American": "US",
        "British": "GB",
        "Canadian": "CA",
        "Chinese": "CN",
        "Croatian": "HR",
        "Dutch": "NL",
        "Egyptian": "EG",
        "Filipino": "PH",
        "French": "FR",
        "Greek": "GR",
        "Indian": "IN",
        "Irish": "IE",
        "Italian": "IT",
        "Jamaican": "JM",
        "Japanese": "JP",
        "Kenyan": "KE",
        "Malaysian": "MY",
        "Mexican": "MX",
        "Moroccan": "MA",
        "Polish": "PL",
        "Portuguese": "PT",
        "Russian": "RU",
        "Spanish": "ES",
        "Thai": "TH",
        "Tunisian": "TN",
        "Turkish": "TR",
        "Unknown": "",
        "Vietnamese": "VN"
    ]
    
    guard let countryCode = countryMappings[country] else {
        completion(nil)
        return
    }
    
    let urlString = "\(flagsAPIBaseUrl)\(countryCode)/shiny/64.png"
    
    URLSession.shared.dataTask(with: URL(string: urlString)!) { data, response, error in
        guard let data = data, error == nil else {
            completion(nil)
            return
        }
        
        let flagImage = UIImage(data: data)
        
        completion(flagImage)
    }.resume()
}

