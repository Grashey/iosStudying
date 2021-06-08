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
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = R.string.localizible.booksViewControllerTitle()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        
        configureExitButton()
        getData()
    }
    
    func getData() {
        service.fetchBooks() {
            self.books = $0
            self.tableView.reloadData()
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
            let vc = ChaptersViewController(bookID: id)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
