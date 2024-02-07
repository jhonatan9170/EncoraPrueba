//
//  DetailViewController.swift
//  EncoraPrueba
//
//  Created by Whiz on 6/02/24.
//

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
        presenter?.getDetail()
        self.navigationController?.navigationBar.topItem?.title = " "
    }
}
extension DetailViewController: DetailViewProtocol{
    func updateView() {
        titleLabel.text = presenter?.post?.title
        bodyLabel.text = presenter?.post?.subtitle
        IDLabel.text = String(presenter?.post?.id ?? 0)
    }
    
}
