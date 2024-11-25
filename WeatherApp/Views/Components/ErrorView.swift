//
//  ErrorView.swift
//  WeatherApp
//
//  Created by PT Phincon on 25/11/24.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .foregroundColor(.red)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.red.opacity(0.1))
            )
    }
}
