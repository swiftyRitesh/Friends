//
//  ContentView.swift
//  Friends
//
//  Created by Ritesh Sathiyamoorthi on 26/6/21.
//

import SwiftUI

struct ContentView: View {
    
    var friends = [Friend(name: "Ritesh",
                           icon: "paperplane.fill",
                           school: "PHSS",
                           slothImage: "sloth3"),
                    Friend(name: "Jia Chen",
                           icon: "swift",
                           school: "Ngee Ann Poly",
                           slothImage: "sloth2"),
                    Friend(name: "Mr 🔜",
                           icon: "zzz",
                           school: "Tinkercademy",
                           slothImage: "sloth1")]
    
    var body: some View {
        
            List(friends) {
                friend in
                Image(systemName: friend.icon)
                
                VStack(alignment: .leading) {
                    Text(friend.name)
                        .bold()
                    Text(friend.school)
                }
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
