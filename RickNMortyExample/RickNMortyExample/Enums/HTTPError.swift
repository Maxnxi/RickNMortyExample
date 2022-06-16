//
//  HTTPError.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import Foundation

enum HTTPError: LocalizedError, Equatable {
    case invalidResponse
    case invalidStatusCode
}
