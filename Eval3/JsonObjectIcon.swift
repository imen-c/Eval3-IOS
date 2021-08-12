//
//  JsonObjectIcon.swift
//  Eval3
//
//  Created by Student04 on 12/08/2021.
//

import Foundation
struct SourceIcon : Codable {
    let coins : [Icoin]
}

struct Icoin : Codable {
    let name : String?
    let icon : String?
}
