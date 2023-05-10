//
//  EndPoint.swift
//  Movies_SwiftUI_Combine_MVVM
//
//  Created by Евгений  on 10/05/2023.
//

import Foundation
import Alamofire

protocol EndPointType {
    var httpMethod: HTTPMethod { get }
    var baseUrl: String { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
    var body: [String: Any]? { get }
    var parameters: [String: Any]? { get }
    var encoding: ParameterEncoding { get }
}

enum EndPoint {
    case movies
   
}

extension EndPoint: EndPointType {
    var urlString: String {
        return baseUrl + apiVersion + path
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .movies:
            return .get
        }
    }
    
    var baseUrl: String {
        switch self {
        case .movies:
            return "https://api.themoviedb.org/"
 
        }
    }
    
    var path: String {
        switch self {
        case .movies:
            return "/movie/popular"
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .movies:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case .movies:
            return nil
        }
    }
    
    var parameters: [String : Any]? {
        var parameters: [String : Any] = ["api_key" : apiKey, "language" : apiLanguage]
        switch self {
        case .movies:
            parameters["page"] = 1
            return parameters
 
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .movies:
            return URLEncoding.default
        }
    }
}
    
private extension EndPoint {
    var apiKey: String {
        return  "124f09c902f0aae1577860f06cebd903"
    }
    var apiVersion: String {
        return "3"
    }
    var apiLanguage: String {
        return "en-US"
    }
}

