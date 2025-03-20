//
//  SplashScreen.swift
//  diGOP
//
//  Created by Benedictus Yogatama Favian Satyajati on 20/03/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var moveUp = false
    @State private var bounceDown = false
    @State private var floatUp = false
    
    var body: some View {
        VStack{
            if isActive{
                NicknameInputView()
                    
            }else{
                VStack{
                    Spacer()
                    LogoView(offset: moveUp ? (bounceDown ? -20 : -50) : 0)
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
                        .offset(y:floatUp ? -25 : 0)
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

#Preview {
    SplashScreenView()
}
