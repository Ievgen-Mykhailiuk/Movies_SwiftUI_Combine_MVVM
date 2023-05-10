//
//  ContentView.swift
//  Movies_SwiftUI_Combine_MVVM
//
//  Created by Евгений  on 10/05/2023.
//

import SwiftUI

struct ContentView: View {
    private let columns: [GridItem] = [
        GridItem(.flexible())
    ]
    private var spacing: CGFloat = 30
    @StateObject var viemModel = MoviesViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(
                    columns: columns,
                    alignment: .leading,
                    spacing: spacing,
                    pinnedViews: []) {
                        ForEach(viemModel.movies, id: \.id) { movie in
                           MovieCell(movie: movie)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 10)
                        }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
