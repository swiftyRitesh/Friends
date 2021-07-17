//
//  NewFriendView.swift
//  Friends
//
//  Created by Ritesh Sathiyamoorthi on 10/7/21.
//

import SwiftUI
import Foundation

struct NewFriendView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var friends: [Friend]
    @Binding var text: String
    
    @State var isDiscard = false
    @State var friend = Friend(name: "",
                               icon: "triangle",
                               school: "",
                               slothImage: "sloth3",
                               link: URL(string: "https://google.com")!,
                               attack: 0,
                               defence: 0,
                               type: [.normal])
    
    public var FilteredSymbols : [String] = []
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Information")) {
                    TextField("Name", text: $friend.name)
                    TextField("School", text: $friend.school)
                    
                    HStack {
                        Image(systemName: friend.icon)
                        
                        TextField("icon", text: $friend.icon)
                            .autocapitalization(.none)
                        
                        Picker("", selection: $friend.icon) {
                            TextField("Search", text: $text)
                            
                            ForEach (symbols, id: \.self) { symbol in
                                
                                if symbol.contains("\(text)") {
                                    FilteredSymbols.append("1")
                                }
                            }
                            
                            ForEach(symbols, id: \.self) { symbol in
                                
                                HStack {
                                    Text("\(symbol)")
                                        .tag("\(symbol)")
                                    
                                    Spacer()
                                    
                                    Image(systemName: "\(symbol)")
                                    
                                }
                                .padding(5)
                            }
                        }
                        
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
                
                Section(header: Text("Attributes")) {
                    Picker("Type", selection: $friend.type[0]) {
                        Text("normal")
                            .tag(FriendType.normal)
                        Text("fire")
                            .tag(FriendType.fire)
                        Text("water")
                            .tag(FriendType.water)
                        Text("grass")
                            .tag(FriendType.grass)
                        Text("electric")
                            .tag(FriendType.electric)
                        Text("ice")
                            .tag(FriendType.ice)
                    }
                    
                    HStack {
                        Text("Attack")
                            .frame(width:100, alignment: .leading)
                        
                        Slider(value: $friend.attack,
                               in: 0...30,
                               step: 1)
                    }
                    
                    HStack {
                        Text("Defence")
                            .frame(width:100, alignment: .leading)
                        
                        Slider(value: $friend.defence,
                               in: 0...30,
                               step: 1)
                    }
                }
                
                Section {
                    Button("Save") {
                        friends.append(friend)
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    HStack {
                        Button("Discard Changes") {
                            presentationMode.wrappedValue.dismiss()
                            isDiscard = true
                        }
                        .foregroundColor(.red)
                        
                        
                        Spacer()
                        Image(systemName: "trash")
                            .foregroundColor(.black)
                        
                    }
                    
                    
                }
            }
            .navigationTitle("New Friend")
        }
    }
}

struct NewFriendView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendView(friends: .constant([]), text: .constant(""))
    }
}
