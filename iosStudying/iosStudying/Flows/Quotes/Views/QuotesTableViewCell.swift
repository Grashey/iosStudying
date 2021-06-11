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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContent()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with text: String) {
        quoteLabel.text = text.trimmingCharacters(in: .whitespaces)
    }

    private func configureContent() {
        self.contentView.addSubview(quoteLabel)

        quoteLabel.snp.makeConstraints { $0.edges.equalTo(contentView.layoutMarginsGuide) }
    }
}
