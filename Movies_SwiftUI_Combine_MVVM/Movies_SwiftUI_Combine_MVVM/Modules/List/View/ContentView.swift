//
//  ContentView.swift
//  Movies_SwiftUI_Combine_MVVM
//
//  Created by Евгений  on 10/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viemModel = MoviesViewModel()
    
    var body: some View {
        List(viemModel.movies, id: \.id) { movie in
            Text(movie.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
