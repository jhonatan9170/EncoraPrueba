import Foundation

//MARK: Presenter -> Router
protocol HomeWireframeProtocol: AnyObject {
    func showAlertWith(message: String)
    func goToDetailView(country: CountryModel)
}

//MARK: View -> Presenter
protocol HomePresenterProtocol: AnyObject {
    var countriesToShow: [CountryModel] { get set }
    func getCountries()
    func filterCountriesByName(text: String)
    func clearFilter()
    func countryForCellAtIndex(_ index: Int) -> CountryModel
    func goToDetailView(withIndex index: Int)
}

//MARK: Interactor -> Presenter
protocol HomeInteractorOutputProtocol: AnyObject {
    func countryListDidFetch(countries: [CountryModel])
    func countryListFailed(error: String)
}

//MARK: Presenter -> Interactor
protocol HomeInteractorInputProtocol: AnyObject {
    func loadCountries()
}

//MARK: Presenter -> View
protocol HomeViewProtocol: AnyObject {
    func showCountries()
}
