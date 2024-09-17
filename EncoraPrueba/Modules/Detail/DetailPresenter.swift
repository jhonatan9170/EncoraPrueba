import UIKit

class DetailPresenter {
    
    weak private var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    private let router: DetailWireframeProtocol
    var country: CountryModel?
    
    init(interface: DetailViewProtocol, interactor: DetailInteractorInputProtocol?, router: DetailWireframeProtocol, countryName: String) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.interactor?.countryName = countryName
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    func getCountryDetail() {
        interactor?.fetchCountryDetail()
    }
    
    func didFetchCountryDetail(country: CountryModel) {
        self.country = country
        print("Country to display: \(country.name.common)") 
        view?.showCountryDetail()
    }

    func countryDetailFetchFailed(error: String) {
        router.showAlertWith(message: error)
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {

}
