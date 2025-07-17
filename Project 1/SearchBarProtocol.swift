//
//  SearchBarProtocol.swift
//  Project 1
//
//  Created by Igor de Castro on 14/05/25.
//
// MARK: Enviar o que foi escrito na searchview e passar para a ViewController
protocol SearchBarProtocol: AnyObject {
    func getSearched(_ text: String)
}
