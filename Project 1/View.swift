//
//  View.swift
//  Project 1
//
//  Created by Igor de Castro on 05/12/24.
//

import UIKit

final class View: UIView {
    weak var searchDelegate: SearchBarProtocol? {
        didSet {
            searchView.protocolo = searchDelegate
        }
    }
    private let searchView = SearchView()
    private let tableView = TableViewComponent()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getContentResponse(_ response: [SearchedModel]) {
        tableView.getContentSearched(response)
    }
}

extension View: ViewCode {
    func addViews() {
        addSubview(stackView)
        stackView.arrangedViews([
            searchView,
            tableView
        ])
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
    func render() {
        backgroundColor = .darkGray
    }
}
