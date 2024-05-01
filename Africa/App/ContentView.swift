//
//  ContentView.swift
//  Africa
//
//  Created by Denis Yaremenko on 26.03.2024.
//

import SwiftUI

struct ContentView: View {
    
  // MARK: - Properties
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Private Properties
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .zero))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: Link
                        }//: Loop
                        // CreditsView - for some reasons CreditsView align to left position, List comes with some default preferencies, there is no dedicated list cell modifier for the alighnment for swift ui list row yet
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: Link
                            }//: Loop
                        }//: Grid
                        .padding(10)
                        .animation(.easeIn)
                    }//: Scroll
                }//: Condition
            }//: Group
            
  
            // Does not work somehow
//            navigationBarTitle("Africa", displayMode: .large)
            .navigationTitle("Africa")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 16) {
                            // List
                            Button(action: {
                                print("List view is activated")
                                isGridViewActive = false
                                haptics.impactOccurred()
                            }) {
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .primary : .accentColor)
                            }
                            
                            // GRID
                            Button(action: {
                                print("Grid view is activated")
                                isGridViewActive = true
                                haptics.impactOccurred()
                                gridSwitch()
                            }) {
                                Image(systemName: toolbarIcon)
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .accentColor : .primary)
                            }
                        }//: HStack
                    }//: Buttons
                }
        }//: Navigation
    }
}

#Preview {
    ContentView()
}


extension ContentView {
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid number: \(gridColumn)")
        
        // toolbar image
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "square.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
}
