//
//  CardView.swift
//  Dek-D-Intern
//
//  Created by Palatip Jantawong on 21/2/2567 BE.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var viewModel: NovelsListViewModel
    var novel: NovelList
    var indic: Int
    
    @State var show_badge = false
    @State var color_badge: Color = .yellow
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                MovieRemoteImage(urlString: novel.novel?.thumbnail?.normal ?? "place-holder")
                    .frame(width: 100, height: 140)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.trailing, 10)
                VStack(alignment: .leading, spacing: 1){
                    HStack{
                        Capsule()
                            .fill(.clear)
                            .strokeBorder(Color("main"), lineWidth: 1)
                            .frame(width: 42, height: 22)
                            .overlay {
                                HStack{
                                    if show_badge {
                                        Image(systemName: "crown.fill")
                                            .resizable()
                                            .foregroundStyle(color_badge)
                                            .frame(width: 12, height: 12)
                                    }
                                    Text(String(indic))
                                        .fontWeight(.medium)
                                        .font(.system(size: 12))
                                        .foregroundStyle(Color("main"))
                                }
                            }
                        Spacer()
                    }
                    Text(novel.novel?.title ?? "Title Missing")
                        .font(.title2)
                        .bold()
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, minHeight: 75, alignment: .leading)
                    Text(novel.novel?.category?.mainTitle ?? "Value Missing")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(Color("main"))
                        .frame(alignment: .leading)
                        .lineLimit(1)
                    Text(novel.novel?.owners?.first?.alias ?? "Value Missing")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.gray)
                        .frame(alignment: .leading)
                        .lineLimit(1)
                    
                }
            }
            .padding(.horizontal, 12)
            HStack{
                RoundedRecCOMP(value: novel.novel?.totalChapter ?? 0,
                               icon: "list.bullet")
                RoundedRecCOMP(value: novel.novel?.engagement?.view?.overall ?? 0,
                               icon: "eye.fill")
                RoundedRecCOMP(value: novel.novel?.engagement?.comment?.overall ?? 0,
                               icon: "bubble.fill")
            }
            .padding(.leading,10)
            Text(novel.novel?.description ?? "")
                .font(.subheadline)
                .padding(.horizontal, 12)
                .lineLimit(4)
            
            ScrollView(.horizontal){
                HStack {
                    ForEach(novel.novel?.tags ?? ["tag1"], id:\.self) { tag in
                        Text(tag)
                            .padding(.horizontal, 7)
                            .font(.system(size: 12))
                            .frame(height: 26, alignment: .leading)
                            .foregroundStyle(.gray)
                            .overlay {
                                RoundedRectangle(cornerRadius: 4)
                                    .strokeBorder(Color("white smoke"), lineWidth: 1)
                                    .foregroundStyle(.clear)
                            }
                    }
                }
                .padding(.leading, 12)
            }
            .frame(height: 26, alignment: .leading)
            .scrollIndicators(.hidden)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 1)
                .frame(maxWidth: .infinity, minHeight: 329)
        )
        .frame(maxWidth: .infinity, minHeight: 329)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 12)
        .padding(.bottom, 12)
        .onAppear(perform: {
            checkColor(indic: indic)
        })
    }
    func checkColor(indic: Int) {
        switch indic{
        case 1:
            show_badge = true
            color_badge = .yellow
        case 2:
            show_badge = true
            color_badge = .brown
        case 3:
            show_badge = true
            color_badge = .gray
        default:
            show_badge = false
            color_badge = .clear
        }
    }
}

#Preview {
    CardView(novel: Mockdata.sampledata, indic: 1)
}

struct RoundedRecCOMP: View {
    
    var value: Int
    var icon: String
    
    var body: some View {
        Capsule()
            .fill(.clear)
            .overlay {
                HStack(){
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .frame(width: 12.83, height: 12.83)
                    Text(value, format: .number.notation(.compactName))
                        .fontWeight(.regular)
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                }
            }
            .frame(width: 50 ,height: 17)
    }
}

