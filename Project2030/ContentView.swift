//
//  ContentView.swift
//  Project2030
//
//  Created by Hibah Abdullah Alatawi on 02/11/1444 AH.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State private var showPhotoOptions: Bool = false
    @State private var image: UIImage?
    @State private var showSheet: Bool = false
    @State private var ishownhome: Bool = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var classificationLabel: String = ""
    @State private var count : Int = 0
    @ObservedObject var classifier: ImageClassifier
    var body: some View {


        NavigationView {

            VStack{

                ZStack{

                    HStack{

                        Button() {
                            // open action sheet
                            self.showSheet = true

                        }label: {

                            Label("Upload a Picture", systemImage: "plus")

                        }
                        .accentColor(.white)
                        .font(Font.custom("SF Pro", size: 18))
                        .frame(width: 270 , height: 50)
                        .background(RoundedRectangle(cornerRadius: 15 ).fill(Color("CusColor")).opacity(1))


                    }

                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("CusColor"), style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .overlay(
                            Group {
                                HStack{

                                    Button() {
                                        self.showSheet = true
                                    }label: {

                                        Label("Upload a Picture", systemImage: "plus")

                                    }
                                    .accentColor(.white)
                                    .font(Font.custom("SF Pro", size: 18))
                                    .frame(width: 270 , height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15 ).fill(Color("CusColor")).opacity(1))


                                }
                                if image != nil {
                                    Image(uiImage: image!)
                                        .resizable()
                                    //  .scaledToFit()
                                        .frame(width: 350, height:360)
                                        .cornerRadius(15)
                                }
                            })
                        .frame(width: 350, height:660)
                }

                .actionSheet(isPresented: $showSheet) {

                    ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                        .default(Text("Photo Library")) {
                            // open photo library
                            self.showPhotoOptions = true
                            self.sourceType = .photoLibrary
                        },
                        .default(Text("Camera")) {
                            // open camera

                            self.showPhotoOptions = true
                            self.sourceType = .camera
                        },
                        .cancel()
                    ])

                }
                .padding()

            }
        }

        .sheet(isPresented: $isPresenting){
                   ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                       .onDisappear{
                           if uiImage != nil {
                               classifier.detect(uiImage: uiImage!)
                           }
                       }

               }

               .padding()

              
                                  
                           }
                    
                           }
                       

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(classifier: ImageClassifier())
    }
}
