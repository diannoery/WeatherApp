//
//  WeatherContentView.swift
//  WeatherApp
//
//  Created by PT Phincon on 25/11/24.
//

import Foundation
import SwiftUI

struct WeatherContentView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            Text(viewModel.cityName)
                .font(.largeTitle)
                .bold()
            
            Text(viewModel.temperature)
                .font(.system(size: 70, weight: .bold))
            
            Text(viewModel.description)
                .font(.title2)
            
            HStack(spacing: 20) {
                WeatherInfoView(title: "Humidity", value: viewModel.humidity)
                WeatherInfoView(title: "Min", value: viewModel.minTemp)
                WeatherInfoView(title: "Max", value: viewModel.maxTemp)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.blue.opacity(0.1))
        )
        .animation(.spring())
    }
}
