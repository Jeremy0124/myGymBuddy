//
//  ContentView.swift
//  myGymBuddy
//
//  Created by Jeremy Jackman on 8/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            ZStack {
                Image("Bimg")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                VStack (alignment: .center, spacing: 0) {
                    NavigationLink(destination: HomePageView()) {
                        Text("Let's Get Started")
                            .background(.white)
                            .frame(minWidth: 0, maxWidth: 700)
                            .padding(20)
                            .foregroundColor(.black)
                            .cornerRadius(40)
                            .font(.title)
                            .scaledToFill()
                        
                    }
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
