//
//  ViewController.swift
//  Project 1
//
//  Created by Igor de Castro on 30/09/24.
//

import UIKit

final class ViewController: UIViewController {
    private let service: ServiceProtocol
    let contentView = View()

    init(service: ServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = contentView
    }
    
    func configService() {
        service.getData(url: URLRequests.omdbapiURL.rawValue) { result in
            switch result {
            case .success(let success):
                if let dataString = String(data: success, encoding: .utf8) {
                    print("Dados recebidos: \(dataString)")
                }
            case .failure(let failure):
                print("Deu ruim: \(failure.localizedDescription)")
            }
        }
    }
}

