//
//  PlaceholderView.swift
//  diGOP
//
//  Created by Benedictus Yogatama Favian Satyajati on 21/03/25.
//

import SwiftUI
import SwiftData

struct PlaceholderView: View {
    @Query private var nicknames: [Nickname]
    @State private var newName: String = ""
    @State private var isEditing: Bool = false
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            Text("This is a placeholder page")
            if let nickname = nicknames.first?.name{
                Text("Hello, \(nickname)")
            }else{
                Text("Hello!")
            }
            
            Divider().padding()

            Text("List of Saved Nicknames:")
                .font(.headline)

            List(nicknames) { nickname in
                Text(nickname.name ?? "null")
            }
            
            if isEditing{
                TextField("Enter new nickname", text: $newName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save", action: {
                    if let existingNickname = nicknames.first{
                        existingNickname.name = newName
                        do{
                            try modelContext.save()
                            isEditing = false
                            newName = ""
                        }catch{
                            print("Error saving nickname")
                        }
                        
                    }
                })
                .buttonStyle(.borderedProminent)
            }else{
                Button("Edit nickname", action: {
                    isEditing = true
                    newName = nicknames.first?.name ?? ""
                })
                .buttonStyle(.bordered)
            }
        }
        
    }
}

#Preview {
    PlaceholderView()
}
