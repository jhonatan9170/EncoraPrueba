import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var officialNameLabel: UILabel!
    @IBOutlet private weak var capitalLabel: UILabel!
    @IBOutlet private weak var regionLabel: UILabel!
    @IBOutlet private weak var populationLabel: UILabel!
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var flagImageView: UIImageView!
    
    var presenter: DetailPresenterProtocol?

    init() {
        super.init(nibName: "DetailViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationMultilineTitle()
        presenter?.getCountryDetail()
        self.navigationController?.navigationBar.topItem?.title = " "
    }
}
extension DetailViewController: DetailViewProtocol{
    
    func showCountryDetail() {
        guard let country = presenter?.country else { return }
        titleLabel.text = country.name.common
        officialNameLabel.text = "Nombre Oficial: \(country.name.official)"
        capitalLabel.text = "Capital: \(country.capital?.first ?? "N/A")"
        regionLabel.text = "Región: \(country.region)"
        populationLabel.text = "Población: \(country.population.formattedWithSeparator())"
        currencyLabel.text = "Moneda: \(country.currencies?.values.first?.name ?? "N/A") (\(country.currencies?.values.first?.symbol ?? ""))"
        if let flagURL = country.flags.png, let url = URL(string: flagURL) {
            flagImageView.loadImage(from: url)
        }
    }
}
