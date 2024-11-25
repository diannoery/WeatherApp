//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by PT Phincon on 25/11/24.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class WeatherViewModel: ObservableObject {
    private let apiManager: APIManager
    private let disposeBag = DisposeBag()
    
    @Published var temperature: String = "--"
    @Published var cityName: String = "--"
    @Published var description: String = "--"
    @Published var humidity: String = "--"
    @Published var minTemp: String = "--"
    @Published var maxTemp: String = "--"
    @Published var isLoading: Bool = false
    @Published var error: String?
    
    init(apiManager: APIManager = .shared) {
        self.apiManager = apiManager
    }
    
    func fetchWeather(for city: String) {
        isLoading = true
        error = nil
        
        apiManager.fetchWeather(for: city)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] weather in
                self?.updateUI(with: weather)
            }, onError: { [weak self] error in
                self?.handleError(error)
            })
            .disposed(by: disposeBag)
    }
    
    private func updateUI(with weather: WeatherModel) {
        temperature = String(format: "%.1f°C", weather.main.temp)
        cityName = weather.name
        description = weather.weather.first?.description.capitalized ?? "--"
        humidity = "\(weather.main.humidity)%"
        minTemp = String(format: "%.1f°C", weather.main.temp_min)
        maxTemp = String(format: "%.1f°C", weather.main.temp_max)
        isLoading = false
    }
    
    private func handleError(_ error: Error) {
        isLoading = false
        if let networkError = error as? NetworkError {
            self.error = networkError.localizedDescription
        } else if let afError = error as? AFError {
            self.error = afError.localizedDescription
        } else {
            self.error = error.localizedDescription
        }
    }
}
