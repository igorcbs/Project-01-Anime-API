//
//  ViewController.swift
//  Project 1
//
//  Created by Igor de Castro on 30/09/24.
//

import UIKit

final class ViewController: UIViewController {
    private let service: ServiceProtocol

    init(service: ServiceProtocol) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(#function)
    }
    
//    func configService() {
//        service?.getData(url: "https://graphql.anilist.co") { result in
//            switch result {
//            case .success(let success):
////                do {
//                print(success)
////                } catch {
////                    print("Erro no parce")
////                }
//            case .failure(let failure):
//                print("Deu ruim: \(failure.localizedDescription)")
//            }
//        }
//    }
}

