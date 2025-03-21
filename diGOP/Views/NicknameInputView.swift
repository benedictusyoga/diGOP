//
//  NicknameInputView.swift
//  diGOP
//
//  Created by Benedictus Yogatama Favian Satyajati on 20/03/25.
//

import SwiftUI

struct NicknameInputView: View {
    @State private var nickname: String = ""
    @State private var navigateToPlaceholder = false
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20){
                LogoView(offset: -10)
                VStack (spacing: 2){
                    Text("We'd love to address you properly")
                        .font(.subheadline)
                    Text("What's your preferred name?")
                        .font(.title3)
                }
                
                TextField("Nickname", text: $nickname)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .autocorrectionDisabled(true)
                Button("Submit", action: {
                    //                print("Nickname: \(nickname)")
//                    UserDefaults.standard.set(nickname, forKey: "nickname")
//                    UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
//                    navigateToPlaceholder = true
                    if !nickname.isEmpty{
                        let newNickname = Nickname(name: nickname)
                        modelContext.insert(newNickname)
                        try? modelContext.save()
                        navigateToPlaceholder = true
                    }
                })
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 50)
            }
            .padding()
            .navigationDestination(isPresented: $navigateToPlaceholder){
                PlaceholderView()
            }
        }
    }
}

#Preview {
    NicknameInputView()
}
