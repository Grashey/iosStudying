//
//  QuotesViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import UIKit

enum Constants {
    static let tableViewRowHeight: CGFloat = 44
    static let edgeInset: CGFloat = 10
    static let indexInset = 10
}

protocol QuotesViewControllerProtocol {

    var bookID: String? { get set }

    func reloadData()
    func refreshQuotes(_ sender: Any)
    func showEmptyQuotesLabel()
}

class QuotesViewController: UIViewController, QuotesViewControllerProtocol {

    var presenter: QuotesPresenterProtocol?
    var bookID: String?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshQuotes), for: .valueChanged)
        tableView.register(QuoteTableViewCell.self, forCellReuseIdentifier: QuoteTableViewCell.description())
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Constants.tableViewRowHeight
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: .zero, left: Constants.edgeInset, bottom: .zero, right: Constants.edgeInset)
        return tableView
    }()

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = R.string.localizible.quotesViewControllerTitle()
        presenter?.loadNext()
    }

    func reloadData() {
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }

    @objc func refreshQuotes(_ sender: Any) {
        presenter?.removeAll()
        reloadData()
        presenter?.loadNext()
    }

    func showEmptyQuotesLabel() {
        let label = UILabel()
        label.backgroundColor = view.backgroundColor
        label.textAlignment = .center
        label.text = R.string.localizible.quotesEmptyQuotesLabel()
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.center.equalToSuperview()
        }
    }
}

extension QuotesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.viewModels.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.description(), for: indexPath) as? QuoteTableViewCell else { return UITableViewCell() }
        if let model = presenter?.viewModels[indexPath.row] {
            cell.configure(with: model)
        }
        return cell
    }
}

extension QuotesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = presenter?.viewModels.count ?? .zero
        if count - Constants.indexInset < indexPath.row {
            presenter?.loadNext()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.operateFavorite(index: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
