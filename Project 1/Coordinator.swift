//
//  Coordinator.swift
//  Project 1
//
//  Created by Igor de Castro on 30/09/24.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
}

protocol NavigationCoordinator: Coordinator {
    var navigationController: UINavigationController { get set }
}
