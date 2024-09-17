import UIKit

//MARK: Presenter -> Router
protocol DetailWireframeProtocol: AnyObject {
    func showAlertWith(message: String)
}

//MARK: View -> Presenter
protocol DetailPresenterProtocol: AnyObject {
    var country: CountryModel? { get set }
    func getCountryDetail()
}

//MARK: Interactor -> Presenter
protocol DetailInteractorOutputProtocol: AnyObject {
    func didFetchCountryDetail(country: CountryModel)
    func countryDetailFetchFailed(error: String)
}

//MARK: Presenter -> Interactor
protocol DetailInteractorInputProtocol: AnyObject {
    var countryName: String? { get set }
    func fetchCountryDetail()
}

//MARK: Presenter -> View
protocol DetailViewProtocol: AnyObject {
    func showCountryDetail()
}
