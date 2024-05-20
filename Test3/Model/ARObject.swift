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
            
            ARObject(name: "Nhà Rông", description: "Tọa lạc tại trung tâm buôn làng, nhà Rông Gia Lai với mái cong hình thuyền, hai đầu翘 cao như ôm trọn bầu trời, tượng trưng cho sự che chở của thần linh. Được làm bằng gỗ, tre, nứa và lợp tranh, nhà Rông không chỉ là nơi diễn ra các nghi lễ quan trọng, sinh hoạt cộng đồng mà còn là nơi lưu giữ văn hóa, thể hiện bản sắc độc đáo của người dân nơi đây. Trên mái nhà và vách nhà được trang trí bằng hoa văn, hình ảnh sinh động, phản ánh đời sống tinh thần và quan niệm về vũ trụ của các dân tộc thiểu số. Nhà Rông đóng vai trò quan trọng trong đời sống tinh thần của người dân Gia Lai. Đây là nơi diễn ra các lễ hội, cúng thần, hiến tế, cầu mưa, cầu mùa,...; là nơi họp làng, hội họp, giao lưu, giải trí,...; và là nơi cất giữ các nhạc cụ truyền thống, trang phục, đồ vật quý giá của buôn làng.", image: "NhaRong_GiaLai", location: "Gia Lai", ARLink: "art.scnassets/NhaRong_GiaLai.scn"),
            
            ARObject(name: "Nhà Mồ", description: "Nhà Mồ Gia Lai: Di tích lưu giữ ký ức và linh hồn .Nhà Mồ Gia Lai, hay Ghơl, là công trình kiến trúc độc đáo mang đậm dấu ấn văn hóa Tây Nguyên. Không chỉ là nơi an nghỉ cho người đã khuất, nhà Mồ còn là biểu tượng tín ngưỡng tâm linh, thể hiện mối liên hệ giữa con người với thế giới siêu nhiên và là minh chứng cho lịch sử, văn hóa lâu đời của các dân tộc thiểu số. Với kiến trúc độc đáo, là nơi lưu giữ ký ức, linh hồn người đã khuất và là biểu tượng văn hóa, lịch sử, nhà Mồ Gia Lai cần được bảo tồn và phát huy để gìn giữ bản sắc văn hóa và di sản quý giá của cha ông.", image: "NhaMo_GiaLai", location: "Gia Lai", ARLink: "art.scnassets/NhaMo_GiaLai.scn"),
            
            ARObject(name: "Nhà Rông", description: "Tọa lạc tại vị trí trung tâm buôn làng các dân tộc thiểu số ở Quảng Nam, nhà Rông - di sản văn hóa phi vật thể được UNESCO công nhận - sừng sững hiên ngang như một biểu tượng trường tồn của văn hóa Đông Sơn. Mang đậm kiến trúc độc đáo với mái cong hình thuyền hướng về bầu trời, nhà Rông không chỉ là nơi diễn ra các nghi lễ quan trọng, sinh hoạt cộng đồng mà còn là nơi lưu giữ bản sắc văn hóa và là niềm tự hào của người dân địa phương.Được làm bằng gỗ, tre, nứa và lợp tranh, nhà Rông ẩn chứa trong mình những giá trị lịch sử và văn hóa vô giá. Mỗi họa tiết, hoa văn trang trí trên mái nhà, vách nhà đều mang những ý nghĩa riêng, thể hiện quan niệm về vũ trụ, về cuộc sống và tâm thức của người dân nơi đây.", image: "NhaRong_QuangNam", location: "Quảng Nam", ARLink: "art.scnassets/NhaRong_QuangNam.scn"),
        ]
    }
    
    static func createStatuesObjects() -> [ARObject] {
        return [
            ARObject(name: "Tượng Mồ", description: "Nhà Tượng Mồ Gia Lai, còn gọi là Ghơl, là một di sản văn hóa độc đáo mang đậm dấu ấn văn hóa của các dân tộc thiểu số tại khu vực Tây Nguyên, đặc biệt là tại Gia Lai. Không chỉ là nơi an nghỉ cho người đã khuất, nhà Tượng Mồ còn là biểu tượng cho nghệ thuật điêu khắc độc đáo, thể hiện quan niệm tâm linh về thế giới bên kia và là minh chứng cho lịch sử, văn hóa lâu đời của các dân tộc thiểu số.Đối với người dân Gia Lai, nhà Tượng Mồ không chỉ là nơi an nghỉ cho người đã khuất mà còn là nơi thể hiện quan niệm tâm linh về thế giới bên kia. Họ tin rằng những linh hồn của người đã khuất sẽ được các vị thần che chở và phù hộ khi họ sinh sống tại thế giới bên kia.", image: "TuongMo_GiaLai", location: "Gia Lai", ARLink: "art.scnassets/TuongMo_GiaLai.scn"),
            
            ARObject(name: "Quan Âm Tự Tại", description: "Quán tự tại ý nghĩa rằng: Chỉ cần bạn biết quán chiếu chính mình, nhận chân được rõ ràng chính mình, thì ngay giờ phút đó bản thân dã tự tự, đạt được thành tựu. Chỉ cần tâm mình tự tại thì tất cả mọi cảnh giới tất sẽ tự tại, mọi sự lý tự nhiên sẽ trở thành tự tại mà thôi. Đứng trước nhân ngã, thị phi bạn giữ được thân tâm tự tại? Đứng trước danh lợi phú quý chúng ta vẫn bảo trì được tâm an tĩnh, tự tại? Hoặc đứng trước sinh, lão, bệnh, tử, liệu chúng ta có giữ vững được tâm thái an nhiên tự tại?Trong cuộc sống nếu tâm trí chúng ta không thướng tồn an tĩnh, tự tại, thì cho dù sự nghiệp có nhiều tiền của cũng chỉ là gia tăng thêm sự trói buộc mà thôi. Lại nữa nếu đứng trước 8 ngọn gió: tán dương ca tụng, hiềm khích, hủy báng, danh dự, lợi dưỡng, suy tàn khổ đau và khoái lạc độc hại kia lốc thổi mà tâm ta vẫn không bị lay động thì chúng ta đã thành tựu được đức hạnh tự tại.", image: "QuanAmTuTai", location: "Việt Nam", ARLink: "art.scnassets/QuanAmTuTai.scn"),
        ]
    }
    static func createAccessoriesObjects() -> [ARObject] {
        return [
            ARObject(name: "Trấn Dấu Thầy Cúng", description: "Đây là các dấu ấn , con dấu được các thầy cúng ngày xưa sử dụng, mang đậm nét nghệ thuật cổ xưa về bùa ngải, phù phép với các ấn chú được khắc xung quanh hình nhân đại diện cho con người, nhằm mang đến niềm tin mạnh mẽ về sức mạnh của ấn chú này", image: "TranDauThayCung", location: "Việt Nam", ARLink:"art.scnassets/Fragment.scn"),
            
            ARObject(name: "Túi Da Thú", description: "Túi da thú cổ vật trong lịch sử văn hóa Việt Nam là những chiếc túi được chế tác từ da động vật, mang giá trị lịch sử và văn hóa cao. Chúng thường được sử dụng bởi các tầng lớp quý tộc và vua chúa trong các nghi lễ tôn giáo, biểu tượng của quyền lực và địa vị. Những chiếc túi này được làm thủ công với kỹ thuật tinh xảo, có hoa văn phức tạp và bền vững theo thời gian. Ngoài vai trò lưu trữ và vận chuyển, chúng còn thể hiện sự giàu có và quyền uy của người sở hữu trong xã hội cổ đại Việt Nam.", image: "Tui_Da_Thu", location: "Việt Nam", ARLink:"art.scnassets/Tui_Da_Thu.scn")
        ]
    }
}
