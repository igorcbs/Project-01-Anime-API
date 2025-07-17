//
//  UIStackView+Extension.swift
//  Project 1
//
//  Created by Igor de Castro on 17/07/25.
//

import UIKit

extension UIStackView {
    func arrangedViews(_ views: [UIView]) {
        views.forEach { view in
            self.addArrangedSubview(view)
        }
    }
}
