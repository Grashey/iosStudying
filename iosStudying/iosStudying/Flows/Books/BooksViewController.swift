//
//  BooksViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 31.05.2021.
//

import UIKit

struct BooksViewModel {
    let name: String
}

class BooksViewController: UIViewController {

    var presenter: BooksPresenter?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        return tableView
    }()

    var onFinishFlow: (() -> Void)?
    var onChapters: ((String, String) -> Void)?

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = R.string.localizible.booksViewControllerTitle()
        configureExitButton()
        presenter?.getData()
    }

    func configureExitButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: R.string.localizible.logoutButtonTitle(),
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(presenter?.finishFlow))
    }
}

extension BooksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.viewModels.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()),
              let books = presenter?.viewModels else { return UITableViewCell() }
        cell.textLabel?.text = books[indexPath.row].name
        return cell
    }
}

extension BooksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let book  = presenter?.viewModels[indexPath.row], let bookID = presenter?.getBookIDForChapters(index: indexPath.row) {
            onChapters?(bookID, book.name)
        }
    }
}
