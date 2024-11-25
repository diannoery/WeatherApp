//
//  APIManager.swift
//  WeatherApp
//
//  Created by PT Phincon on 25/11/24.
//

import Foundation
import Alamofire
import RxSwift

class APIManager {
    static let shared = APIManager()
    private init() {}
    
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey = "051d5bb2bf5630420d77f7d89ffb32de"
    
    private func getHeaders() -> HTTPHeaders {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
    
    private func getParameters(for city: String) -> [String: Any] {
        return [
            "q": city,
            "appid": apiKey,
            "units": "metric"
        ]
    }
}

extension APIManager {
    func fetchWeather(for city: String) -> Observable<WeatherModel> {
        return Observable.create { observer in
            let parameters = self.getParameters(for: city)
            
            AF.request(
                self.baseURL,
                method: .get,
                parameters: parameters,
                headers: self.getHeaders()
            )
            .validate()
            .responseDecodable(of: WeatherModel.self) { response in
                switch response.result {
                case .success(let weather):
                    observer.onNext(weather)
                    observer.onCompleted()
                    
                case .failure(let error):
                    if let data = response.data,
                       let serverError = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                        observer.onError(NetworkError.serverError(serverError.message))
                    } else {
                        observer.onError(error)
                    }
                }
            }
            
            return Disposables.create()
        }
    }
}
