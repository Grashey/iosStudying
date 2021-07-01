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

struct ImageViewModel {
    let image: UIImage
}

struct MusicViewModel {
    let genre: String
}

struct BooksViewControllerViewModel {
    enum Cells {
        case books([BooksViewModel])
        case images([ImageViewModel])
    }
    let sections: [Cells]
}

class BooksViewController: UIViewController {

    var presenter: BooksPresenter?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BooksTableViewCell.self, forCellReuseIdentifier: BooksTableViewCell.description())
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.description())
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

    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.viewModel?.sections.count ?? .zero
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch presenter?.viewModel?.sections[section] {
        case let .books(books): return books.count
        case let .images(images): return images.count
        case .none: return .zero
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter?.viewModel?.sections[indexPath.section] {
        case let .books(books):
            let model = books[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: BooksTableViewCell.description()) as? BooksTableViewCell {
                cell.configure(with: model)
                return cell
            }
        case let .images(images):
            let model = images[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.description()) as? ImageTableViewCell {
                cell.configure(with: model)
                return cell
            }
        case .none: break
        }
        return UITableViewCell()
    }
}

extension BooksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch presenter?.viewModel?.sections[indexPath.section] {
        case let .books(books):
            if let bookID = presenter?.getBookIDForChapters(index: indexPath.row) {
                let book  = books[indexPath.row]
                onChapters?(bookID, book.name)
            }
        case .images: break
        case .none: break
        }
    }
}
