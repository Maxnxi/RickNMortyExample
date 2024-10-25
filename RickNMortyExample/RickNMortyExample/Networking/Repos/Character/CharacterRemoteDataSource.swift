//
//  CharacterRemoteDataSource.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import Foundation
import Combine

class CharacterRemoteDataSource {
    
    static let getAllCharactersURL: String = "character/"
    static let getPage: String = "?page="
    private let baseURLString: String
    private let session: URLSession
    private let apiManager: ApiManager
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        self.baseURLString = baseURL
        self.session = session
        self.apiManager = ApiManager(baseURL: baseURL, session: session)
    }
    
    func getAllCharacters(page: Int) -> AnyPublisher<ServerBaseArrayResponse<ServerCharacterResponse>,Error> {
        
        let urlRequest = getAllCharactersEndpoint(page: page)
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
    func getCharacterDetail(id: Int) -> AnyPublisher<ServerCharacterResponse, Error> {
        
        let urlRequest = getCharacterDetailEndpoint(id: id)
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

extension CharacterRemoteDataSource {
    func getAllCharactersEndpoint(page: Int) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(CharacterRemoteDataSource.getAllCharactersURL)\(CharacterRemoteDataSource.getPage)\(page)"
        let components = URLComponents(string: endpoint)
        let urlRequest = URLRequest(url: (components?.url!)!)
        return urlRequest
    }
    
    func getCharacterDetailEndpoint(id: Int) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(CharacterRemoteDataSource.getAllCharactersURL)\(id)"
        let components = URLComponents(string: endpoint)
        let urlRequest = URLRequest(url: (components?.url!)!)
        return urlRequest
    }
}
