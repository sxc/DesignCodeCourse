//
//  CourseView.swift
//  DesignCodeCourse
//
//  Created by Xiaochun Shen on 2020/9/18.
//

import SwiftUI

struct CourseView: View {
    var body: some View {
        List(0 ..< 20) { item in
            CourseRow()
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Courses")
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
