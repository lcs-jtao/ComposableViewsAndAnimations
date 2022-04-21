//
//  ExerciseTwoView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseTwoView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
        
    // Whether to apply the animation
    @State private var useAnimation = false
    
    // Controls the size of the circle
    @State private var offset: CGFloat = -150.0

    // MARK: Computed properties

    var body: some View {
        
        NavigationView {
            
            VStack {

                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.blue)
                    .offset(x: 0, y: offset)
                    .onTapGesture {
                        withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 1.0, damping: 0.75, initialVelocity: 10)) {
                            offset += 40
                        }
                    }
                
            }
            .navigationTitle("Exercise 2")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }

        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct ExerciseTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTwoView(showThisView: .constant(true))
    }
}
