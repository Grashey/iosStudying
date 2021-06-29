//
//  MoviesViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import UIKit

enum MovieCells: Int, CaseIterable {
    case info
    case quotes
}

struct MovieHeaderViewModel {
    let name: String
}

struct MovieInfoViewModel {
    let runtime, budget, awardNominations, awardWins: Int
    let revenue, score: Double
}

class MoviesViewController: UIViewController {

    var presenter: MoviesPresenter?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.description())
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Constants.tableViewRowHeight
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets(top: .zero, left: Constants.edgeInset, bottom: .zero, right: Constants.edgeInset)
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
}

extension MoviesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == MovieCells.quotes.rawValue, let movieID = presenter?.getBookID(index: indexPath.section) {
            onQuotes?(movieID)
        }
    }
}

extension MoviesViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.headerViewModels.count ?? .zero
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.headerViewModels[section].name
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieCells.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == MovieCells.info.rawValue {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.description(), for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
            if let movie = presenter?.infoViewModels[indexPath.section] {
                cell.configure(with: movie)
                cell.isUserInteractionEnabled = false
            }
            return cell
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()) {
                cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 14)
                cell.textLabel?.textAlignment = .center
                cell.textLabel?.textColor = .systemBlue
                cell.textLabel?.text = R.string.localizible.movieViewCellShowQuotesTitle()
                return cell
            }
        }
        return UITableViewCell()
    }
}
