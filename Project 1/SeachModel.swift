//
//  SeachModel.swift
//  Project 1
//
//  Created by Igor de Castro on 17/07/25.
//

struct Search: Decodable {
    let search: [SearchedModel]
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

struct SearchedModel: Decodable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
