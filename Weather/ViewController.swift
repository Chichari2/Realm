//
//  ViewController.swift
//  Weather
//
//  Created by Артем Вологдин on 28.02.22.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        temperatureLabel.text = weatherPersistanse.shared.temperature
        startLocationManager()
    }


    
    func startLocationManager(){
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
        }
    }
    func updateView(){
        cityNameLabel.text = weatherData.name
        temperatureLabel.text = weatherData.main.temp.description + "°"
        weatherPersistanse.shared.temperature = weatherData.main.temp.description
    }
    
    
    
    func updateWeatherInfo(latitude: Double, longtitute: Double){
        let session = URLSession.shared
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=c549ac84706dfeef565abf701bfc5792&units=metric")!
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else{
                print("DataTask Error: \(error!.localizedDescription)")
                return
            }
            do{
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                DispatchQueue.main.async{
                    self.updateView()
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last{
            updateWeatherInfo(latitude: lastLocation.coordinate.latitude, longtitute: lastLocation.coordinate.longitude)
        }
    }
}
