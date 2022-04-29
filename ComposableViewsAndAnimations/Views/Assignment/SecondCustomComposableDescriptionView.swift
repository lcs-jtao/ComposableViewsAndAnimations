//
//  SecondCustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Joyce Tao on 2022-04-29.
//

import SwiftUI

struct SecondCustomComposableDescriptionView: View {
    // MARK: Stored properties
    @State var repeatedTimes: Double = 1.0
    
    // MARK: Computed properties
    var body: some View {
        VStack(alignment: .leading) {
                
            Group {
                    
                Text("Description")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                    
                Text("""
                    Here's an animation of a loading indicator.

                    Use the stepper below to control the number of repetitions of the animation.
                    """)
                    
                Stepper("Repetitions",
                        value: $repeatedTimes,
                        in: 1.0 ... 10.0,
                        step: 1.0)
                
                HStack {
                    Spacer()
                    Text("\(Int(repeatedTimes)) time(s)")
                        .bold()
                    Spacer()
                }
                    
            }
            .padding(.bottom)
                
            List {
                NavigationLink(destination: SecondCustomComposableView(repeatCounts: repeatedTimes)) {
                    SimpleListItemView(title: "A loading indicator",
                                           caption: "Loading...🔄")
                }
            }
                
        }
        .padding()
        .navigationTitle("My Composable View")
            
    }
}

struct SecondCustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCustomComposableDescriptionView()
    }
}
