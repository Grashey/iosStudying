//
//  QuotesViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import UIKit

enum Constants: CGFloat {
    case tableViewRowHeight = 44
}

class QuotesViewController: UIViewController {

    var presenter: QuotesPresenter?
    let router = BooksNavigationRouter()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshQuotes), for: .valueChanged)
        tableView.register(QuotesTableViewCell.self, forCellReuseIdentifier: QuotesTableViewCell.description())
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Constants.tableViewRowHeight.rawValue
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return tableView
    }()

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        router.controller = self
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
}

extension QuotesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.quotes.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuotesTableViewCell.description(), for: indexPath) as? QuotesTableViewCell else { return UITableViewCell()
        }
        if let quote = presenter?.quotes[indexPath.row] {
            cell.configure(with: quote.dialog)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath)
    }
}

extension QuotesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = presenter?.quotes.count ?? .zero
        if count - 10 < indexPath.row {
            presenter?.loadNext()
        }
    }
}
