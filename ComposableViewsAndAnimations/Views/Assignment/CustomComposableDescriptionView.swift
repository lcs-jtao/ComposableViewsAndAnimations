//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var phrase: String = ""
    
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

                    Enter "true" or "false" below to turn on/off the autoreverse function.
                    
                    Invalid input will activate the function.
                    """)
                
                TextField("Enter an input value", text: $phrase)
                    .autocapitalization(.none)
                
            }
            .padding(.bottom)
            
            List {
                NavigationLink(destination: CustomComposableView(message: phrase)) {
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
