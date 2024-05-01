//
//  InsetFactView.swift
//  Africa
//
//  Created by Denis Yaremenko on 27.03.2024.
//

import SwiftUI

struct InsetFactView: View {
    
    // MARK: - Properties
    let animal: Animal
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    
    var body: some View {
        GroupBox {
                TabView {
                    ForEach(animal.fact, id: \.self) { item in
                        Text(item)
                    }
                }//: Tabs
                .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 140, idealHeight: 160, maxHeight: 180)
        }//: Box
    }
}

#Preview {
    InsetFactView(animal: InsetFactView.animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
