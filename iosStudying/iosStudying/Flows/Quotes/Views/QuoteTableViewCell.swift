//
//  QuoteTableViewCell.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 09.06.2021.
//

import UIKit
import SnapKit

struct QuoteViewModel {
    let text: String
    var isFavorite: Bool
    let movieName: String
}

class QuoteTableViewCell: UITableViewCell {

    enum Constants {
        static let edgeInset: CGFloat = 10
        static let indicatorSize: CGFloat = 20
        static let indicatorCornerRadius = indicatorSize/2
    }

    lazy var quoteLabel: UILabel = {
       let label = UILabel()
        label.text = R.string.localizible.quotesViewCellQuoteLabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

   lazy var quoteTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var movieLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizible.quotesViewCellMovieLabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    lazy var movieTitleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    lazy var favoriteView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.indicatorCornerRadius
        view.backgroundColor = .systemYellow
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        favoriteView.isHidden = true
    }

    func configure(with model: QuoteViewModel) {
        quoteTitleLabel.text = model.text.trimmingCharacters(in: .whitespaces)
        favoriteView.isHidden = !model.isFavorite
        movieTitleLabel.text = model.movieName
    }

    private func addSubviews() {
        contentView.addSubview(quoteLabel)
        contentView.addSubview(quoteTitleLabel)
        contentView.addSubview(favoriteView)
        contentView.addSubview(movieLabel)
        contentView.addSubview(movieTitleLabel)
    }

    private func addConstraints() {
        favoriteView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(Constants.edgeInset)
            $0.size.equalTo(Constants.indicatorSize)
        }

        movieLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(Constants.edgeInset)
        }

        movieTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Constants.edgeInset)
            $0.leading.equalTo(movieLabel.snp.trailing).offset(Constants.edgeInset)
        }

        quoteLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(Constants.edgeInset)
            $0.top.equalTo(movieLabel.snp.bottom).offset(Constants.edgeInset)
            $0.bottom.equalToSuperview().inset(Constants.edgeInset)
        }

        quoteTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(quoteLabel.snp.trailing).offset(Constants.edgeInset)
            $0.top.equalTo(movieLabel.snp.bottom).offset(Constants.edgeInset)
            $0.bottom.equalToSuperview().inset(Constants.edgeInset)
            $0.trailing.equalToSuperview().inset(Constants.edgeInset*2 + Constants.indicatorSize)
        }

        quoteLabel.setContentHuggingPriority(.required, for: .horizontal)
        quoteLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
}
