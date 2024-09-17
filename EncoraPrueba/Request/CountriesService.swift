import Foundation
import Alamofire

protocol CountriesServiceProtocol {
    func fetchAllCountries(completion: @escaping ([CountryModel]?) -> Void)
    func searchCountryByName(_ name: String, completion: @escaping ([CountryModel]?) -> Void)
}

class CountriesService: RequestManager {
}

extension CountriesService: CountriesServiceProtocol {
    
    func fetchAllCountries(completion: @escaping ([CountryModel]?) -> Void) {
        let endpoint = Constants.allCountriesURL
        makeRequest(.get, model: [CountryModel].self, endpoint: endpoint, successRequest: { response in
            completion(response)
        }) { _ in
            completion(nil)
        }
    }
    
    func searchCountryByName(_ name: String, completion: @escaping ([CountryModel]?) -> Void) {
        let endpoint = Constants.searchCountryByNameURL + name
        makeRequest(.get, model: [CountryModel].self, endpoint: endpoint, successRequest: { response in
            completion(response)
        }) { _ in
            completion(nil)
        }
    }
}
