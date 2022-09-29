//
//  CardView.swift
//  MYSQLdatabase
//
//  Created by hazem smawy on 9/25/22.
//

import SwiftUI

struct CardView: View {
    var item: Posts
    @State private var isShowing :Bool = false
    @State private var isShowingEdit :Bool = false
    var body: some View {
        HStack(  spacing: 0) {
           
           VStack(alignment: .leading, spacing: 5) {
               Text("post \(item.id)")
                   .font(.system(size: 20, weight: .heavy, design: .rounded))
                   
               Text(item.title)
                   .foregroundColor(.blue)
                   .fontWeight(.bold)
               
               Text(item.body)
                   .padding(.vertical, 5)
                   .font(.system(.footnote))
                   .foregroundColor(.gray)
                   .lineLimit(2)
           }
           .padding()
           
           .cornerRadius(15)
           .frame(minWidth: 400, idealWidth: 400, maxWidth: 400, minHeight: 10, idealHeight: 200, maxHeight: 500, alignment: .leading)
          
       }
       .onTapGesture {
           isShowing.toggle()
       }
       .sheet(isPresented: $isShowing) {
           DetailView(item:item)
       }
       .sheet(isPresented: $isShowingEdit, content: {
           EditPost(post: item)
       })
       .background(Color("BackgoundPost"))
       .cornerRadius(20)
       .frame(width: 380 , alignment: .center)
       .padding(5)
       .overlay(
       
           Button(action: {
             isShowingEdit = true
           }, label: {
               Image(systemName: "pencil")
                   .foregroundColor(.gray)
                   
               
               
           })
           .padding()
           ,alignment:.topTrailing
       )

    }
}

struct CardView_Previews: PreviewProvider {
    static var post:Posts = Posts(userId: 1, id: 1, title: "hello", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
    static var previews: some View {
        CardView(item: post)
    }
}
