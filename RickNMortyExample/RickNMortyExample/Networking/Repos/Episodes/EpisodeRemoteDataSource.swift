//
//  EpisodeRemoteDataSource.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 28/06/2022.
//

import Foundation
import Combine

class EpisodeRemoteDataSource {
    
    static let getEpisodeURL: String = "episode"
    static let getPage: String = "?page="
    private let baseURLString: String
    private let session: URLSession
    private let apiManager: ApiManager
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        self.baseURLString = baseURL
        self.session = session
        self.apiManager = ApiManager(baseURL: baseURL, session: session)
    }
    
    func getEpisodes(page: Int) -> AnyPublisher<ServerBaseArrayResponse<ServerGetEpisodeResponse>, Error> {
        let urlRequest = getEpisodeEndpoint(page: page)
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    func getEpisodeDetail(id: Int) -> AnyPublisher<ServerResultResponse<ServerGetEpisodeResponse>, Error> {
        let urlRequest = getEpisodeDetailEndpoint(id: id)
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
}

extension EpisodeRemoteDataSource {
    
    func getEpisodeEndpoint(page: Int) -> URLRequest {
        let endpoint = "\(baseURLString)\(EpisodeRemoteDataSource.getEpisodeURL)\(EpisodeRemoteDataSource.getPage)\(page)"
        let components = URLComponents(string: endpoint)
        let urlRequest = URLRequest(url: (components?.url!)!)
        return urlRequest
    }
    
    func getEpisodeDetailEndpoint(id: Int) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(EpisodeRemoteDataSource.getEpisodeURL)/\(id)"
        let components = URLComponents(string: endpoint)
        let urlRequest = URLRequest(url: (components?.url!)!)
        return urlRequest
    }
}
