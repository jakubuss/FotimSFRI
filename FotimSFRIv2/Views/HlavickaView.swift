//
//  HlavickaView.swift
//  FotimSFRIv2
//
//  Created by Jakub on 11/05/2024.
//
// Horny layout vseobcne
import SwiftUI

struct HlavickaView: View {
    let nadpis : String
    let podNadpis : String
    
    let podfarbeniePozadia : Color
    let podfarbenieTextu : Color
    
    var body: some View {
        ZStack {
            
            RoundedRectangle (cornerRadius: 50)
                .foregroundColor (podfarbeniePozadia)
                .rotationEffect (Angle (degrees: -3))
            RoundedRectangle (cornerRadius: 50)
                .foregroundColor(podfarbeniePozadia)
                .rotationEffect(Angle (degrees: 3))
            
            VStack {
               // HStack{
                    /*if let image = loadImageFromPath("Preview Content/LOGO_FRI.png") {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                    } else {
                        Text("Obrázok sa nepodarilo načítať")
                    } */
                    Text(nadpis) //"FRIčka"
                        .font(.system(size: 55))
                        .foregroundColor (podfarbenieTextu)
                        .bold ()
                        .padding(.leading, 0) //odsadenie ak spojazdnim PNG
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                //}
                Text(podNadpis) //"Očami Žabku"
                    .font(.system(size: 30))
                    .foregroundColor (Color.white)
                    .italic()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

            }
            .padding(.top, 60)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 360)
        .offset(y: -150)
    }
    /* func loadImageFromPath(_ path: String) -> UIImage? {
            let fileManager = FileManager.default
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let imagePath = (documentDirectory as NSString).appendingPathComponent(path)
            
            if fileManager.fileExists(atPath: imagePath) {
                return UIImage(contentsOfFile: imagePath)
            } else {
                return nil
            }
        } */ //funkcia na citanie Obrazku
}



struct HlavickaView_Previews: PreviewProvider {
    static var previews: some View {
        HlavickaView(nadpis: "Nadpis", podNadpis: "Podnadpis",
                   podfarbeniePozadia: .blue,
                   podfarbenieTextu: .yellow)
    }
}


