//
//  ChaptersViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 02.06.2021.
//

import UIKit

class ChaptersViewController: UIViewController {
    
    var bookID: String
    
    let tableView = UITableView()
    
    var chapters: ChapterResponse?
    let service = BookService()
    let router = BooksNavigationRouter()
    
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
        router.controller = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        
        getData()
    }
    
    func getData() {
        service.fetchChapters(bookID: bookID) { result in
            switch result {
            case .success(let chapters):
                self.chapters = chapters
                self.tableView.reloadData()
            case .failure(let error):
                self.router.presentAlert(error: error)
            }
        }
    }
}

extension ChaptersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapters?.docs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()),
              let chapters = chapters else { return UITableViewCell() }
        cell.textLabel?.text = chapters.docs[indexPath.row].chapterName
        return cell
    }
}
