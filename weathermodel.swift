//
//  weathermodel.swift
//  Clima
//
//  Created by Manas on 27/11/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

// this has all the data stored that we have fetched

import Foundation

struct weathermodel {
    
    let conditionId : Int
    let cityname : String
    let temperature : Double
    
    var conditionname : String {
        switch conditionId{
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
        
        // which ever case is satisfied, it will mark the return string as the conditionname.
    }
    
    
    // when let weather = weathermodel(conditionId: id, cityname: name, temperature: temp)
    //  the above is called, weather will contain all the data's conditonID, cityname..etc not only conditionname.
}
