//
//  SecondContection.swift
//  MYSQLdatabase
//
//  Created by hazem smawy on 9/25/22.
//

import SwiftUI

class Conection:ObservableObject {
    @Published var items:[Posts] = []
    let prefixURL = "https://localhost:3000/"
    
    func fetchData(){
        guard let url = URL(string: prefixURL) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("error")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([Posts].self, from: data)
                    self.items = result
                }
            }catch {
                print("error form json file")
            }
        }.resume()
    }
    

    
    func CreatePost(parameters:[String: Any]) {
        guard let url = URL(string: "\(prefixURL)/createPost") else {
            return
        }
        let data = try! JSONSerialization.data(withJSONObject:parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("error for create new post")
            }
            do{
                if let data = data {
                    let result = try JSONDecoder().decode([Posts].self, from: data)
                    self.items = result
                }
            }catch {
                print("error for json file")
            }
        }.resume()
    }
    
    func editPost(parameters:[String:Any]) {
        guard let url = URL(string: prefixURL) else {
            return
        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("error in edit ")
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([Posts].self, from: data)
                    self.items = result
                }
            }catch {
                print("error in json decoder")
            }
        }
        
    }
}
