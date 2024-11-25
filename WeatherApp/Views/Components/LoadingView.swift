//
//  LoadingView.swift
//  WeatherApp
//
//  Created by PT Phincon on 25/11/24.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .scaleEffect(1.5)
            Text("Loading weather data...")
                .foregroundColor(.gray)
                .padding(.top)
        }
    }
}
