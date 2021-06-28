//
//  MovieTableViewCell.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {

    enum Constants {
        static let edgeInset: CGFloat = 10
    }

    let boldFont = UIFont.boldSystemFont(ofSize: 16)
    let regularFont = UIFont.systemFont(ofSize: 14)

    lazy var runtimeLabel: UILabel = {
       let label = UILabel()
        label.text = R.string.localizible.movieViewCellRuntimeLabel()
        label.font = regularFont
        return label
    }()

    lazy var runtimeTitleLabel: UILabel = {
       let label = UILabel()
        label.font = boldFont
        return label
    }()

    lazy var budgetLabel: UILabel = {
       let label = UILabel()
        label.text = R.string.localizible.movieViewCellBudgetLabel()
        label.font = regularFont
        return label
    }()

    lazy var budgetTitleLabel: UILabel = {
       let label = UILabel()
        label.font = boldFont
        return label
    }()

    lazy var revenueLabel: UILabel = {
       let label = UILabel()
        label.text = R.string.localizible.movieViewCellRevenueLabel()
        label.font = regularFont
        return label
    }()

    lazy var revenueTitleLabel: UILabel = {
       let label = UILabel()
        label.font = boldFont
        return label
    }()

    lazy var awardNominationsLabel: UILabel = {
       let label = UILabel()
        label.text = R.string.localizible.movieViewCellAwardNominationsLabel()
        label.font = regularFont
        return label
    }()

    lazy var awardNominationsTitleLabel: UILabel = {
       let label = UILabel()
        label.font = boldFont
        return label
    }()

    lazy var awardWinsLabel: UILabel = {
       let label = UILabel()
        label.text = R.string.localizible.movieViewCellAwardWinsLabel()
        label.font = regularFont
        return label
    }()

    lazy var awardWinsTitleLabel: UILabel = {
       let label = UILabel()
        label.font = boldFont
        return label
    }()

    lazy var scoreLabel: UILabel = {
       let label = UILabel()
        label.text = R.string.localizible.movieViewCellScoreLabel()
        label.font = regularFont
        return label
    }()

    lazy var scoreTitleLabel: UILabel = {
       let label = UILabel()
        label.font = boldFont
        return label
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = Constants.edgeInset
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: MovieDoc) {
        runtimeTitleLabel.text = String(model.runtimeInMinutes)
        budgetTitleLabel.text = String(model.budgetInMillions)
        revenueTitleLabel.text = String(model.boxOfficeRevenueInMillions)
        awardNominationsTitleLabel.text = String(model.academyAwardNominations)
        awardWinsTitleLabel.text = String(model.academyAwardWINS)
        scoreTitleLabel.text = String(model.rottenTomatoesScore)
    }

    private func addSubviews() {
        let array = [[runtimeLabel, budgetLabel, revenueLabel, awardNominationsLabel, awardWinsLabel, scoreLabel], [runtimeTitleLabel, budgetTitleLabel, revenueTitleLabel, awardNominationsTitleLabel, awardWinsTitleLabel, scoreTitleLabel]]

        fillStackView(from: array)
        contentView.addSubview(stackView)
    }

    private func addConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Constants.edgeInset)
        }
    }

    private func fillStackView(from array: [[UILabel]]) {
        let horiizontalStackView = UIStackView()
        horiizontalStackView.axis = .horizontal
        horiizontalStackView.spacing = Constants.edgeInset
        horiizontalStackView.addArrangedSubview(array.first!.first!)
        horiizontalStackView.addArrangedSubview(array.last!.first!)
        stackView.addArrangedSubview(horiizontalStackView)

        let newArray = array.map { Array($0.dropFirst()) }
        guard let firstArray = newArray.first else { return }
        if !firstArray.isEmpty {
            fillStackView(from: newArray)
        }
    }
}
