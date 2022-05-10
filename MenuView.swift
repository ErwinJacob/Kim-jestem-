//
//  MenuView.swift
//  Kim jestem?
//
//  Created by Jakub Górka on 02/01/2022.
//

import SwiftUI

struct MenuView: View {
    
    
    
    @ObservedObject var baza: System
    
    var body: some View {
//        if baza.systemLoaded == true{
//            VStack{
//                Text("Pytania załadowane!")
//                    .bold()
//                    .font(.title)
//                    .frame(height: 50)
//                Text("Obróć telefon aby grać!")
//                    .bold()
//                    .font(.title2)
//                    .frame(height: 50)
//
//            }
//        }
//        else{
        VStack{
            
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.cyan)
                    .frame(width: 300, height: 150)
                VStack{
                    
                    Text("Wybierz kategorie")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                    Text("mozesz wybrać kilka :)")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                }
            }
            
            Spacer()
            
            HStack{
                VStack{
                    Button(action: {
                        if baza.systemLoaded == false{
                            baza.systemLoaded = true
                        }
                        if baza.kategorie.pALColor == .red && baza.kategorie.polscyArtysciLoaded == false {
                            wczytajZPliku(baza: baza, nazwaPliku: "artysci")
                            baza.kategorie.polscyArtysciLoaded = true
                            baza.kategorie.pALColor = .green
                        }



                        
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(baza.kategorie.pALColor)
                                .frame(width: 120, height: 120)
                            VStack{
                                Text("Polscy")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title3)
                                Text("artyści")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title3)

                            }
                        }
                    })
                        .padding(.all, 5.0)

                    
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.red)
                                .frame(width: 120, height: 120)
                            Text("Celebryci")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title3)
                        }
                    })
                        .padding(.all, 5.0)

                }
                
                VStack{
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.red)
                                .frame(width: 120, height: 120)
                            VStack{
                                Text("Gwiazdy")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title3)
                                Text("filmów")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title3)

                            }
                        }
                    })
                        .padding(.all, 5.0)

                    
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.red)
                                .frame(width: 120, height: 120)
                            VStack{
                                Text("Gwiazdy")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title3)
                                Text("internetu")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title3)

                            }                        }
                    })
                        .padding(.all, 5.0)

                }
                
                VStack{
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.red)
                                .frame(width: 120, height: 120)
                            Text("Sportowcy")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title3)
                        }
                    })
                        .padding(.all, 5.0)

                    
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.red)
                                .frame(width: 120, height: 120)
                            VStack{
                                Text("Zagraniczni")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title3)
                                Text("artyści")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.title3)

                            }                        }
                    })
                        .padding(.all, 5.0)

                }
                
                
            
            }
            
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.cyan)
                    .frame(width: 300, height: 150)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: 290, height: 140)

                VStack{
                    
                    Text("Po  wybraniu  kategorii")
                        .foregroundColor(.cyan)
                        .bold()
                        .font(.title2)
                    Text("obróć telefon oby grać")
                        .foregroundColor(.cyan)
                        .bold()
                        .font(.title2)
                }
            }
            
            
//            Button(action: {
////                baza.systemLoaded = true //zrobic sprawdzenie czy ktorekolwiek jest odpalone
//
////                if polscyArtysci == .green && baza.polscyArtysciLoaded == false{
////                    wczytajZPliku(baza: &baza, nazwaPliku: "artysci")
////                    baza.polscyArtysciLoaded = true
////                }
//
//            }, label: {
//                ZStack{
//                    RoundedRectangle(cornerRadius: 15)
//                        .foregroundColor(.cyan)
//                        .frame(width: 250, height: 100)
//                    Text("Start!")
//                        .foregroundColor(.white)
//                        .bold()
//                        .font(.title2)
//                }
//            })
            
            Spacer()
        }
//        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(baza: System())
.previewInterfaceOrientation(.portrait)
    }
}
