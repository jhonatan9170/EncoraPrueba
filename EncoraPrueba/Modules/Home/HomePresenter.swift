import UIKit

class HomePresenter {
    
    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    private let router: HomeWireframeProtocol
    
    private var _countriesToShow = [CountryModel]()
    var countries = [CountryModel]()
    
    init(interface: HomeViewProtocol, interactor: HomeInteractorInputProtocol?, router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresenterProtocol {
    
    var countriesToShow: [CountryModel] {
        get {
            return _countriesToShow
        }
        set {
            _countriesToShow = newValue
        }
    }
    
    func getCountries() {
        interactor?.loadCountries()
    }
    
    func filterCountriesByName(text: String) {
        self._countriesToShow = countries.filter { $0.name.common.lowercased().contains(text.lowercased()) }
        view?.showCountries()
    }
    
    func clearFilter() {
        _countriesToShow = countries
        view?.showCountries()
    }
    
    func countryForCellAtIndex(_ index: Int) -> CountryModel {
        return _countriesToShow[index]
    }
    
    func goToDetailView(withIndex index: Int) {
        let country = _countriesToShow[index]
        router.goToDetailView(country: country)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func countryListDidFetch(countries: [CountryModel]) {
        self.countries = countries
        _countriesToShow = countries
        view?.showCountries()
    }
    
    func countryListFailed(error: String) {
        router.showAlertWith(message: error)
    }
}
