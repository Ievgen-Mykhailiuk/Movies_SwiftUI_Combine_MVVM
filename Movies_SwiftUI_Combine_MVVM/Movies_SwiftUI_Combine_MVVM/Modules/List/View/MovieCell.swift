//
//  MovieCell.swift
//  Movies_SwiftUI_Combine_MVVM
//
//  Created by Евгений  on 10/05/2023.
//

import SwiftUI
import Alamofire

struct MovieCell: View {
    
    let movie: MovieModel
    
    var body: some View {
        
        ZStack {
            
            PosterImageView(url: URL(string: EndPoint.poster(path: movie.posterPath).urlString)!) {
                ProgressView()
            }
            .aspectRatio(contentMode: .fit)
            
            VStack {
                
                ZStack(alignment: .top) {
                    LinearGradient(colors: [.black, .clear], startPoint: .top, endPoint: .bottom)
                    
                    HStack {
                        Text(movie.title)
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                        Text(movie.releaseYear)
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding()
                    }
                    .padding(.bottom)
                    
                }
                
                Spacer()
                
                ZStack(alignment: .bottom) {
                    
                    LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                    
                    HStack {
                        Text(movie.genres.joined(separator: ", "))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .padding()
                        
                        Spacer()
                        
                        Text("Rating:")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .fontWeight(.bold)
                        
                        Text(movie.votesAverage)
                            .foregroundColor(.white)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .padding(.trailing)
                    }
                    
                    
                }
                
            }
        }
        
        .aspectRatio(16.0 / 9.0, contentMode: .fit)
        
    }
}

extension MovieCell {
    
}
struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: MovieModel.example)
    }
}
