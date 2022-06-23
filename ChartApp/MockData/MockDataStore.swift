//
//  MockDataStore.swift
//  ChartApp
//
//  Created by AmritPandey on 23/06/22.
//

import Foundation

enum RetrievalResult {
    case sucess(Appraisals)
    case failure(Error)
}

class MockDataStore {

    private static var jsonURL: URL? {
        return Bundle.main.url(forResource: "AppraisedData", withExtension: "json")
    }
    
    static func mockData(completion: @escaping (RetrievalResult) -> Void) {
        guard let jsonURL = jsonURL else {
            return
        }
        do {
            let data = try Data(contentsOf: jsonURL)
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            let appraisal = try jsonDecoder.decode(Appraisals.self, from: data)
            completion(.sucess(appraisal))
        }
        catch {
            completion(.failure(error))
        }
        
    }
}
