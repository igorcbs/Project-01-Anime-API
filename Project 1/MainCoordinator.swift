//
//  MainCoordinator.swift
//  Project 1
//
//  Created by Igor de Castro on 30/09/24.
//

import UIKit

final class MainCoordinator: NavigationCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let apiManager = ApiManager(
            endpoint: Method.POST.rawValue,
            body: nil
        )
        let service = Service(endpoint: apiManager)
        let viewController = ViewController(service: service)
        navigationController.pushViewController(viewController, animated: true)
    }
}
