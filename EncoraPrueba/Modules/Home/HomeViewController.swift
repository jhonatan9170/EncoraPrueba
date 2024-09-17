
import UIKit

class HomeViewController: UIViewController{
    
    var presenter: HomePresenterProtocol?
    
    @IBOutlet private weak var searchBar: UISearchBar!{
        didSet{
            searchBar.isHidden = true
            searchBar.showsSearchResultsButton = false
            searchBar.delegate = self
        }
    }
    
    @IBOutlet private weak var countriesTableView: UITableView! {
        didSet {
            countriesTableView.delegate = self
            countriesTableView.dataSource = self
            countriesTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Countries"
        showLoadingView()
        presenter?.getCountries()
    }

    
    init(){
        super.init(nibName: "HomeView", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UITableViewDelegate ,UITableViewDataSource
extension HomeViewController: UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.countriesToShow.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell, let presenter else {
            return UITableViewCell()
        }
        let country = presenter.countryForCellAtIndex(indexPath.row)
        cell.configureCell(post: country)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.goToDetailView(withIndex: indexPath.row)
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            presenter?.clearFilter()
        } else {
            presenter?.filterCountriesByName(text: searchText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.clearFilter()
    }
}

// MARK: - HomeViewProtocol
extension HomeViewController: HomeViewProtocol{
    func showCountries() {
        searchBar.isHidden = false
        self.countriesTableView.reloadData()
        self.dismissLoading()
    }
}
