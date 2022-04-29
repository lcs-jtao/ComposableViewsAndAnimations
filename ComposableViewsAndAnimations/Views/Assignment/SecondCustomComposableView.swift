//
//  SecondCustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Joyce Tao on 2022-04-28.
//

import SwiftUI

struct SecondCustomComposableView: View {
    
    // MARK: Stored properties
    // Control the animation
    @State var animationOn = false
    
    // Control the repetition
    @State var repeatCounts: Double
    
    // Start a timer 0.25 seconds after the view appears
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
 
    // MARK: Computed properties
    var body: some View {
        ZStack {
 
            Circle()
                .stroke(Color(.systemBlue), lineWidth: 14)
                .frame(width: 100, height: 100)
 
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.white, lineWidth: 7)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: animationOn ? 360 : 0))
            
        }
        // Trigger the animation with a timer
        .onReceive(timer) { input in
            
            withAnimation(
                Animation
                    .easeInOut(duration: 1)
                    .repeatCount(Int(repeatCounts), autoreverses: false)
            ) {
                // Turn on the animation
                animationOn = true
            }
            
            // Stop the timer
            timer.upstream.connect().cancel()
        }
    }
}

struct SecondCustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCustomComposableView(repeatCounts: 1.0)
    }
}
