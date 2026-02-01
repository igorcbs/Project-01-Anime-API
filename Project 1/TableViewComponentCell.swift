//
//  TableViewComponentCell.swift
//  Project 1
//
//  Created by Igor de Castro on 17/07/25.
//

import UIKit

final class TableViewComponentCell: UITableViewCell {
    private let cellView = ComponentCellView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableViewComponentCell: ViewCode {
    func addViews() {
        contentView.addSubview(cellView)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func render() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension TableViewComponentCell {
    func setupCell(_ model: SearchedModel) {
        cellView.setupView(model)
    }
}
