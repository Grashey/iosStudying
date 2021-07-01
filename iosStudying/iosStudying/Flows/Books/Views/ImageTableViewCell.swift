//
//  ImageTableViewCell.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 30.06.2021.
//

import UIKit
import SnapKit

class ImageTableViewCell: UITableViewCell {

    lazy var image = UIImageView()
    let height: CGFloat = 100
    var scale = CGFloat()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: ImageViewModel) {
        image.image = model.image
        scale = ceil(model.image.size.height / model.image.size.width)
    }

    private func addSubviews() {
        contentView.addSubview(image)
    }

    private func addConstraints() {
        image.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(Constants.edgeInset)
            $0.height.equalTo(height)
            $0.width.equalTo(height).multipliedBy(scale)
        }
    }
}
