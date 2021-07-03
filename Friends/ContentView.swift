import SwiftUI

struct ContentView: View {
    
    @State var friends = [
        Friend(name: "Ritesh",
               icon: "paperplane.fill",
               school: "PHSS",
               slothImage: "sloth3",
               link: URL(string: "https://shorturl.at/stuA7")!,
               attack: 15,
               defence: 15,
               type: [.fire, .electric]),
        
        Friend(name: "Jia Chen",
               icon: "zzz",
               school: "Ngee Ann Poly",
               slothImage: "sloth2",
               link: URL(string: "https://shorturl.at/stuA7")!,
               attack: 10,
               defence: 15,
               type: [.grass, .electric]),
        
        Friend(name: "Mr 🔜",
               icon: "swift",
               school: "Tinkercademy",
               slothImage: "sloth1",
               link: URL(string: "https://shorturl.at/stuA7")!,
               attack: 5,
               defence: 5,
               type: [.water, .electric]),
        
        Friend(name: "Attendence Form",
               icon: "pencil",
               school: "Attendence Form Secondary School",
               slothImage: "attendenceForm",
               link: URL(string: "http://tk.sg/swift2021attendance")!,
               attack: 30,
               defence: 30,
               type: [.electric, .fire, .grass, .ice, .water])
    ]
    
    var body: some View {
        NavigationView {
            List(0..<friends.count) { index in
                NavigationLink(destination: FriendDetailView(friend: $friends[index])) {
                    Image(systemName: friends[index].icon)
                    
                    VStack(alignment: .leading) {
                        Text(friends[index].name)
                            .bold()
                        HStack {
                            Text(friends[index].school)
                            
                            Spacer()
                            
                            ForEach(friends[index].type, id:\.rawValue) { type in
                                Image(systemName: type.getSymbolName())
                            }
                            }
                        }
                    }
                }
                .navigationTitle("Friends")
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
