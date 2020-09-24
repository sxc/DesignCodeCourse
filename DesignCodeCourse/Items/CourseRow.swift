//
//  CourseRow.swift
//  DesignCodeCourse
//
//  Created by Xiaochun Shen on 2020/9/18.
//

import SwiftUI

struct CourseRow: View {
    var body: some View {
        HStack {
        Image(systemName: "paperplane.circle.fill")
            .renderingMode(.template)
            .frame(width: 48.0, height: 48.0)
            .imageScale(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("SwiftUI")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("Description")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    
            }
            Spacer()
        }
       
//        .font(.system(size: 34, weight: .bold, design: .rounded))
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}
