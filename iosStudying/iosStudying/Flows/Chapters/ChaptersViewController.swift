//
//  ChaptersViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 02.06.2021.
//

import UIKit

class ChaptersViewController: UIViewController {

    var bookID: String
    var presenter: ChaptersPresenter?

    let tableView = UITableView()

    override func loadView() {
        view = tableView
    }

    init(bookID: String) {
        self.bookID = bookID
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        tableView.allowsSelection = false

        presenter?.getData()
    }
}

extension ChaptersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.chapters?.docs.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()),
              let chapters = presenter?.chapters else { return UITableViewCell() }
        cell.textLabel?.text = "\(indexPath.row + 1). " + chapters.docs[indexPath.row].chapterName
        return cell
    }
}
