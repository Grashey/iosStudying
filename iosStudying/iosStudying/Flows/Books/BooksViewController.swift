//
//  BooksViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 31.05.2021.
//

import UIKit

class BooksViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        return tableView
    }()

    var books: BookResponse?
    let service = BookService()
    var onFinishFlow: (() -> Void)?
    var onChapters: ((String, String) -> Void)?

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = R.string.localizible.booksViewControllerTitle()
        configureExitButton()
        getData()
    }

    func getData() {
        service.fetchBooks { result in
            switch result {
            case .success(let books):
                self.books = books
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    func configureExitButton() {
        let barButton = UIBarButtonItem(title: R.string.localizible.logoutButtonTitle(),
                                        style: .plain,
                                        target: self,
                                        action: #selector(isLogoutButtonPressed))
        self.navigationItem.leftBarButtonItem = barButton
    }

    @objc private func isLogoutButtonPressed() {
        UserDefaults.standard.set(false, forKey: PublicConstants.authKey)
        onFinishFlow?()
    }
}

extension BooksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.docs.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()),
              let book = books else { return UITableViewCell() }
        cell.textLabel?.text = book.docs[indexPath.row].name
        return cell
    }
}

extension BooksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let book  = books?.docs[indexPath.row] {
            onChapters?(book.identifier, book.name)
        }
    }
}
