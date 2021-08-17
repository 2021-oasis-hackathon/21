//
//  MemoryWithStar.swift
//  oasis
//
//  Created by 최은기 on 2021/08/16.
//

import SwiftUI

struct MemoryWithStarView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var isAnimating = false
//    var season: String = "spring"
    
    var body: some View {
        
        Image(uiImage:UIImage(named: "SpringBackgroundImage") ?? UIImage(named: "placeHolderImage")!)
            .ignoresSafeArea()
            .overlay(
                ZStack{
                    HStack{
                        VStack(alignment: .leading){
                            Button(action: {
                                withAnimation {
                                    viewRouter.currentPage = .page2
                                }
                            }, label: {
                                Image(uiImage:UIImage(named: "goBackBtnWhite") ?? UIImage(named: "placeHolderImage")!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 12, height: 15)
                            })
                            Spacer()
                        }
                        Spacer()
                        
                    }.offset(x:30, y:60)
                    
                    VStack(alignment: .center){
                        Text("봄의 대삼각형")
                            .foregroundColor(.white)
                            .tracking(-1)
                            .font(.custom("NotoSansKR-Regular", size: 20))
                            .offset(y:UIScreen.screenHeight * 0.196)
                        Spacer()
                    }
                    
                    //MARK: - Image
                    Image(uiImage:UIImage(named: "springImage") ?? UIImage(named: "placeHolderImage")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.screenWidth*0.6493, height: UIScreen.screenHeight*0.2451, alignment: .center)
                    
                    HStack{
                        Button(action: {
                            withAnimation {
                                viewRouter.currentPage = .page2
                            }
                        }, label: {
                            Image(uiImage:UIImage(named: "goBackBtnWhite") ?? UIImage(named: "placeHolderImage")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 12, height: 20)
                                .offset(x:20)
                        })
                        Spacer()
                        Button(action: {
                            withAnimation {
                                viewRouter.currentPage = .page2
                            }
                        }, label: {
                            Image(uiImage:UIImage(named: "goBackBtnWhiteReverse") ?? UIImage(named: "placeHolderImage")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 12, height: 20)
                                .offset(x:-20)
                        })
                        
                    }
                    VStack{
                        Spacer()
                        VStack{
                            Text("추억 한장 남겨볼까요")
                                .foregroundColor(.white)
                                .tracking(-1)
                                .font(.custom("NotoSansKR-Regular", size: 20))
                            Image(uiImage:UIImage(named: "goDownBtn") ?? UIImage(named: "placeHolderImage")!)
                        }
                    }
                    .offset(y:-90)
                })
            .onAppear() // add animation

    }
}

struct MemoryWithStar_Previews: PreviewProvider {
    static var previews: some View {
        MemoryWithStarView().environmentObject(ViewRouter())
    }
}
