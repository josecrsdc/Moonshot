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
    let typesView = ["List", "Grid"]
    @State private var viewSelected = "List"
    
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Picker("", selection: $viewSelected) {
                        ForEach(typesView, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Spacer()
                }
                .padding()
                if viewSelected == "Grid" {
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

enum TypeView {
    case list, grid
}
