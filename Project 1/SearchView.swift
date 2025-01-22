//
//  SearchView.swift
//  Project 1
//
//  Created by Igor de Castro on 05/12/24.
//

import UIKit
/*
 1- primeiro fazer usando textfield para fazer requests a partir do botão
 2- assim que der certo mudar para searchBar e fazer requests com base no que foi digitado
*/
final class SearchView: UIView {

    private let textField = UITextField()
    private let searchButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView: ViewCode {
    func addViews() {
        addSubview(textField)
        addSubview(searchButton)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            textField.heightAnchor.constraint(equalToConstant: 48),

            searchButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 24),
            searchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            searchButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func render() {
        textField.placeholder = "Digite aqui..."
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clearButtonMode = .whileEditing
        
        searchButton.setTitle("Buscar", for: .normal)
        searchButton.titleLabel?.textColor = .white
        searchButton.backgroundColor = UIColor.black
        searchButton.translatesAutoresizingMaskIntoConstraints = false
    }
}
