//
//  BannerSize + ext.swift
//  Dek-D-Intern
//
//  Created by Palatip Jantawong on 26/2/2567 BE.
//

import SwiftUI

struct bannermodi: ViewModifier {
    
    @Binding var currentIndex:Int
    var banner_count: Int
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: 178)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .tabViewStyle(PageTabViewStyle())
            .onAppear{
                Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { timer in
                    currentIndex = (currentIndex + 1) % banner_count
                }
            }
            .padding(.horizontal, 14)
    }
}

struct bannermodiPad: ViewModifier {
    
    @Binding var currentIndex:Int
    var banner_count: Int
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: 248)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .tabViewStyle(PageTabViewStyle())
            .onAppear{
                Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { timer in
                    currentIndex = (currentIndex + 1) % banner_count
                }
            }
            .padding(.horizontal, 14)
    }
}
