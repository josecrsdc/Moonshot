//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Jose carlos Rodriguez on 4/12/22.
//

import SwiftUI

struct ListLayoutView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(mission.formattedLaunchDate)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.85))
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}

struct ListLayoutView_Previews: PreviewProvider {
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        ListLayoutView(missions: missions, astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
