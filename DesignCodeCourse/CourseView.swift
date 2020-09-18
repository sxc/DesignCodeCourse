//
//  CourseView.swift
//  DesignCodeCourse
//
//  Created by Xiaochun Shen on 2020/9/18.
//

import SwiftUI

struct CourseView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            CourseItem()
                .frame(width: 335, height: 250)
            VStack {
                if show {
                    CourseItem()
                        .transition(.move(edge: .trailing))
                        .edgesIgnoringSafeArea(.all)
                        
                }
            }
            
            
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
//        .animation(.spring())
    }
    
    
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
