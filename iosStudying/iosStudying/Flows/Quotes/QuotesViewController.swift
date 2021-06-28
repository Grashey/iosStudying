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

class QuotesViewController: UIViewController {

    var presenter: QuotesPresenter?
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
    }

    @objc func refreshQuotes(_ sender: Any) {
        presenter?.offset = .zero
        presenter?.quotes.removeAll()
        reloadData()
        presenter?.loadNext()
        tableView.refreshControl?.endRefreshing()
    }

    func showEmptyQuotesLabel() {
        let label = UILabel()
        label.backgroundColor = .white
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
        presenter?.quotes.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.description(), for: indexPath) as? QuoteTableViewCell else { return UITableViewCell() }
        if let model = presenter?.makeQuotesViewCellModelForIndex(index: indexPath.row) {
            cell.configure(with: model)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let quote = presenter?.quotes[indexPath.row] {
            presenter?.operateFavorite(identifier: quote.identifier)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}

extension QuotesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = presenter?.quotes.count ?? .zero
        if count - Constants.indexInset < indexPath.row {
            presenter?.loadNext()
        }
    }
}
