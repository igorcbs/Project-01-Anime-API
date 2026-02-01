//
//  ComponentCellView.swift
//  Project 1
//
//  Created by Igor de Castro on 17/07/25.
//

import UIKit

final class ComponentCellView: UIView {
    let contentCellView = ContentCellView()
    
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
        addSubview(contentCellView)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            contentCellView.topAnchor.constraint(equalTo: topAnchor),
            contentCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentCellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentCellView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func render() {
        contentCellView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension ComponentCellView {
    func setupView(_ model: SearchedModel) {
        contentCellView.setCellInformation(model)
    }
}
