//
//  weatherdata.swift
//  Clima
//
//  Created by Manas on 27/11/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

// The code you provided is using Swift's Decodable protocol to define structures (weatherdata and Main) that can be used to convert JSON data into Swift objects. This process is commonly referred to as "decoding" or "parsing" JSON.



struct weatherdata : Codable{
    let name: String
    let main: Main
    let weather:[Weather]
    
}

struct Main : Codable{
    let temp: Double
    
}

struct Weather: Codable{
    let id: Int
}
