//
//  ContentCellView.swift
//  Project 1
//
//  Created by Igor de Castro on 11/08/25.
//

import UIKit

final class ContentCellView: UIView {
    private let downloadImage: DownloadImageRequest = DownloadImage()
    private let constants = Constants()
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var descriptionView = UILabel()
    var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// Auto Layout
extension ContentCellView: ViewCode {
    func addViews() {
        addSubview(mainStackView)
        mainStackView.arrangedViews([
            imageView,
            stackViewVertical
        ])
        stackViewVertical.arrangedViews([
            titleLabel,
            descriptionView
        ])
    }
    
    func buildConstraints() {
        let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: constants.imageHeight)
        heightConstraint.priority = .defaultHigh
        NSLayoutConstraint.activate([
            heightConstraint,
            imageView.widthAnchor.constraint(equalToConstant: constants.imageWidth),

            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: constants.mainStackViewAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constants.mainStackViewAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constants.mainStackViewAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constants.mainStackViewAnchor),
        ])
    }
    
    func render() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 0
        descriptionView.font = .systemFont(ofSize: 14)
        descriptionView.numberOfLines = 0
    }
}
// Download Image
extension ContentCellView {
    func setCellInformation(_ model: SearchedModel) {
        self.downloadImage.request(url: model.poster) { result in
            switch result {
            case .success(let success):
                self.imageView.image = success
                self.titleLabel.text = model.title
                self.descriptionView.text = model.year
            case .failure(let failure):
                print("deu ruim: \(failure)")
            }
        }
    }
}
