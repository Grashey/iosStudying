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
        contentView.addSubview(runtimeLabel)
        contentView.addSubview(runtimeTitleLabel)
        contentView.addSubview(budgetLabel)
        contentView.addSubview(budgetTitleLabel)
        contentView.addSubview(revenueLabel)
        contentView.addSubview(revenueTitleLabel)
        contentView.addSubview(awardNominationsLabel)
        contentView.addSubview(awardNominationsTitleLabel)
        contentView.addSubview(awardWinsLabel)
        contentView.addSubview(awardWinsTitleLabel)
        contentView.addSubview(scoreLabel)
        contentView.addSubview(scoreTitleLabel)
    }

    private func addConstraints() {

        let firstLabelsArray = [runtimeLabel, budgetLabel, revenueLabel, awardNominationsLabel, awardWinsLabel, scoreLabel]
        let secondLabelsArray = [runtimeTitleLabel, budgetTitleLabel, revenueTitleLabel, awardNominationsTitleLabel, awardWinsTitleLabel, scoreTitleLabel]

        runtimeLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(Constants.edgeInset)
        }

        runtimeTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Constants.edgeInset)
            $0.leading.equalTo(runtimeLabel.snp.trailing).offset(Constants.edgeInset)
        }

        for index in 1..<firstLabelsArray.count {
            firstLabelsArray[index].snp.makeConstraints {
                $0.top.equalTo(firstLabelsArray[index - 1].snp.bottom).offset(Constants.edgeInset)
                $0.leading.equalToSuperview().inset(Constants.edgeInset)
            }
            secondLabelsArray[index].snp.makeConstraints {
                $0.centerY.equalTo(firstLabelsArray[index].snp.centerY)
                $0.leading.equalTo(firstLabelsArray[index].snp.trailing).offset(Constants.edgeInset)
            }
        }

        scoreLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(Constants.edgeInset)
        }
    }
}
