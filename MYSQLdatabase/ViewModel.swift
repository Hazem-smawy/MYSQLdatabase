//
//  ViewModel.swift
//  MYSQLdatabase
//
//  Created by hazem smawy on 9/21/22.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject {
    // MARK: - Property
    @Published var items:[Posts] = [Posts]()
    let prefixUrl = "https://jsonplaceholder.typicode.com/posts"
    
    // MARK: - constructor
    
    init(){
        fetchPosts()
    }
    
    // MARK: - Method
    
    //TODO: 1. retrieve data
    
    func fetchPosts() {
        guard let url = URL(string: "\(prefixUrl)")else {
            print("Not found url")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error for URLSession")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([Posts].self, from: data)
                    DispatchQueue.main.async {
                        self.items = result
                        
                    }
                }
                
            }catch let JsonError {
                print("fetch json error",JsonError.localizedDescription)
            }
        }.resume()
        
    }
    
    //TODO: 2. create new post
    func createPost(parameters:[String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/createPost")else {
            print("Not found url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error for URLSession")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([Posts].self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }
                
            }catch let JsonError {
                print("fetch json error",JsonError.localizedDescription)
            }
        }.resume()
        
    }
    
    //TODO: 2. update post
    func updatePost(parameters:[String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/createPost")else {
            print("Not found url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("error",error?.localizedDescription ?? "Error")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([Posts].self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }
                
            }catch let JsonError {
                print("fetch json error",JsonError.localizedDescription)
            }
        }.resume()
        
    }
    
    
    //TODO: 4. delete post
    func deletePost(parameters:[String: Any]) {
        guard let url = URL(string: "\(prefixUrl)")else {
            print("Not found url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(request)
            if error != nil {
                print(error?.localizedDescription ?? "error")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([Posts].self, from: data)
                    print(result)
                    print("you delete the data")
                }
                
            }catch let JsonError {
                print("fetch json error",JsonError.localizedDescription)
            }
        }.resume()
        
    }
}

let viewModel = ViewModel()
