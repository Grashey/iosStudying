//
//  MoviesViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import UIKit

struct MovieInfoViewModel {
    let name: String
    let runtime, budget, awardNominations, awardWins: Int
    let revenue, score: Double
}

class MoviesViewController: UIViewController {

    var presenter: MoviesPresenter?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.description())
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Constants.tableViewRowHeight
        tableView.separatorStyle = .none
        return tableView
    }()

    var onQuotes: ((String) -> Void)?

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localizible.moviesViewControllerTitle()
        presenter?.getData()
    }

    @objc func showQuotes(sender: UIButton) {
        if let bookID = presenter?.getBookID(index: sender.tag) {
            onQuotes?(bookID)
        }
    }
}

extension MoviesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.infoViewModels.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.description(), for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        if let movie = presenter?.infoViewModels[indexPath.section] {
            cell.configure(with: movie)
            cell.quotesButton.tag = indexPath.row
            cell.quotesButton.addTarget(self, action: #selector(showQuotes(sender:)), for: .touchUpInside)
        }
        return cell
    }
}
