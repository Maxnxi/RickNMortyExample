//
//  EpisodeRemoteDataSourceUnitTest.swift
//  RickNMortyExampleTests
//
//  Created by Maksim Ponomarev on 25/07/2022.
//

import XCTest
@testable import RickNMortyExample

class EpisodeRemoteDataSourceUnitTest: XCTestCase {
    
    var sut: EpisodeRemoteDataSource?
    
    override func setUpWithError() throws {
      
        try super.setUpWithError()
        
        sut = EpisodeRemoteDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }

    override func tearDownWithError() throws {
        
        sut = nil
        
        try super.tearDownWithError()
    }

    func testEpisodeEndpoint() {
        
        // Given
        let episode = "episode"
        let page = 1
        
        // When
        let response = sut!.getEpisodeEndpoint(page: page)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(episode)")
    }
    
    func testEpisodeDetailEndpoint() {
        
        // Given
        let endpoint = "episode/"
        let id = 1
        
        // When
        let response = sut!.getEpisodeDetailEndpoint(id: id)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(endpoint)\(id)")
    }
}
