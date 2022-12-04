//
//  ContentView.swift
//  Moonshot
//
//  Created by Jose carlos Rodriguez on 24/11/22.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Toggle(isOn: $showingGrid) {
                        Text(showingGrid ? "List" : "Grid")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(width: 100)
                    Spacer()
                }
                .padding()
                if showingGrid {
                    GridLayoutView(missions: missions, astronauts: astronauts)
                } else {
                    ListLayoutView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
