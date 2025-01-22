//
//  View.swift
//  Project 1
//
//  Created by Igor de Castro on 05/12/24.
//

import UIKit

final class View: UIView {
    private let searchView = SearchView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension View: ViewCode {
    func addViews() {
        addSubview(searchView)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            searchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            searchView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func render() {
        searchView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .darkGray
    }
}
