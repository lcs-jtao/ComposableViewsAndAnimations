//
//  CustomComposableListView.swift
//  ComposableViewsAndAnimations
//
//  Created by Joyce Tao on 2022-04-29.
//

import SwiftUI

struct CustomComposableListView: View {
    var body: some View {
        List {
            NavigationLink(destination: FirstCustomComposableDescriptionView()) {
                SimpleListItemView(title: "First Composable View",
                                   caption: "Describe and show the first animation")
            }
            NavigationLink(destination: SecondCustomComposableDescriptionView()) {
                SimpleListItemView(title: "Second Composable View",
                                   caption: "Describe and show the second animation")
            }
        }
    }
}

struct CustomComposableListView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableListView()
    }
}
