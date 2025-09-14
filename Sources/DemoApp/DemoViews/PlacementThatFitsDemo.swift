//
//  PlacementThatFits.swift
//  PlacementTests
//
//  Created by Sam Pettersson on 2022-09-19.
//

import Foundation
import Placement
import SwiftUI

struct PlacementThatFitsDemo: View {
    @State var changeContainerWidth = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Layout below uses SwiftUI.ViewThatFits (on iOS 16)")
                    .fontWeight(.semibold)
                Demo(changeContainerWidth: changeContainerWidth, prefersViewThatFits: true)

                Text("Layout below uses Placement")
                    .fontWeight(.semibold)
                Demo(changeContainerWidth: changeContainerWidth, prefersViewThatFits: false)

                Button("Change container width") {
                    changeContainerWidth.toggle()
                }
            }.frame(maxWidth: .infinity)
        }
    }
}

private struct Demo: View {
    var changeContainerWidth: Bool
    var prefersViewThatFits: Bool

    var body: some View {
        PlacementThatFits(prefersViewThatFits: prefersViewThatFits) {
            Button("Some longer text that wont fit initially") {
              print("tap index 0")
            }.onAppear(perform: {
              print("did appear index 0")
            })
            Button("A button") {
              print("tap index 1")
            }.onAppear(perform: {
              print("did appear index 1")
            })
        }
        .border(.red)
        .frame(maxWidth: changeContainerWidth ? .infinity : 150)

        HStack {
            Text("Leading view")
            Color.red
                .frame(width: 1)
            PlacementThatFits(prefersViewThatFits: prefersViewThatFits) {
                Text("Trailing view with long text")
                Text("Trailing view")
            }
        }
        .border(.red)
        .frame(maxWidth: changeContainerWidth ? .infinity : 150)


        PlacementThatFits(prefersViewThatFits: prefersViewThatFits) {
            Color.yellow
            Color.green
        }
        .frame(maxWidth: changeContainerWidth ? .infinity : 5)
    }
}
