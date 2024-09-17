import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    @IBOutlet private weak var IDLabel: UILabel!
    
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
        bodyLabel.text = country.capital?.first ?? "No Capital"
        IDLabel.text = country.region
    }
}
