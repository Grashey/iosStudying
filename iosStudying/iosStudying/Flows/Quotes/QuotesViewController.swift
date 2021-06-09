//
//  QuotesViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import UIKit

class QuotesViewController: UIViewController {
    
    var presenter: QuotesPresenter?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(QuotesTableViewCell.self, forCellReuseIdentifier: QuotesTableViewCell.description())
        return tableView
    }()
    
    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadNext()
    }
    
    func reloadData() {
        tableView.reloadData()
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
