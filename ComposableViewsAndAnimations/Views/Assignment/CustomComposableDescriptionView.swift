//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var state: Bool = false
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("Description")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("""
                    Here's an animation of a running car.

                    Use the toggle below to turn on/off the autoreverse function.
                    """)
                
                Toggle("Autoreverse", isOn: $state)
                
            }
            .padding(.bottom)
            
            List {
                NavigationLink(destination: CustomComposableView(reverseOn: state)) {
                    SimpleListItemView(title: "First Composable View",
                                       caption: "A running car")
                }
                NavigationLink(destination: SecondCustomComposableView()) {
                    SimpleListItemView(title: "Second Composable View",
                                       caption: "A loading indicator")
                }
            }
            
        }
        .padding()
        .navigationTitle("My Composable View")
        
    }
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}
