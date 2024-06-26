//
//  VideoListItem.swift
//  Africa
//
//  Created by Denis Yaremenko on 29.03.2024.
//

import SwiftUI

struct VideoListItemView: View {
    
    // MARK: - Properties
    let video: Video
    static let videos: [Video] = Bundle.main.decode("videos.json")
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//: ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//: VStack
        }//: HStack
    }
}

#Preview {
    VideoListItemView(video: VideoListItemView.videos[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
