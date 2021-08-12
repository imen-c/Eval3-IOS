//
//  JsonObject.swift
//  Eval3
//
//  Created by Student04 on 12/08/2021.
//

import Foundation
import UIKit

struct Source : Codable {
    let data : [Coin]
    //let timestamp : Int?
}

struct Coin : Codable {
    let id : String?
    let rank : String?
    let name : String?
    let priceUsd : String?
    let changePercent24Hr : String?
    let explorer : String?
}


