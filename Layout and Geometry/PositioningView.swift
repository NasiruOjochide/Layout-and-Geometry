//
//  PositioningView.swift
//  Layout and Geometry
//
//  Created by Danjuma Nasiru on 22/03/2023.
//

import SwiftUI

struct PositioningView: View {
    var body: some View {
        VStack{
            
    //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    //            .offset(x: 100, y: 100)
    //            .background(.red)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .position(x: 100, y: 100)
                .background(.red)
        }
    }
}

struct PositioningView_Previews: PreviewProvider {
    static var previews: some View {
        PositioningView()
    }
}
