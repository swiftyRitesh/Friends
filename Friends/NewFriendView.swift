//
//  NewFriendView.swift
//  Friends
//
//  Created by Ritesh Sathiyamoorthi on 10/7/21.
//

import SwiftUI

struct NewFriendView: View {
    @State var friend = Friend(name: "",
                               icon: "triangle",
                               school: "",
                               slothImage: "sloth3",
                               link: URL(string: "https://google.com")!,
                               attack: 0,
                               defence: 0,
                               type: [.normal])
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Information")) {
                    TextField("Name", text: $friend.name)
                    TextField("School", text: $friend.school)
                    
                    HStack {
                        Image(systemName: friend.icon)
                        TextField("Icon", text: $friend.icon)
                            .autocapitalization(.none)
                    }
                    
                    HStack {
                        TextField("Sloth Image", text: $friend.slothImage)
                            .autocapitalization(.none)
                        Image("\(friend.slothImage)")
                            .resizable()
                            .scaledToFill()
                            //.mask(Circle())
                            .frame(width: 50, height: 30, alignment: .center)
                            .mask(Circle())
                            .offset(x:20)
                            .padding(.all)
                            

                    }
                }
            }
                .navigationTitle("New Friend")
        }
    }
}

struct NewFriendView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendView()
    }
}
