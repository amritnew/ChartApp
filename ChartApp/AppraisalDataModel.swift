//
//  AppraisalDataModel.swift
//  ChartApp
//
//  Created by AmritPandey on 23/06/22.
//

import Foundation

struct AppraisedData: Decodable {
    private let date: String
    let appraisedValue: Int
    
    var appraisedDate: Date? {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withDay, .withMonth]
        return dateFormatter.date(from: date)
    }
}

struct Appraisals: Decodable {
    let appraisal: [AppraisedData]
}


