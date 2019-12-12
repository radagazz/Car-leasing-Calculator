//
//  GradientBackground.swift
//  Car Leasing Calculator
//
//  Created by Art's Macbook Pro on 10/12/2562 BE.
//  Copyright © 2562 Anurak Teerarattananukulchai. All rights reserved.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 100, endRadius: 800)
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
