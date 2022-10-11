//
//  ApiCaller.swift
//  NetflixClone
//
//  Created by EKINCARE on 10/10/22.
//

import Foundation

struct Constants {
     static let APIKEY = "359d8bcbedfc54a371aebda653aeed99"
     static let baseUrl = "https://api.themoviedb.org"
}

enum APIError : Error {
    
  case failedToGetdata
}

class APICaller  {
    
      static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result< [Title] , Error>) -> Void){
           
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.APIKEY)") else {return}
        
        let request = URLRequest(url: url)
        //request.httpMethod = "GET"
    
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else{
                 return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
               // print("Error : \(error.localizedDescription)")
               // completion(.failure(error))
                completion(.failure(APIError.failedToGetdata))
            }
        }
        
        
        task.resume()
        
       
    }
    
    
    func getTrendingTvs(completion: @escaping (Result< [Title] , Error>) -> Void){
           
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.APIKEY)") else {return}
        
        let request = URLRequest(url: url)
        //request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else{
                 return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
               // print("Error : \(error.localizedDescription)")
                completion(.failure(APIError.failedToGetdata))
            }
        }
        
        task.resume()
    }
    
    
    
    func getUpcomingMovies(completion: @escaping (Result< [Title] , Error>) -> Void){
           
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.APIKEY)") else {return}
        
        let request = URLRequest(url: url)
        //request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else{
                 return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
               // print("Error : \(error.localizedDescription)")
                completion(.failure(APIError.failedToGetdata))
            }
        }
        
        task.resume()
        
    }
    
    
    func getPopular(completion: @escaping (Result< [Title] , Error>) -> Void){
           
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.APIKEY)") else {return}
        
        let request = URLRequest(url: url)
        //request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else{
                 return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
               // print("Error : \(error.localizedDescription)")
                completion(.failure(APIError.failedToGetdata))
            }
        }
        
        task.resume()
    }
    
    
    func getTopRated(completion: @escaping (Result< [Title] , Error>) -> Void){
           
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/top_rated?api_key=\(Constants.APIKEY)") else {return}
        
        let request = URLRequest(url: url)
        //request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else{
                 return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
               // print("Error : \(error.localizedDescription)")
                completion(.failure(APIError.failedToGetdata))
            }
        }
        
        task.resume()
    }
    
    
    func getSearchedMovies(completion: @escaping (Result< [Title] , Error>) -> Void){
        
//        https://api.themoviedb.org/3/discover/movie?api_key=<<api_key>>&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate


        guard let url = URL(string: "\(Constants.baseUrl)/3/discover/movie?api_key=\(Constants.APIKEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        
        let request = URLRequest(url: url)
        //request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else{
                 return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
               // print("Error : \(error.localizedDescription)")
                completion(.failure(APIError.failedToGetdata))
            }
        }
        
        task.resume()
    }
    
    
}
