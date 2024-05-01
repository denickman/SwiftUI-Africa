//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Denis Yaremenko on 26.03.2024.
//

import SwiftUI

struct AnimalDetailView: View {
    
    // MARK: - Properties
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    let animal: Animal
    
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // Hero image
                
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                    
                
                // title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                
                // headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                
                
                
                
                // gallery
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                
                // facts
                
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                
                // description
                
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                
                // map
                
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                
                // link
                
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn more")
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                
                
                
               
            }//: VStack
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }//: Scroll
    }
}

#Preview {
    NavigationView {
        AnimalDetailView(animal: AnimalDetailView.animals[0])
    }
}
