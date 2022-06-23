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
    
    var appraisedDate: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let appraisedDate = dateFormatter.date(from: date)!
        let component = Calendar.current.dateComponents([.day, .month, .year], from: appraisedDate)
        return component.month!
    }
}

struct Appraisals: Decodable {
    let appraisal: [AppraisedData]
}


