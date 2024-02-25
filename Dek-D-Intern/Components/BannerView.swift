//
//  BannerView.swift
//  Dek-D-Intern
//
//  Created by Palatip Jantawong on 26/2/2567 BE.
//

import SwiftUI

struct BannerView: View {
    
    @EnvironmentObject var viewModel: NovelsListViewModel
    @State var currentIndex = 0
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<viewModel.banner.count, id: \.self) { index in
                MovieRemoteImage(urlString: viewModel.banner[currentIndex].payload?.imageUrl?.mobile ?? "place-holder")
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 12)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 178)
        .tabViewStyle(PageTabViewStyle())
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { timer in
                currentIndex = (currentIndex + 1) % viewModel.banner.count
            }
        }
        HStack{
            ForEach(0..<viewModel.banner.count) { index in
                Circle()
                    .fill(self.currentIndex == index ? Color("main") : .gray)
                    .frame(width: 10, height: 10)
            }
        }
        .padding(.bottom, 12)
    }
}

#Preview {
    BannerView()
}
