//
//  FriendDetailView.swift
//  Friends
//
//  Created by Ritesh Sathiyamoorthi on 26/6/21.
//

import SwiftUI

struct FriendDetailView: View {
    @Binding var friend: Friend
    @Environment(\.openURL) var openURL
    var body: some View {
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [.yellow, .green, .blue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .aspectRatio(contentMode: .fill)
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            
            
            ScrollView {
                
                VStack(spacing: 0) {
                    Image(friend.slothImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                    
                    Image(friend.name)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .mask(Circle())
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 8)
                                .foregroundColor(.white)
                        )
                        .offset(x: 0, y: -250 / 2)
                        .shadow(radius: 6)
                        .padding(.bottom, -250 / 2)
                        .onTapGesture {
                            openURL(friend.link)
                        }
                    
                    HStack {
                        ForEach (friend.type, id: \.rawValue) { type in
                            Label(type.rawValue, systemImage: type.getSymbolName())
                                .padding(10)
                                .background(Color.blue)
                                .cornerRadius(15)
                        }
                    }
                    .padding()
                    
                    
                    Text("\(Image(systemName: friend.icon)) \(friend.school)")
                        .font(.system(size: 24))
                    
                    VStack {
                        Text("Attack")
                        Slider(value: $friend.attack,
                               in: 0...30,
                               step: 1)
                        Text("Defence")
                        Slider(value: $friend.defence,
                               in: 0...30,
                               step: 1)
                    }
                    .frame(width: 400)
                    .padding(.vertical)
                    .scaledToFit()
                                        
                    Spacer()
                    
                }
                .navigationTitle(friend.name)
            }
            .scaledToFit()
            
        }
    }
    
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: .constant(
                            Friend(name: "Jia Chen",
                                   icon: "pc",
                                   school: "Tinkercademy",
                                   slothImage: "sloth1",
                                   link: URL(string: "https://shorturl.at/stuA7")!,
                                   attack: 10,
                                   defence: 15,
                                   type: [.grass, .electric])))
    }
}
