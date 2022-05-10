

import SwiftUI

struct KartaView: View {
    
    @ObservedObject var baza: System
    @State var nr: Int = 0
    @State var zdj: String = ""
    
    var body: some View {
        if baza.systemLoaded == false{
            VStack{
                Text("Załaduj pytania aby rozpocząć gre!")
                    .bold()
                    .font(.title)
                    .frame(height: 50)
                Text("Obróć telefon aby wybrać pule pytań!")
                    .bold()
                    .font(.title2)
                    .frame(height: 50)

            }
        }
        else{
            
        VStack{
            Text("Kim jestem?")
                .bold()
                .font(.title)
                .frame(height: 50)
            Spacer()
            
            HStack{
                
                Spacer()
                if zdj != ""{
                Image(zdj)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400.0, height: 300.0)
                    .cornerRadius(25)
                    .padding(.bottom, 25)
                }
                else{
                    Image(baza.characters[0].imgName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400.0, height: 300.0)
                        .cornerRadius(25)
                        .padding(.bottom, 25)
                }
                
                
                Spacer()
                
                VStack{
                    
                    if nr < baza.characters.count{
                        
                        if (baza.characters[nr].name != " "){
                            Text("\(baza.characters[nr].name)")
                                .bold()
                                .font(.title)
                            
                        }
                  
                        if (baza.characters[nr].ksywka != " "){
                            Text("\(baza.characters[nr].ksywka)")
                                .bold()
                                .font(.title)
                            
                        }
                        
                        if (baza.characters[nr].surname != " "){
                            Text("\(baza.characters[nr].surname)")
                                .bold()
                                .font(.title)
                            
                        }
                        
                        
                        
                    }
                    else{
                        Text("Koniec pytań! :(")
                            .bold()
                            .font(.title)

                    }
                    
                }
                .frame(width: 250, height: 300)
                .padding(.bottom, 25)
                
                Spacer()
                
                Button(action: {
                    nr += 1
                    if nr < baza.characters.count{

                    zdj = baza.characters[nr].imgName
                    }
                    else{
                        zdj = "postac0"
                    }
                }, label: {
                    
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.green)
                        .frame(width: 100, height: 80)
                })
                    .padding(.bottom, 25)

                Spacer()
            }
            Spacer()
        }
        }
    }
}

struct KartaView_Previews: PreviewProvider {
    static var previews: some View {
        KartaView(baza: System())
.previewInterfaceOrientation(.landscapeLeft)
    }
}
