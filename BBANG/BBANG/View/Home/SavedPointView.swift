//
//  SavedPointView.swift
//  BBANG
//
//  Created by seohyeon park on 2023/02/03.
//

import SwiftUI

struct SavedPointView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var empathyButtonImageName = "face.smiling"
    @State var isEmpathize = false
    @State var empathyButtonColor = Color.black
    @State var empathyCount = 378
    @State var comment = ""
    
    var body: some View {
        ZStack {
            NavigationView {
            }
            .navigationBarHidden(true)
            
            VStack() {
                ScrollView {
                    HStack(alignment: .center) {
                        HStack {
                            Button {
                                
                            } label: {
                                Text("BBANG")
                                    .foregroundColor(.black)
                                    .font(.system(.caption))
                                    .padding()
                            }
                            .frame(height: 50)
                            .background(Color.gray)
                            .clipShape(Circle())
                            .padding(.trailing, -10)
                            
                            VStack(alignment: .leading) {
                                Text("bbang.official ☑︎")
                                    .padding(.bottom, -3)
                                Text("1일전")
                                    .foregroundColor(.gray)
                                    .font(.system(.footnote))
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("팔로우")
                                .foregroundColor(.white)
                                .font(.system(.body))
                                .padding()
                        }
                        .frame(height: 40)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    .padding(.trailing, 20)
                    .padding(.leading, 10)

                    Image("banner4")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                    
                    HStack {
                        HStack {
                            Button {
                                if !isEmpathize {
                                    empathyButtonImageName = "heart.circle.fill"
                                    empathyButtonColor = Color.pink
                                    empathyCount += 1
                                } else {
                                    empathyButtonImageName = "face.smiling"
                                    empathyButtonColor = Color.black
                                    empathyCount -= 1
                                }
                                isEmpathize.toggle()
                            } label: {
                                Image(systemName: empathyButtonImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(empathyButtonColor)
                                    .frame(height: 30)
                                    .padding()
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "bubble.right")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.black)
                                    .frame(height: 30)
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.black)
                                .frame(height: 30)
                                .padding()
                        }
                    }
                    
                    HStack() {
                        Text("공감 \(empathyCount)개")
                            .foregroundColor(.black)
                            .font(.system(.body))
                            .padding(.leading)
                        Spacer()
                    }
                    
                    HStack() {
                        Text(
                        """
                        댓글 달고 포인트 적립하세요!
                        
                        [이벤트 선물]
                        4명 - 10000 포인트
                        10명 - 5000 포인트
                        전원 - 500포인트
                        
                        [참여 방법]
                        댓글로 하고 싶은 말을 적어주면 응모 끝!
                        
                        [일정 안내]
                        - 진행 기간: 2/1 ~ 2/28
                        - 포인트 지급 및 발표: 3/2
                        """
                        )
                        .padding([.leading, .top])
                        
                        Spacer()
                    }
                }
                .padding()
                .padding(.top, 35)
                .padding(.bottom, 60)
                
            }
            VStack() {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                    })
                    .padding(.leading, -140)
                    
                    Text("포인트 적립")
                        .font(.system(.headline))
                }
                .frame(height: 50)
                Spacer()
                
                HStack() {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(height: 30)
                        .padding([.top,.bottom])
                    
                    TextField("", text: $comment)
                        .padding()
                        .background(Color.gray)
                        .clipShape(Capsule())
                }
                .background(Color.white)
                .padding([.leading,.trailing])
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}
