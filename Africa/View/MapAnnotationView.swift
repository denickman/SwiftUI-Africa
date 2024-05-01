//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Denis Yaremenko on 29.03.2024.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - Properties
    var location: NationalParkLocation
    
    @State private var animation: Double = 0.0
    
    
    static var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        }//: ZStack
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

#Preview {
    MapAnnotationView(location: MapAnnotationView.locations[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
