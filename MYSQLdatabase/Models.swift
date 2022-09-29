//
//  Models.swift
//  MYSQLdatabase
//
//  Created by hazem smawy on 9/21/22.
//

import SwiftUI
struct Posts: Decodable ,Identifiable{
    let userId:Int
    let id:Int
    let title:String
    let body:String
}
/*
 "userId": 1,
 "id": 1,
 "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
 "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
 
 */
