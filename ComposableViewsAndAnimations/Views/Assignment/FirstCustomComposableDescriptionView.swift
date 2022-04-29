//
//  FirstCustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct FirstCustomComposableDescriptionView: View {
    
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
                NavigationLink(destination: FirstCustomComposableView(reverseOn: state)) {
                    SimpleListItemView(title: "First Composable View",
                                       caption: "A running car")
                }
            }
            
        }
        .padding()
        .navigationTitle("My Composable View")
        
    }
}

struct FirstCustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FirstCustomComposableDescriptionView()
        }
    }
}
