//
//  WeatherInfoView.swift
//  WeatherApp
//
//  Created by PT Phincon on 25/11/24.
//

import Foundation
import SwiftUI

struct WeatherInfoView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.title3)
                .bold()
        }
    }
}
