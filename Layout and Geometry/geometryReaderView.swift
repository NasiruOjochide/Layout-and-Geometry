//
//  geometryReaderView.swift
//  Layout and Geometry
//
//  Created by Danjuma Nasiru on 22/03/2023.
//

import SwiftUI


struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                        
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}


struct geometryReaderView: View {
    
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        
//        ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 0) {
//                        ForEach(1..<20) { num in
//                            GeometryReader { geo in
//                                Text("Number \(num)")
//                                    .font(.largeTitle)
//                                    .padding()
//                                    .background(.red)
//                                    .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
//                                    .frame(width: 200, height: 200)
//                            }
//                            .frame(width: 200, height: 200)
//                        }
//                    }
//                }
        
        
        
        
        
        
        
        GeometryReader{ fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(geo.frame(in: .global).minY <= 200 ? geo.frame(in: .global).minY / 200 : 1)
                            .scaleEffect(geo.frame(in: .global).maxY / (fullView.size.height / 2) < 0.5 ? 0.5 : (geo.frame(in: .global).maxY / (fullView.size.height / 2)))
                    }
                    .frame(height: 40)
                }
            }
        }
        
        
        
        
        
        
        //        OuterView()
        //            .background(.red)
        //            .coordinateSpace(name: "Custom")
        
        
        
        
        
        
        
        //        VStack{
        //            GeometryReader{geo in
        //                Text("Hey Boo")
        //                    .frame(width: geo.size.width * 0.9, height:  40)
        //                    .background(.red)
        //            }
        //            .background(.purple)
        //
        //            Text("Mporedfgh")
        //                .background(.blue)
        //        }
        //        .background(.green)
        
    }
}

struct geometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        geometryReaderView()
    }
}
