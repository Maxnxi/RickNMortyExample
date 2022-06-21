//
//  CharRemoteDataSourceTest.swift
//  RickNMortyExampleTests
//
//  Created by Maksim Ponomarev on 21/06/2022.
//

import XCTest
@testable import RickNMortyExample

class CharRemoteDataSourceTest: XCTestCase {
    
    var sut: CharacterRemoteDataSource?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CharacterRemoteDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetAllCharactersEndpoint() {
        let character = "character/"
        let page = 2
        
        let response = sut!.getAllCharactersEndpoint(page: page)
        
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(character)")
    }
    
    func testGetCharacterDetailEndpoint() {
        let character = "character/"
        let id = 1
        
        let response = sut?.getCharacterDetailEndpoint(id: id)
        
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(character)\(id)")
    }
}
