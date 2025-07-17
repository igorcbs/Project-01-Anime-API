//
//  ComponentCellView.swift
//  Project 1
//
//  Created by Igor de Castro on 17/07/25.
//

import UIKit

final class ComponentCellView: UIView {
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var descriptionView = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(#file)
    }
}

extension ComponentCellView: ViewCode {
    func addViews() {
        addSubview(titleLabel)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func render() {
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
