//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Shiva on 11/12/24.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showFavoriteOnly: Bool = false
    
    
    var filteredLandmakrs: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        
        NavigationSplitView {
            Toggle(isOn: $showFavoriteOnly) {
                                Text("Favorites only")
                            }
            List(filteredLandmakrs) { landmark in
                NavigationLink {
                    
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
                
            }
            .navigationTitle("Landmarks")
            .animation(.spring, value: filteredLandmakrs)
        } detail: {
            Text("Select a landmark")
        }

    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
