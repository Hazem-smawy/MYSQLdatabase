//
//  ContentView.swift
//  MYSQLdatabase
//
//  Created by hazem smawy on 9/21/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
  
    @ObservedObject var viewModel = ViewModel()
    // MARK: - Body
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 4) {
                    ForEach(viewModel.items){ item in
                       
                           CardView(item: item)
                        
                    }
                }
               
            }
            .background(.white)
        }
      
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
            
    }
}
