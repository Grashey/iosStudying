//
//  BooksViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 31.05.2021.
//

import UIKit

class BooksViewController: UIViewController {

    let tableView = UITableView()
    
    var books: BookResponse?
    let service = BookService()
    let router = BooksNavigationRouter()
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = R.string.localizible.booksViewControllerTitle()
        router.controller = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        
        configureExitButton()
        getData()
    }
    
    func getData() {
        service.fetchBooks() { result in
            switch result {
            case .success(let books):
                self.books = books
                self.tableView.reloadData()
            case .failure(let error):
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: { _ in
                    self.router.toAuth()
                }))
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
        UserDefaults.standard.set(false, forKey: R.string.localizible.isAuthorized())
        let vc = UINavigationController(rootViewController: LoginViewController())
        UIApplication.shared.keyWindow?.rootViewController = vc
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
        if let id  = books?.docs[indexPath.row].id {
            router.toChapters(bookID: id)
        }
    }
}
