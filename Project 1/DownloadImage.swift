//
//  DownloadImage.swift
//  Project 1
//
//  Created by Igor de Castro on 11/08/25.
//

import Foundation
import UIKit

enum DownloadImageError: Error {
    case invalidUrl
    case requestError
}

protocol DownloadImageRequest {
    func request(url: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}

class DownloadImage: DownloadImageRequest {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func request(url: String, completion: @escaping (Result<UIImage, any Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(DownloadImageError.invalidUrl))
            return
        }
        let urlRequest = URLRequest(url: url)
        
        urlSession.dataTask(with: urlRequest) { data, _, _ in
            DispatchQueue.main.async {
                guard let data = data,
                      let image = UIImage(data: data) else {
                    completion(.failure(DownloadImageError.requestError))
                    return
                }
                completion(.success(image))
            }
        }.resume()
    }
}
