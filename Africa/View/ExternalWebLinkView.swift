//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Denis Yaremenko on 27.03.2024.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    // MARK: - Properties
    let animal: Animal
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    
    // MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
                
                
            }//: HStack
        }//: Box
    }
}

#Preview {
    ExternalWebLinkView(animal: ExternalWebLinkView.animals[2])
        .previewLayout(.sizeThatFits)
        .padding()
}
