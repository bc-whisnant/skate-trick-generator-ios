//
//  ContentView.swift
//  Skate-Tricks
//
//  Created by bumblebee on 3/31/25.
//

import SwiftUI

struct ContentView: View {
    @State var flipTricks = [
        "pop shove it",
        "180",
        "frontside 180",
        "backside 180",
        "kickflip",
        "heelflip",
        "varial flip",
        "varial heel",
        "360 flip",
        "backside bigspin",
        "frontside bigspin",
        "frontside flip",
        "backside flip",
        "frontside heelflip",
        "backside heelflip",
        "laser flip",
        "frontside 360",
        "backside 360",
        "backside 360 kickflip",
        "frontside 360 kickflip",
        "backside 360 heelflip",
        "frontside 360 heelflip",
        "hardflip"
    ]
    
    @State var stances = [
        "",
        "switch",
        "fakie",
        "nollie"
    ]

    @State var grinds = [
        "boardslide",
        "50-50",
        "5-0",
        "nosegrind",
        "crook",
        "smith",
        "feeble",
        "overcrook",
        "suski",
        "salad",
        "blunt",
        "noseblunt",
        "noseslide",
        "tailslide",
        "lipslide",
    ]
    
    @State var stance = ""
    @State var trick = ""
    @State var chosenTrick = ""
    @State var chosenGrind = ""
    
    var body: some View {
            
    
        TabView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Image("skate-wheel")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 400)
                    
                    Text(chosenTrick != "" ? "\(chosenTrick.uppercased())" : "Pick a Random Trick").font(.title3).padding(.bottom).foregroundStyle(.white)
                    Button(action: generateRandomTrick) {
                        Text("Generate Random Trick").font(.title2)
                    }
                }
            }
            
            .tabItem {
                Image(systemName: "1.circle")
                Text("Flip Tricks")
            }
            .tag(1)
            ZStack {
                Color.black.ignoresSafeArea()
                
                
                VStack {
                    Image("skate-truck")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 400)
                    Text(chosenGrind != "" ? "\(chosenGrind.uppercased())" : "Pick a Random Grind").font(.title3).padding(.bottom).foregroundStyle(.white)
                    Button(action: generateRandomGrind) {
                        Text("Generate Random Grind").font(.title2)
                    }
                }
            }
            .tabItem {
                Image(systemName: "2.circle")
                Text("Grinds")
            }
            .tag(2)
        }.onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
    }
    
    func generateRandomTrick() {
        stance = stances.randomElement()!
        trick = flipTricks.randomElement()!
        chosenTrick = stance + " " + trick
    }
    
    func generateRandomGrind() {
        stance = stances.randomElement()!
        trick = grinds.randomElement()!
        chosenGrind = stance + " " + trick
        
    }
}

#Preview {
    ContentView()
}
