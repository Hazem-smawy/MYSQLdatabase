//
//  EditPost.swift
//  MYSQLdatabase
//
//  Created by hazem smawy on 9/25/22.
//

import SwiftUI

struct EditPost: View {
    var post:Posts
    @State private var title :String = ""
    @State private var bodyText :String = ""
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TextField(post.title,text: $title)
                .padding()
                .frame(width: 350, height: 60, alignment: .center)
                .background(Color( red: 0, green: 0, blue: 1, opacity: 0.1))
                .cornerRadius(15)
                .foregroundColor(.blue)
                .font(.system(size: 20, weight: .bold, design: .rounded))
            TextField(post.body,text: $bodyText)
                .lineLimit(nil)
                .padding()
                .frame(width: 350, height: 60, alignment: .center)
                .background(Color( red: 0, green: 0, blue: 1, opacity: 0.1))
                .cornerRadius(15)
                .foregroundColor(.blue)
                .font(.system(size: 20, weight: .bold, design: .rounded))
            
            Button {
                print("he")
            } label: {
                Text("edit the post")
            }
            .padding()
            .frame(width: 350, height: 60, alignment: .center)
            .background(Color( red: 0, green: 0, blue: 255, opacity: 0.5))
            .cornerRadius(15)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold, design: .rounded))
        }
        .padding(30)
        
    }
}

struct EditPost_Previews: PreviewProvider {
    static var post:Posts = Posts(userId: 1, id: 1, title: "hello", body: "hello from here")
    static var previews: some View {
        EditPost(post: post)
    }
}
