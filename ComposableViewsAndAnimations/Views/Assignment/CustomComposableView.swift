//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    // MARK: Stored properties
    // Control the horizontal offset
    @State var offsetCar = -100.0
    
    // Control the rotation angle
    @State var currentRotationAngle = Angle.degrees(0)
    
    // Control the animation
    @State var animationOn = false
    
    // Control the autoreverses function
    var message: String
    
    var reverseOn: Bool {
        if message == "true" {
            return true
        } else if message == "false" {
            return false
        } else {
            return true
        }
    }
    
    // Start a timer 0.25 seconds after the view appears
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            Group {
                Circle()
                    .fill(Color.gray)
                    .scaleEffect(animationOn ? 1.5 : 0.0)
                Circle()
                    .fill(Color.gray)
                    .scaleEffect(animationOn ? 1.25 : 0.0)
                Circle()
                    .fill(Color.gray)
                    .scaleEffect(animationOn ? 1.0 : 0.0)
            }
            .frame(width: 20, height: 20)
            .offset(x: offsetCar - 25.0, y: 30.0)
            
            VStack {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 60, height: 50)
                        .foregroundColor(.red)
                        .offset(x: offsetCar - 25.0, y: 50)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 25, height: 30)
                        .foregroundColor(.white)
                        .offset(x: offsetCar - 16.0, y: 50)
                }
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 120, height: 50)
                    .foregroundColor(.red)
                    .offset(x: offsetCar - 25.0, y: 30)
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 40)
                        RoundedRectangle(cornerRadius: 3.5)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                    }
                    .rotationEffect(currentRotationAngle, anchor: .center)
                    .offset(x: offsetCar - 50.0, y: 0)
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 40)
                        RoundedRectangle(cornerRadius: 3.5)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                    }
                    .rotationEffect(currentRotationAngle, anchor: .center)
                    .offset(x: offsetCar, y: 0)
                }
            }
        }
        // Trigger the animation with a timer
        .onReceive(timer) { input in
            
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: reverseOn)
            ) {
                // Move the car to the right
                offsetCar = 70.0
                
                // Rotate a full revolution
                currentRotationAngle = .degrees(360)
                
                // Turn on the animation
                animationOn = true
            }
            
            // Stop the timer
            timer.upstream.connect().cancel()
        }
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(message: "true")
    }
}
