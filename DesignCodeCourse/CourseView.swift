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
    @Namespace var namespace2
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    
    var body: some View {
        ZStack{
            ScrollView {
                VStack(spacing: 0) {
                    Text("Courses")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .padding(.top, 54)
                    
                    LazyVGrid(
                        columns: [
                            GridItem(.adaptive(minimum: 160), spacing: 16)
                        ],
                        spacing: 16)
                    {
                        ForEach(courses) { item in
                            VStack {
                                CourseItem(course: item)
                                    .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                    .frame(height: 250)
                                    
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
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
                    
                    Text("Latest sections")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 240))]) {
                        ForEach(courseSections) { item in
                            NavigationLink(destination: CourseDetail(namespace: namespace2)) {
                                CourseRow(item: item)
                            }
                        }
                    }
                    
                    
                }
                
            }
            .zIndex(1)
            if selectedItem != nil  {
                ZStack(alignment: .topTrailing)  {
                    
                    CourseDetail(course: selectedItem!, namespace: namespace)
                   
                    
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
                .frame(maxWidth: 712)
                .frame(maxWidth: .infinity)
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
                
            }
        }
        
//        @ViewBuilder
//        var tabBar: some View {
//            TabView {
//                NavigationView {
//                    CourseView()
//                }
//                .tabItem {
//                    Image(systemName: "book.closed")
//                    Text("Courses")
//                }
//
//                NavigationView {
//                    CourseList()
//                }
//                .tabItem {
//                    Image(systemName: "list.bullet.rectangle")
//                    Text("Tutorials")
//                }
//
//                NavigationView {
//                    CourseList()
//                }
//                .tabItem {
//                    Image(systemName: "tv")
//                    Text("Livestreams")
//                }
//
//                NavigationView {
//                    CourseList()
//                }
//                .tabItem {
//                    Image(systemName: "mail.stack")
//                    Text("Certificates")
//                }
//
//                NavigationView {
//                    CourseList()
//                }
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                    Text("Search")
//                }
//
//            }
//        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
