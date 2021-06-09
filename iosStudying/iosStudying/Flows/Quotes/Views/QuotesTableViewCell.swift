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
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        configureContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with text: String) {
        quoteLabel.text = text.trimmingCharacters(in: .whitespaces)
        quoteLabel.bounds.size.height = heightForView(text: text)
    }
    
    private func configureContent() {
        self.addSubview(quoteLabel)
        
        NSLayoutConstraint.activate([
            quoteLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            quoteLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            quoteLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -20)
        ])
    }
    
    private func heightForView(text:String) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = quoteLabel.font
        label.text = quoteLabel.text
        label.sizeToFit()
        return label.frame.height
   }
}
