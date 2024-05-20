//
//  ARObject.swift
//  Test3
//
//  Created by Thanh Nguyen Viet on 20/05/2024.
//

import Foundation

struct ARObject {
    var name: String
    var description: String
    var image: String
    var location: String
    var ARLink: String
    
    static func createVNObjects() -> [ARObject] {
        return [
            ARObject(name: "Cổ Vật: Nhà Thái Trắng", description: "Truyện cổ của người Thái ở đây kể rằng: xưa kia, người Thái còn chưa biết làm nhà, một hôm có người mơ thấy có con rùa về báo mộng và bảo rằng: “nhìn vào hình dáng của tôi mà làm”. Thế là một kiểu nhà của người Thái hình thành với 4 chân là 4 cột trụ, vảy rùa là ngói lợp. Từ đó ngôi nhà sàn của người Thái có hình dáng như chiếc mai tùa.", image: "NhaThaiTrang", location: "Lai Châu, Việt Nam", ARLink: "art.scnassets/NhaThaiTrang_LaiChau.scn"),
            ARObject(name: "Nhà Thái Trắng", description: "", image: "NhaThaiTrang", location: "Lai Châu", ARLink: "art.scnassets/NhaThaiTrang_LaiChau copy.scn"),
            ARObject(name: "Nhà Thái Trắng", description: "", image: "NhaThaiTrang", location: "Lai Châu", ARLink: "art.scnassets/NhaThaiTrang_LaiChau copy.scn"),
            ARObject(name: "Nhà Thái Trắng", description: "", image: "NhaThaiTrang", location: "Lai Châu", ARLink: "art.scnassets/NhaThaiTrang_LaiChau copy.scn"),
        ]
    }
}
