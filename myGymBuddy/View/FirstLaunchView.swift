//
//  ContentView.swift
//  myGymBuddy
//
//  Created by Jeremy Jackman on 8/19/22.
//

import SwiftUI

struct FirstLaunchView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        NavigationView {
            ZStack {
                Image("Bimg")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                VStack {
                    NavigationLink(destination: HomePageView()) {
                        Text("Let's Get Started")
                            .bold()
                            .font(.title)
                            .frame(width: 280, height: 50, alignment: .center)
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .scaledToFill()
                    }
                    .onAppear{
                        animationAmount = 2
                    }
                }
                .offset(x: -30, y: 150)
                
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            FirstLaunchView()
        }
    }
}
