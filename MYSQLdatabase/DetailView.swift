//
//  DetailView.swift
//  MYSQLdatabase
//
//  Created by hazem smawy on 9/25/22.
//

import SwiftUI

struct DetailView: View {
    var item:Posts
    
    var body: some View {
        ZStack {
            Text(item.body)
                .padding()
                .font(.system(.callout).weight(.bold))
                .lineSpacing(5)
                .foregroundColor(.blue)
                
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var post:Posts = Posts(userId: 1, id: 1, title: "hello", body: "hello from here")
    static var previews: some View {
        DetailView(item: post)
    }
}
