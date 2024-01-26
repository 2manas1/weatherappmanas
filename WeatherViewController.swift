//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate{


    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchfield: UITextField!
    
    var weathermanager = weatherappman()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchfield.delegate = self
        weathermanager.delegate = self
    }
    
    // this code is only for search button, but all the other func's except textFieldShouldReturn are associated with this as searchfield is a UItextfield.
    
    @IBAction func searchpressed(_ sender: UIButton) {
        searchfield.endEditing(true)//line is used to dismiss the keyboard, indicating that the user has finished interacting with the text field.
        
    }
    
    // all the UItextfield func's are triggered after something is entered in the searchbar and etiher of search button or go button is pressed.
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchfield.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            textField.placeholder = "Type something"
            return false
            // the return false ensure's the next func which is didendediting is not triggered as the user has not entered anything.
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // use searchfield.text to get the weather of the city
        
        
        if let city = searchfield.text{
            weathermanager.fetchweather(cityName: city)
        }
        searchfield.text = ""
        
    }
    
    func didupdateweather(_weatherappman:weatherappman, weather: weathermodel){
        DispatchQueue.main.async{
            self.temperatureLabel.text =  "\(Int(weather.temperature))"
            self.cityLabel.text = weather.cityname
            self.conditionImageView.image = UIImage(systemName: weather.conditionname)
        }
    }
    
    func didfailwitherror(error: Error){
        print(error)
    }

}

