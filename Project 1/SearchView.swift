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
    weak var searchBarDelegate: SearchBarProtocol?

    private let textField = UITextField()
    private let searchButton = UIButton()
    private var textToSearch = String()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
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
}

extension SearchView: ViewCode {
    func addViews() {
        addSubview(stackView)
        stackView.arrangedViews([
            textField,
            searchButton
        ])
    }

    func buildConstraints() {
        let stackViewBottomConstraint = stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        stackViewBottomConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            stackViewBottomConstraint,
            textField.heightAnchor.constraint(equalToConstant: 48),
            searchButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    func render() {
        textField.placeholder = "Digite aqui..."
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        
        searchButton.setTitle("Buscar", for: .normal)
        searchButton.titleLabel?.textColor = .white
        searchButton.backgroundColor = UIColor.black
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
    }
}

extension SearchView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            let newText = text.replacingCharacters(in: range, with: string)
            textToSearch = newText
        }
        return true
    }
}

extension SearchView {
    @objc
    func didClickButton() {
        searchBarDelegate?.getSearched(textToSearch)
    }
}
