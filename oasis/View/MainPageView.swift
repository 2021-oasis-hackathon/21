import SwiftUI

struct MainPageView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var helperState = false
    
    
    
    var body: some View {
        
        // MARK: BackGround Photo Part
        ZStack{
            GeometryReader{ matrics in
                VStack(){
                Image(uiImage:UIImage(named: "mainpage-header") ?? UIImage(named: "placeHolderImage")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    
                    // MARK: Be ready to Start Part
                    HStack(alignment: .top, spacing: nil){
                        HStack{
                            Image(uiImage:UIImage(named: "starImg") ?? UIImage(named: "placeHolderImage")!)
                            Text("출발 준비 완료").font(.custom("NotoSansKR-Bold", size: 13))
                        }
                        Spacer() // go left
                    }
                    .offset(x:24, y: -20)
                    
                    // MARK: Square Layout
                    VStack{
                        HStack{
                            //MARK: - FindMyStarView
                            Button(action: {
                                withAnimation {
                                    viewRouter.currentPage = .page4
                                }
                            }, label: {
                                SquareView("추천 별빛", "별빛따라가 추천하는 여행 코스를 찾아봐요", (UIImage(named:"airplane") ?? UIImage(named: "placeHolderImage"))!)
                            }).buttonStyle(PlainButtonStyle())
                            //MARK: - MyStarView
                            Button(action: {
                                withAnimation {
                                    viewRouter.currentPage = .page3
                                }
                            }, label: {
                                SquareView("나의 별빛", "내게 딱 맞는 별빛을 찾으러 가요", (UIImage(named:"starIcon") ?? UIImage(named: "placeHolderImage"))!)
                            }).buttonStyle(PlainButtonStyle())

                        }
                        
                        // MARK: Memory with star Part
                        
                        Button(action: {
                            withAnimation {
                                viewRouter.currentPage = .page5
                            }
                        }, label: {
                            ZStack {
                                Text("별과의 추억")
                                    .foregroundColor(.black)
                                    .font(.custom("NotoSansKR", size: 14))
                                    .zIndex(1.0)
                                    .offset(x: -65.5, y: -10)
                                
                                Text("별에 있는 나의 추억을 되짚어 보아요")
                                    .tracking(-0.8)
                                    .font(.custom("NotoSansKR", size: 10))
                                    .offset(x:-22, y: 7)
                                    .frame(width: 150, height: 39, alignment: .leading )
                                
                                Image(uiImage:UIImage(named: "photo") ?? UIImage(named: "placeHolderImage")!)
                                    .resizable()
                                    .zIndex(1.0)
                                    .frame(width: 50, height: 60)
                                    .offset(x:80, y:0)
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(hue: 0, saturation: 0, brightness: 0.93).opacity(0.5))

                                RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color(hue: 0, saturation: 0, brightness: 0.93).opacity(0.5), lineWidth: 0.5)

                            }
                            .compositingGroup()
                            .frame(width: 318, height: 72)
                        }).buttonStyle(PlainButtonStyle())
                        
                    }
                    
                    // MARK: See Star Now Part
                    HStack(alignment: .top, spacing: nil){
                        ZStack{
                            HStack{
                                Image(uiImage:UIImage(named: "starImg") ?? UIImage(named: "placeHolderImage")!)
                                Text("지금 별 보러 가요").font(.custom("NotoSansKR-Bold", size: 13))
                                Button(action: {
                                    withAnimation {
                                        helperState.toggle()
                                    }
                                }, label: {
                                    Circle()
                                        .strokeBorder(Color(hue: 245, saturation: 0.54, brightness: 0.9).opacity(0.5) , lineWidth: 1)
                                        .frame(width: 14, height: 14)
                                        .foregroundColor(.white)
                                        .overlay(Text("?")
                                                    .font(.custom("NotoSansKR-Bold", size: 9)))
                                }).buttonStyle(PlainButtonStyle())
                                Spacer()
                                //Rectangle 45
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .strokeBorder(Color(hue: 245, saturation: 0.54, brightness: 0.9).opacity(0.5))
                                        .offset(x: -40)
                                    Text("광주광역시")
                                        .font(.custom("NotoSansKR", size: 10))
                                        .offset(x: -39, y:0.5)
                                }
                                .frame(width: 75, height: 14)
                                
                            }
                            .offset(x:24, y: 15)
                        }

                        Spacer()
                    }
                    Button(action: {
                        withAnimation {
                            viewRouter.currentPage = .page10
                            
                        }
                    }, label: {
                        RectangleBottomBox("1","중대리계곡", "#전남 구례군")
                            .offset(y: 35.0)
                    }).buttonStyle(PlainButtonStyle())
                    Button(action: {
                        withAnimation {
                            viewRouter.currentPage = .page10
                            
                        }
                    }, label: {
                        RectangleBottomBox("2","백수해안도로", "#전남 영광군")
                            .offset(y: 40.0)
                    }).buttonStyle(PlainButtonStyle())
                    Button(action: {
                        withAnimation {
                            viewRouter.currentPage = .page10
                            
                        }
                    }, label: {
                        RectangleBottomBox("3","평승내들", "#전남 담양군")
                            .offset(y: 45.0)
                    }).buttonStyle(PlainButtonStyle())
                    
                    
                Spacer()
                Spacer()
                }
            }
            if (helperState == true){
                Image("mainPageHelper").offset(x: 40, y: 168)
            }
            
            
        }
        .onTapGesture {
            if (helperState == true){
                helperState = false
            }
        }
    }
}


// MARK: Square Block
struct SquareView: View {
    
    private var title: String
    private var content: String
    private var img: UIImage

    init(_ title: String, _ content: String, _ img: UIImage) {
        self.title = title
        self.content = content
        self.img = img
    }
    
    var body: some View{
        ZStack {
            Text(title)
                .foregroundColor(.black)
                .font(.custom("NotoSansKR", size: 14))
                .zIndex(1.0)
                .offset(x: -40, y: -40)
            
            Text(content)
                .tracking(-0.5)
                .font(.custom("NotoSansKR", size: 10))
                .offset(x:-21, y: -10)
                .frame(width: 89, height: 39, alignment: .leading )
            
            
            Image(uiImage: img)
                .resizable()
                .zIndex(1.0)
                .frame(width: 44, height: 44)
                .offset(x: 40, y: 40)
        
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(hue: 0, saturation: 0, brightness: 0.93).opacity(0.5))

            RoundedRectangle(cornerRadius: 20)
            .strokeBorder(Color(hue: 0, saturation: 0, brightness: 0.93).opacity(0.5), lineWidth: 0.5)
        }
        .compositingGroup()
        .frame(width: 155, height: 145)
        .shadow(color: Color(hue: 0, saturation: 0, brightness: 0.93).opacity(0.5), radius:2, x:2, y:2)
    }
}


struct RectangleBottomBox: View{
    
    private var number: String
    private var title: String
    private var content: String
    
    init(_ number: String, _ title: String, _ content: String) {
        self.number = number
        self.title = title
        self.content = content
    }
    
    var body: some View{
        ZStack {
            ZStack{
                Circle()
                    .fill(Color(#colorLiteral(red: 0.45490196347236633, green: 0.4156862795352936, blue: 0.8980392217636108, alpha: 1)))
                    .frame(width: 25, height: 25)
                Text(number)
                    .font(.custom("NotoSansKR-Bold", size: 10))
                    .foregroundColor(.white)
                
            }
            .zIndex(1.0)
            .offset(x: -90)
            
            VStack(alignment: .leading){
                Text(title)
                    .notoSansFontTitle()
                Text(content)
                    .notoSansFontContent()
            }
            .fixedSize(horizontal: true, vertical: true)
            .zIndex(1.0)
            Image(uiImage:UIImage(named: "observatory") ?? UIImage(named: "placeHolderImage")!)
                .offset(x:90)

            

            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(hue: 0, saturation: 0, brightness: 0.93, opacity: 0.5))

            RoundedRectangle(cornerRadius: 20)
            .strokeBorder(Color(hue: 0, saturation: 0, brightness: 0.93).opacity(0.5), lineWidth: 0.5)
        }
        .compositingGroup()
        .frame(width: 326, height: 49)

    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}


    
extension Text{
    func notoSansFontTitle()-> Text{
        self
            .font(.custom("NotoSansKR-Bold", size: 14))
    }
    
    func notoSansFontContent()-> Text{
        self
            .font(.custom("NotoSansKR-Regular", size: 10))
    }
}
