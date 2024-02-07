
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
    @IBOutlet private weak var postsTableView: UITableView! {
        didSet {
            postsTableView.delegate = self
            postsTableView.dataSource = self
            postsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Posts" 
        showLoadingView()
        presenter?.getPosts()
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
        return presenter?.postsToShow.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell, let presenter else {
            return UITableViewCell()
        }
        let post = presenter.postForCellAtIndex(indexPath.row)
        cell.configureCell(post: post)
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
            presenter?.cleanFilter()
        } else {
            presenter?.filterByTitle(text: searchText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.cleanFilter()
    }
}

extension HomeViewController: HomeViewProtocol{
    func showPosts() {
        searchBar.isHidden = false
        self.postsTableView.reloadData()
        self.dismissLoading()
    }
}
