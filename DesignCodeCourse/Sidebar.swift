//
//  Sidebar.swift
//  DesignCodeCourse
//
//  Created by Xiaochun Shen on 2020/9/18.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: CourseView()) {
                    Label("Courses", systemImage: "book.closed")
                }
                Label("Tutorials", systemImage: "list.bullet.rectangle")
                Label("Livestreams", systemImage: "tv")
                Label("Certificates", systemImage: "mail.stack")
                Label("Search", systemImage: "magnifyingglass")
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Learn")
            
            CourseView()
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
