//
//  weatherappman.swift
//  Clima
//
//  Created by Manas on 23/11/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didupdateweather(_weatherappman: weatherappman,weather: weathermodel)
    func didfailwitherror(error: Error)
}

struct weatherappman{
    
    var delegate: WeatherManagerDelegate?
    
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=c417c1ad9aaa0bec4c0cf116bb1fa25d&units=metric"
    
    func fetchweather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    // networking (took the url and fetching the data)
    
    func performRequest(urlString: String){
        // 1)create a url
        if let url = URL(string: urlString){
            //2)create a urlsession
            let session = URLSession(configuration: .default)
            
            // 3)give the session a task ( datatask is the one which fetches data)
            
            let task = session.dataTask(with: url) { (data, response, error) in // here the enclosed data will have the retreived json file
                
                if error != nil{
                    delegate?.didfailwitherror(error: error!)
                }
                
                // calling parseJSON   method using self
                
                if let safedata = data {
                    if let weather = self.parseJSON(weatherData: safedata){// now our weather has the data
                        // now we have to send this data to the view-controller
                        self.delegate?.didupdateweather(_weatherappman: self, weather: weather)
                    }
                    }
                }
                //4)start a task
                
                task.resume()
                
            }
        }
    
    
    
    func parseJSON(weatherData: Data)-> weathermodel?{
        
        let decoder = JSONDecoder()
        do {
           let decodedData =  try decoder.decode(weatherdata.self, from: weatherData)
           let temp = decodedData.main.temp
           let name = decodedData.name
           let id = decodedData.weather[0].id// these are found from the json file, according to the name we access it. example:- inside main file there was temp so we have called main.temp
            let weather = weathermodel(conditionId: id, cityname: name, temperature: temp)
            return weather
            
        }
        catch{
            delegate?.didfailwitherror(error: error)
            return nil
        }
    }
}
