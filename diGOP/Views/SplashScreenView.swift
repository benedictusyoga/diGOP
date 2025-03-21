//
//  SplashScreen.swift
//  diGOP
//
//  Created by Benedictus Yogatama Favian Satyajati on 20/03/25.
//

// test push
import SwiftUI
import SwiftData

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var moveUp = false
    @State private var bounceDown = false
    @State private var floatUp = false
    @Query private var nicknames: [Nickname]
    
    var body: some View {
        NavigationStack {
            VStack{
                if isActive{
                    if let nickname = nicknames.first?.name, !nickname.isEmpty{
                        PlaceholderView()
                    }else{
                        NicknameInputView()
                    }
                    
                }else{
                    VStack{
                        Spacer()
                        LogoView(offset: moveUp ? (bounceDown ? -10 : -50) : 0)
                            .animation(.easeInOut(duration: 0.8), value: moveUp)
                            .animation(.interpolatingSpring(stiffness: 100, damping: 10), value: bounceDown)
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                                    moveUp = true
                                    DispatchQueue.main.asyncAfter(deadline: .now()+0.8){
                                        bounceDown = true
                                        DispatchQueue.main.asyncAfter(deadline: .now()+0.8){
                                            floatUp = true
                                            DispatchQueue.main.asyncAfter(deadline: .now()+0.8){
                                                isActive = true
                                            }
                                        }
                                    }
                                }
                            }
                            .offset(y:floatUp ? -35 : 0)
                            .animation(.easeInOut(duration: 0.6).delay(0.2), value: floatUp)
                        Text("Welcome to")
                            .font(.subheadline)
                        Text("diGOP")
                            .font(.system(size: 60, weight: .bold))
                        Spacer()
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    SplashScreenView()
}
