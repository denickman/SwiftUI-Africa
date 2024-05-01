//
//  InsetMapView.swift
//  Africa
//
//  Created by Denis Yaremenko on 27.03.2024.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: - Properties
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(6.600286, 16.4327529), span: .init(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    
    
    // MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }//: HStack
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                    
                }//: Navigation
                    .padding(12)
                , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

#Preview {
    InsetMapView()
        .previewLayout(.sizeThatFits)
        .padding()
}
