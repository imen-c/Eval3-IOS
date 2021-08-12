//
//  JsonObjectDetail.swift
//  Eval3
//
//  Created by Student04 on 12/08/2021.
//

import Foundation
struct SourceDetail : Codable {
    let data : [Detail]
}
struct Detail : Codable{
    let priceUsd : String
    let time : Int
    let date : String
}
