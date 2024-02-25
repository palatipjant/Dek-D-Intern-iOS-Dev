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
        if UIDevice.current.userInterfaceIdiom == .phone {
            TabView(selection: $currentIndex) {
                ForEach(0..<viewModel.banner.count, id: \.self) { index in
                    MovieRemoteImage(urlString: viewModel.banner[currentIndex].payload?.imageUrl?.mobile ?? "place-holder")
                        .scaledToFill()
                }
            }
            .modifier(bannermodi(currentIndex: $currentIndex, banner_count: viewModel.banner.count))
            HStack{
                ForEach(0..<viewModel.banner.count) { index in
                    Circle()
                        .fill(self.currentIndex == index ? Color("main") : .gray)
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.bottom, 12)
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            TabView(selection: $currentIndex) {
                ForEach(0..<viewModel.banner.count, id: \.self) { index in
                    MovieRemoteImage(urlString: viewModel.banner[currentIndex].payload?.imageUrl?.tablet ?? "place-holder")
                        .scaledToFill()
                }
            }
            .modifier(bannermodiPad(currentIndex: $currentIndex, banner_count: viewModel.banner.count))
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
}

#Preview {
    BannerView()
}
