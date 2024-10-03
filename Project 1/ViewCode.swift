//
//  ViewCode.swift
//  Project 1
//
//  Created by Igor de Castro on 30/09/24.
//

protocol ViewCode {
    func addViews()
    func buildConstraints()
    func render()
    func setupView()
}

extension ViewCode {
    func setupView() {
        addViews()
        buildConstraints()
        render()
    }
}
