//
//  BooksTableViewCell.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 30.06.2021.
//

import UIKit
import SnapKit

class BooksTableViewCell: UITableViewCell {

    lazy var label: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: BooksViewModel) {
        label.text = model.name
    }

    private func addSubviews() {
        contentView.addSubview(label)
    }

    private func addConstraints() {
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Constants.edgeInset)
        }
    }
}
