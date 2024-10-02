//
//  LoadingView.swift
//  WeatherApplication
//
//  Created by Raman Tank on 02/10/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(
            CircularProgressViewStyle(
                tint: .white
            )
        ).frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
