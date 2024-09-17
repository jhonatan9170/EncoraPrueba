import UIKit

class HomeInteractor: HomeInteractorInputProtocol {
    
    weak var presenter: HomeInteractorOutputProtocol?
    var countriesService: CountriesServiceProtocol = CountriesService()
    
    func loadCountries() {
        countriesService.fetchAllCountries { [weak self] countries in
            if let countries = countries {
                self?.presenter?.countryListDidFetch(countries: countries)
            } else {
                self?.presenter?.countryListFailed(error: "No se pudieron cargar los países")
            }
        }
    }
    
}
