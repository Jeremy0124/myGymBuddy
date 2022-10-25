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
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var workingRoutineToEditModally: WorkoutRoutine?
    @State private var isEditable = false
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Spacer()
                    NavigationLink(destination: WarmUpPageView()) {
                        Image("warm-ups")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                    }
                }
                if #available(iOS 16.0, *) {
                    Text("Warm ups")
                        .padding(.top, 250)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300)
                } else {
                    // Fallback on earlier versions
                }
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
                _ = WorkoutRoutine(context: managedObjectContext)
                PersistenceController.shared.save()
            })
            .offset(x: -95, y: -20)
            
            ScrollView(.horizontal, showsIndicators: true, content: {
                ZStack {
                    HStack {
                        ForEach(workoutRoutines) { workoutRoutine in
                            VStack{
                                NavigationLink(destination: MyWorkOutPageView(workoutRoutine: workoutRoutine)) {
                                    VStack {
                                        Text(workoutRoutine.title ?? "New Workout")
                                            .font(.title)
                                            .foregroundColor(.white)
                                        Spacer()
                                        Button("Edit") {
                                            workingRoutineToEditModally = workoutRoutine
                                        }
                                    }
                                }
                            }
                            .background(
                                Image("fit")
                                    .resizable()
                                    .frame(width: 140, height: 240)
                            )
                            .padding(10)
                            .frame(width: 140, height: 240)
                            .clipped()
                            .cornerRadius(30)
                            .shadow(radius: 8)
                            .onDrag {
                                return NSItemProvider()
                            }
                            .contextMenu {
                                Button(action: {
                                    CoreDataHelper.shared.deleteWorkOutRoutine(workoutRoutine: workoutRoutine)
                                }, label: {
                                    HStack {
                                        Text("Delete")
                                        Image(systemName: "trash")
                                    }
                                })
                            }
                        }
                    }
                }
            })
            .padding(.leading, 10)
            .padding(.trailing, 20)
            .sheet(item: $workingRoutineToEditModally, content: { workoutRoutine in
                EditWorkoutRoutineView(workoutRoutine: workoutRoutine)
            })
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
