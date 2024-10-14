//
//  Untitled.swift
//  Project 1
//
//  Created by Igor de Castro on 03/10/24.
//

import Foundation

enum Method: String {
    case GET
    case POST
}

struct ApiManager {
    let endpoint: String
    let method: String
    let body: Data?
    var headers: [String: String]? = nil

    init(endpoint: String,
         method: String = Method.GET.rawValue,
         body: Data?,
         headers: [String : String]? = nil
    ) {
        self.endpoint = endpoint
        self.method = method
        self.body = body
        self.headers = headers
    }
}
