//
//  ContentView.swift
//  Layout and Geometry
//
//  Created by Danjuma Nasiru on 18/03/2023.
//

import SwiftUI


extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}


extension HorizontalAlignment {
    enum LeadAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.leading]
        }
    }
    
    static let leadAccountAndName = HorizontalAlignment(LeadAccountAndName.self)
}


struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack{
                VStack(alignment: .trailing) {
                    Text("Hello, world!")
                        .alignmentGuide(.trailing){d in
                            d[.leading]
                        }
                    Text("This is a longer line of text")
                }
                .background(.red)
                .frame(width: 400, height: 400)
                .background(.blue)
                
                VStack(alignment: .leading){
                    ForEach(0..<10){position in
                        Text("number \(position)")
                            .alignmentGuide(.leading, computeValue: {_ in Double(position) * -10})
                    }
                }
                .background(.red)
                .frame(width: 400, height: 400)
                .background(.blue)
            }
            
            HStack(alignment: .midAccountAndName) {
                VStack {
                    Text("@twostraws")
                        .alignmentGuide(.midAccountAndName){d in
                            d[VerticalAlignment.center]
                        }
                    Image("deer-valley")
                        .resizable()
                        .frame(width: 64, height: 64)
                }
                
                VStack {
                    Text("Full name:")
                    Text("PAUL HUDSON")
                        .alignmentGuide(.midAccountAndName){d in d[VerticalAlignment.center]}
                        .font(.largeTitle)
                }
            }
            
            VStack(alignment: .leadAccountAndName) {
                HStack {
                    Text("@twostraws")
                        .alignmentGuide(.leadAccountAndName){d in
                            d[HorizontalAlignment.trailing]
                        }
                    Image("deer-valley")
                        .resizable()
                        .frame(width: 64, height: 64)
                }
                
                HStack {
                    Text("Full name:")
                    Text("PAUL HUDSON")
                        .alignmentGuide(.leadAccountAndName){d in d[HorizontalAlignment.trailing]}
                        .font(.largeTitle)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
