//
//  HomePageView.swift
//  myGymBuddy
//
//  Created by Jeremy Jackman on 8/20/22.
//

import SwiftUI

struct HomePageView: View {
    @State private var isShowingEditPageView: Bool = false
    @State private var day = 1
    @FetchRequest(sortDescriptors: []) var workoutRoutines: FetchedResults<WorkoutRoutine>
    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<Exercise>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        
        VStack {
            ZStack {
                Button {
                    //We want to create a segue to a warm up page
                    
                } label: {
                    Image("warm-ups")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                }
                VStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: WarmUpPageView()) {
                        Text("Warm ups")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .frame(width: 300)
            }
            .frame(width: 350, height: 300)
            .cornerRadius(20)
            .clipped()
            .shadow(radius: 8)
            .padding(.top, 20)
            .navigationBarTitle("Home Page")
            
            Text("Weekly Workout Plan")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
                .offset(x: -35, y: 0)
            
            
            
            Button("Add a new workout routine", action: {
                let workoutRoutine = WorkoutRoutine(context: managedObjectContext)
                workoutRoutine.title = "Push ups"
                PersistenceController.shared.save()
            })
            .offset(x: -100, y: -20)
            
            
            
            Spacer()
            
            
            ScrollView(.horizontal, showsIndicators: true, content: {
                
                ZStack {
                    HStack {
                        
                        ForEach(workoutRoutines) { workoutRoutine in
                            VStack{
                                NavigationLink(destination: MyWorkOutPageView(workoutRoutine: workoutRoutine)) {
                                    Text("Workout")
                                        .font(.title)
                                        .foregroundColor(.red)
                                }
                                Spacer()
                                
                                
                                
                                NavigationLink(destination: EditWorkoutRoutineView(exercises: Exercise, workoutRoutine: workoutRoutine)) {
                                    Text("Edit")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(10)
                            .frame(width: 140, height: 240)
                            .background(Color(.green))
                            .clipped()
                            .cornerRadius(30)
                            .shadow(radius: 8)
                        }
                        // .onDelete(perform: delete)
                    }
                }
            })
            .padding(.leading, 10)
            .padding(.trailing, 20)
            
        
            Spacer()
            Spacer()
            Spacer()
        }
    }
}



struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
