//
//  CourseView.swift
//  DesignCodeCourse
//
//  Created by Xiaochun Shen on 2020/9/18.
//

import SwiftUI

struct CourseView: View {
    @State var show = false
    @Namespace var namespace
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    
    
    var body: some View {
        ZStack{
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 160), spacing: 16)
                    ],
                    spacing: 16){
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                .frame(height: 250)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        show.toggle()
                                        selectedItem = item
                                        isDisabled = true
                                    }
                                }
                                .disabled(isDisabled)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace)
                    }

                }
                
                .padding(16)
                .frame(maxWidth: .infinity)
            }

            .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
            if selectedItem != nil  {
                ZStack(alignment: .topTrailing)  {
                    VStack {
                        ScrollView {
                            CourseItem(course: selectedItem!)
                                .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                                .frame(height: 300)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        show.toggle()
                                        selectedItem = nil
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            isDisabled = false
                                        }
                                        isDisabled = false
                                    }
                                }
                            VStack {
                                ForEach(0 ..< 20) { item in
                                    CourseRow()
                                }
                            }
                            .padding()
                        }
                    }
                    .background(Color("Background 1"))
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .matchedGeometryEffect(id: "container\(selectedItem!.id)", in: namespace)
                    .edgesIgnoringSafeArea(.all)
                   
                    
                    CloseButton()
                        .padding(.trailing, 16)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                show.toggle()
                                selectedItem = nil
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    isDisabled = false
                                }
                                isDisabled = false
                            }
                        }
                }
                .zIndex(2)
            }
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
