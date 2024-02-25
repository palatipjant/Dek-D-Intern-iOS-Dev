//
//  NovelsListView.swift
//  Dek-D-Intern
//
//  Created by Palatip Jantawong on 21/2/2567 BE.
//

import SwiftUI

struct NovelsListView: View{
    
    @EnvironmentObject var viewModel: NovelsListViewModel
    @State var visibleNovel: Set<Int> = Set()
    @State private var currentIndex = 0
    
    var body: some View{
        ScrollViewReader { proxy in
            NavigationStack{
                ZStack{
                    ScrollView{
                        Color("bg")
                            .ignoresSafeArea()
                        LazyVStack{
                            ForEach(viewModel.novels.indices, id: \.self) { i in
                                let novel = viewModel.novels[i]
                                CardView(novel: novel, indic: i+1)
                                    .id(i)
                                    .onAppear{
                                        visibleNovel.insert(i)
                                    }
                                    .onDisappear{
                                        visibleNovel.remove(i)
                                    }
                                if i == 2{
                                    BannerView()
                                }
                            }
                        }
                        .padding(.top, 20)
                    }
                    VStack{
                        Spacer()
                        let selectedNovel = 1
                        if !visibleNovel.contains(selectedNovel){
                            Button(action: {
                                withAnimation(.easeIn(duration: 1.0)) {
                                    proxy.scrollTo(0)
                                }
                            }, label: {
                                Label("กลับขึ้นด้านบน", systemImage: "arrow.up")
                                    .foregroundStyle(.white)
                                    .frame(width: 160, height: 45)
                                    .background(Color("main"))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            })
                        }
                    }
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("รายการนิยาย")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
                .toolbarBackground(Color("main"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
        }
        .task {
            viewModel.getBanner()
            viewModel.getNovel(page: 1)
            viewModel.getNovel(page: 2)
            viewModel.getNovel(page: 3)
            viewModel.getNovel(page: 4)
            viewModel.getNovel(page: 5)
            
        }
    }
}


#Preview {
    NovelsListView()
}
