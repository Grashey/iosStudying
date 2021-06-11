//
//  QuotesTableViewCell.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 09.06.2021.
//

import UIKit
import SnapKit

class QuotesTableViewCell: UITableViewCell {

    var quoteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var favoriteView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemYellow
        view.isHidden = true
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContent()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        favoriteView.isHidden = true
    }

    func configure(with text: String) {
        quoteLabel.text = text.trimmingCharacters(in: .whitespaces)
    }

    private func configureContent() {
        contentView.addSubview(quoteLabel)
        contentView.addSubview(favoriteView)

        favoriteView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.layoutMarginsGuide)
            make.trailing.equalTo(contentView.layoutMarginsGuide)
            make.height.equalTo(contentView.bounds.height/2)
            make.width.equalTo(contentView.bounds.height/2)
        }

        quoteLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.layoutMarginsGuide)
            make.top.equalTo(contentView.layoutMarginsGuide)
            make.bottom.equalTo(contentView.layoutMarginsGuide)
            make.right.equalTo(contentView.layoutMarginsGuide).offset(-contentView.bounds.height/2)
        }
    }
}
