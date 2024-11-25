//
//  WeatherView.swift
//  WeatherApp
//
//  Created by PT Phincon on 25/11/24.
//

import Foundation
import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var cityInput: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                SearchBarView(text: $cityInput) {
                    viewModel.fetchWeather(for: cityInput)
                }
                
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    WeatherContentView(viewModel: viewModel)
                }
                
                if let error = viewModel.error {
                    ErrorView(message: error)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Weather")
        }
    }
}

#Preview {
    WeatherView()
}
