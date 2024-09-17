import UIKit

class DetailInteractor: DetailInteractorInputProtocol {
    var countryName: String?
    weak var presenter: DetailInteractorOutputProtocol?
    var countriesService: CountriesServiceProtocol = CountriesService()
    
    func fetchCountryDetail() {
        guard let name = countryName else {
            presenter?.countryDetailFetchFailed(error: "No se proporcionó el nombre del país.")
            return
        }
        countriesService.searchCountryByName(name) { [weak self] result in
            guard let self = self else { return }
            if let countries = result, let country = countries.first {
                self.presenter?.didFetchCountryDetail(country: country)
            } else {
                self.presenter?.countryDetailFetchFailed(error: "No se encontró información detallada del país.")
            }
        }
    }
}
