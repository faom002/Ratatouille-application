import SwiftUI

struct SplashScreenView: View {
    @State private var rotation: Double = 0.0
    @State private var chefHatOffsetY: CGFloat = -300.0
    @State private var shouldNavigate: Bool = false
    
    @AppStorage("isDarkModeOn") private var isDarkMode = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            
            
            Image("rataouille")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .rotationEffect(Angle(degrees: rotation))
            
            Image("chef-hat")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .offset(x: -3)
                .rotationEffect(Angle(degrees: -30.0))
                .offset(y: chefHatOffsetY)
                .onAppear {
                    withAnimation(Animation.linear(duration: 2.0).repeatCount(1)) {
                        self.rotation = 360.0
                    }
                    
                    
                    withAnimation(Animation.linear(duration: 2.0)) {
                        self.chefHatOffsetY = -120.0
                    }
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.shouldNavigate = true
                    }
                }
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .fullScreenCover(isPresented: $shouldNavigate) {
            MainTabView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
