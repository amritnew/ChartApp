//
//  AppraisalDataModel.swift
//  ChartApp
//
//  Created by AmritPandey on 23/06/22.
//

import Foundation

struct AppraisedData: Decodable {
    let date: String
    let appraisedValue: Int
    
    var appraisedDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSz"//2015-01-26T07:46:36.611Z
        return dateFormatter.date(from: date)
    }
}

struct Appraisals: Decodable {
    let appraisal: [AppraisedData]
}


