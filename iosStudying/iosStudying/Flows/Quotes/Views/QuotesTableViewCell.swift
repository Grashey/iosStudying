//
//  QuotesTableViewCell.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 09.06.2021.
//

import UIKit

class QuotesTableViewCell: UITableViewCell {
    
    var quoteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func layoutSubviews() {
        configureContent()
    }
    
    func configure(with text: String) {
        quoteLabel.text = text.trimmingCharacters(in: .whitespaces)
    }
        
    private func configureContent() {
        self.contentView.addSubview(quoteLabel)
        
        NSLayoutConstraint.activate([
            quoteLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            quoteLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            quoteLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            quoteLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
}
