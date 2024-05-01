//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Denis Yaremenko on 26.03.2024.
//

import SwiftUI

struct AnimalListItemView: View {
    
    // MARK: - Properties
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    let animal: Animal

    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }//: VStack
        }//: HStack
    }
}

#Preview {

    AnimalListItemView(animal: AnimalListItemView.animals[1])
        .previewLayout(.sizeThatFits)
        .padding()
    
}
