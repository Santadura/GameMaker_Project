// Biến trạng thái
show_quiz = false;
show_result = false;  // Popup kết quả
game_paused = false;
current_question = 0;
chosen_answer = "";
correct_answer = "";
is_correct = false;
obstacle_ref = noone;
result_message = "";  // Lưu câu động viên

// Cài đặt môn học và level
current_subject = "physics";  // "physics", "chemistry", "biology"
current_level = 1;  // 1 (dễ), 2 (vừa), 3 (khó)

// ===== NGÂN HÀNG CÂU HỎI VẬT LÝ =====
physics_questions = {
    level1: [  // Dễ
        ["Đơn vị đo vận tốc là gì?", "A. m/s", "B. kg", "C. N", "D. J", "A", "m/s (mét/giây) là đơn vị đo vận tốc trong hệ SI, biểu thị quãng đường đi được trong một đơn vị thời gian."],
        ["Công thức tính vận tốc là:", "A. v = s × t", "B. v = s ÷ t", "C. v = t ÷ s", "D. v = s + t", "B", "Vận tốc = Quãng đường chia cho thời gian (v = s/t), đây là công thức cơ bản trong cơ học."],
        ["Đơn vị đo lực trong hệ SI là:", "A. kg", "B. N (Newton)", "C. m/s", "D. J", "B", "Newton (N) là đơn vị đo lực, được đặt theo tên nhà vật lý Isaac Newton."],
        ["Trọng lực là lực hút của:", "A. Mặt trời", "B. Trái Đất", "C. Mặt trăng", "D. Không khí", "B", "Trọng lực là lực hút của Trái Đất tác dụng lên mọi vật, kéo chúng về phía tâm Trái Đất."],
        ["Lực ma sát có tác dụng:", "A. Tăng tốc độ vật", "B. Cản trở chuyển động", "C. Không ảnh hưởng", "D. Làm vật nặng hơn", "B", "Lực ma sát luôn cản trở chuyển động của vật, làm vật chậm lại hoặc khó di chuyển hơn."]
    ],
    level2: [  // Vừa
        ["Một vật chuyển động với vận tốc 10 m/s trong 5 giây. Quãng đường vật đi được là bao nhiêu?", "A. 30m", "B. 40m", "C. 50m", "D. 60m", "C", "Áp dụng công thức s = v × t = 10 × 5 = 50m. Quãng đường bằng vận tốc nhân với thời gian."],
        ["Một ô tô đi được 120km trong 2 giờ. Vận tốc trung bình của ô tô là:", "A. 50 km/h", "B. 60 km/h", "C. 70 km/h", "D. 80 km/h", "B", "Vận tốc = 120km ÷ 2h = 60 km/h. Đây là vận tốc trung bình của chuyển động."],
        ["Công thức tính trọng lượng là:", "A. P = m + g", "B. P = m × g", "C. P = m ÷ g", "D. P = g ÷ m", "B", "Trọng lượng P = khối lượng × gia tốc trọng trường (P = m × g), với g ≈ 10 m/s²."],
        ["Công thức tính áp suất là:", "A. p = F ÷ S", "B. p = F × S", "C. p = S ÷ F", "D. p = F + S", "A", "Áp suất = Lực chia diện tích (p = F/S). Diện tích càng nhỏ thì áp suất càng lớn."],
        ["Đơn vị đo áp suất là:", "A. N", "B. Pa (Pascal)", "C. kg", "D. m/s", "B", "Pascal (Pa) là đơn vị đo áp suất trong hệ SI, 1 Pa = 1 N/m²."]
    ],
    level3: [  // Khó
        ["Vì sao băng lại nổi trên mặt nước?", "A. Băng nóng hơn nước", "B. Băng nhẹ hơn nước", "C. Băng nặng hơn nước", "D. Băng cứng hơn nước", "B", "Băng có khối lượng riêng nhỏ hơn nước (0.92 g/cm³ < 1 g/cm³) nên nổi theo nguyên lý Ác-si-mét."],
        ["Lực đẩy Ác-si-mét có chiều:", "A. Hướng xuống", "B. Hướng lên", "C. Ngang", "D. Xiên", "B", "Lực đẩy Ác-si-mét luôn hướng thẳng đứng lên trên, ngược chiều với trọng lực."],
        ["Đơn vị đo cường độ dòng điện là:", "A. V (Volt)", "B. A (Ampe)", "C. Ω (Ohm)", "D. W (Watt)", "B", "Ampe (A) đo cường độ dòng điện, biểu thị lượng điện tích đi qua tiết diện dây dẫn trong 1 giây."],
        ["Sắt có bị hút bởi nam châm không?", "A. Không", "B. Có", "C. Tùy trường hợp", "D. Chỉ khi nung nóng", "B", "Sắt là vật liệu sắt từ, bị nam châm hút mạnh do có tính chất từ tính đặc biệt."],
        ["Loại điện năng khi cọ xát hai quả bóng bay là:", "A. Điện động", "B. Điện tĩnh", "C. Điện từ", "D. Điện hóa", "B", "Cọ xát tạo ra điện tĩnh do sự dịch chuyển electron giữa hai bề mặt tiếp xúc."]
    ]
};

// ===== NGÂN HÀNG CÂU HỎI HÓA HỌC =====
chemistry_questions = {
    level1: [  // Dễ
        ["Công thức hóa học của nước là gì?", "A. HO", "B. H₂O", "C. H₃O", "D. HO₂", "B", "Nước có công thức H₂O, gồm 2 nguyên tử Hydro và 1 nguyên tử Oxi."],
        ["Công thức hóa học của muối ăn là:", "A. KCl", "B. NaCl", "C. CaCl₂", "D. MgCl₂", "B", "Muối ăn là Natri Clorua (NaCl), hợp chất của Na và Cl."],
        ["Khí oxi có màu gì?", "A. Xanh", "B. Không màu", "C. Vàng", "D. Đỏ", "B", "Oxi (O₂) là khí không màu, không mùi, cần thiết cho sự sống và quá trình cháy."],
        ["Số nguyên tử oxi trong phân tử CO₂ là:", "A. 1", "B. 2", "C. 3", "D. 4", "B", "CO₂ có 1 nguyên tử C và 2 nguyên tử O, tạo thành khí carbon dioxide."],
        ["Chỉ thị màu phổ biến trong hóa học là:", "A. Nước muối", "B. Quỳ tím", "C. Nước cất", "D. Rượu", "B", "Quỳ tím nhận biết axit (đỏ) và bazơ (xanh), là chỉ thị phổ biến nhất."]
    ],
    level2: [  // Vừa
        ["Oxit là:", "A. Hỗn hợp của oxi với nguyên tố khác", "B. Hợp chất của oxi với nguyên tố khác", "C. Hợp chất của kim loại", "D. Hợp chất của phi kim", "B", "Oxit là hợp chất của oxi với một nguyên tố khác, như CO₂, H₂O, Fe₂O₃."],
        ["Chất nào làm quỳ tím chuyển sang màu đỏ?", "A. Nước", "B. Bazơ", "C. Axit", "D. Muối", "C", "Axit làm quỳ tím chuyển đỏ do có pH < 7 và giải phóng ion H⁺."],
        ["Phản ứng hóa học là:", "A. Chất thay đổi hình dạng", "B. Chất biến đổi thành chất khác", "C. Chất tan trong nước", "D. Chất đổi màu", "B", "Phản ứng hóa học là quá trình chất ban đầu biến đổi thành chất mới có tính chất khác."],
        ["Dung dịch gồm:", "A. Chất tan", "B. Dung môi", "C. Chất tan và dung môi", "D. Chất kết tủa", "C", "Dung dịch = chất tan + dung môi. Ví dụ: nước đường = đường (tan) + nước (dung môi)."],
        ["Để pha loãng dung dịch ta cần thêm:", "A. Chất tan", "B. Dung môi", "C. Muối", "D. Axit", "B", "Pha loãng là thêm dung môi (như nước) để giảm nồng độ dung dịch."]
    ],
    level3: [  // Khó
        ["Kim loại nào dễ phản ứng nhất với nước?", "A. Sắt", "B. Đồng", "C. Natri", "D. Nhôm", "C", "Natri (Na) phản ứng mạnh với nước ở nhiệt độ thường, tạo NaOH và H₂, thậm chí gây cháy nổ."],
        ["Oxit axit tác dụng với:", "A. Nước tạo axit", "B. Dung dịch bazơ tạo muối và nước", "C. Kim loại", "D. Phi kim", "B", "Oxit axit + bazơ → muối + nước. Ví dụ: CO₂ + NaOH → Na₂CO₃ + H₂O."],
        ["CO₂ là oxit gì?", "A. Oxit bazơ", "B. Oxit axit", "C. Oxit trung tính", "D. Oxit lưỡng tính", "B", "CO₂ là oxit axit vì tác dụng với nước tạo axit (H₂CO₃) và với bazơ tạo muối."],
        ["Chất nào tác dụng với nước tạo dung dịch bazơ?", "A. CO₂", "B. Na₂O", "C. SO₂", "D. P₂O₅", "B", "Na₂O + H₂O → 2NaOH (bazơ). Oxit kim loại tác dụng với nước tạo bazơ."],
        ["Oxit trung tính là oxit:", "A. Tác dụng với axit", "B. Tác dụng với bazơ", "C. Không tác dụng với axit và bazơ", "D. Tác dụng cả axit và bazơ", "C", "Oxit trung tính như CO, NO không phản ứng với axit hay bazơ ở điều kiện thường."]
    ]
};

// ===== NGÂN HÀNG CÂU HỎI SINH HỌC =====
biology_questions = {
    level1: [  // Dễ
        ["Bộ phận nào của tế bào điều khiển mọi hoạt động?", "A. Màng tế bào", "B. Nhân tế bào", "C. Ty thể", "D. Lục thể", "B", "Nhân tế bào chứa DNA, điều khiển mọi hoạt động sống và di truyền của tế bào."],
        ["Tế bào là:", "A. Bộ phận của cơ thể", "B. Đơn vị cấu trúc và chức năng cơ bản của sự sống", "C. Chất lỏng trong cơ thể", "D. Bộ phận của mô", "B", "Tế bào là đơn vị nhỏ nhất có đầy đủ đặc điểm của sự sống."],
        ["Mô được tạo nên từ:", "A. Tế bào", "B. Các tế bào cùng loại", "C. Các nguyên tử", "D. Các phân tử", "B", "Mô gồm nhiều tế bào cùng loại liên kết với nhau, thực hiện chức năng chung."],
        ["Lục thể là bộ phận của tế bào nào?", "A. Tế bào động vật", "B. Tế bào thực vật", "C. Cả hai", "D. Tế bào vi sinh vật", "B", "Lục thể chứa diệp lục, chỉ có ở tế bào thực vật, thực hiện quang hợp."],
        ["Hệ tiêu hóa bắt đầu từ:", "A. Thực quản", "B. Miệng", "C. Dạ dày", "D. Ruột non", "B", "Miệng là nơi bắt đầu tiêu hóa, nhai nghiền thức ăn và trộn với nước bọt."]
    ],
    level2: [  // Vừa
        ["Các lá phổi nằm trong:", "A. Tim", "B. Dạ dày", "C. Lồng ngực", "D. Bụng", "C", "Phổi nằm trong lồng ngực, được bảo vệ bởi xương sườn, thực hiện trao đổi khí."],
        ["Tim có bao nhiêu buồng?", "A. 2", "B. 3", "C. 4", "D. 5", "C", "Tim người có 4 buồng: 2 tâm nhĩ (trái, phải) và 2 tâm thất (trái, phải)."],
        ["Máu chứa chất nào vận chuyển oxy?", "A. Huyết tương", "B. Hemoglobin", "C. Bạch cầu", "D. Tiểu cầu", "B", "Hemoglobin trong hồng cầu gắn kết và vận chuyển oxy đến các tế bào."],
        ["Chức năng chính của dạ dày là:", "A. Hấp thụ chất dinh dưỡng", "B. Nhai nhỏ và bài tiết dịch dạ dày", "C. Chế biến chất béo", "D. Hấp thụ nước", "B", "Dạ dày tiết dịch vị có axit và enzyme, nghiền nát thức ăn thành dạng chất lỏng."],
        ["Chỗ hấp thụ chất dinh dưỡng chính là:", "A. Dạ dày", "B. Ruột non", "C. Ruột già", "D. Miệng", "B", "Ruột non có niêm mạc gấp nếp, diện tích lớn, là nơi hấp thụ chất dinh dưỡng chủ yếu."]
    ],
    level3: [  // Khó
        ["Enzyme tiêu hóa được sản xuất chủ yếu ở:", "A. Thực quản", "B. Dạ dày, ruột non, tuyến tụy", "C. Ruột già", "D. Hành tá tràng", "B", "Enzyme tiêu hóa được tiết từ dạ dày (pepsin), tụy (amylase, lipase) và ruột non."],
        ["Gan chủ yếu có chức năng:", "A. Tiêu hóa", "B. Chuyển hóa chất", "C. Hấp thụ", "D. Bài tiết", "B", "Gan chuyển hóa chất dinh dưỡng, giải độc, sản xuất mật, dự trữ glycogen."],
        ["Tuần hoàn máu bao gồm:", "A. Tim", "B. Động mạch và tĩnh mạch", "C. Tim, động mạch, tĩnh mạch, mao mạch", "D. Chỉ động mạch", "C", "Hệ tuần hoàn gồm tim (bơm máu), động mạch, tĩnh mạch và mao mạch (trao đổi chất)."],
        ["Động mạch chủ cung cấp máu cho:", "A. Chỉ tim", "B. Chỉ não", "C. Toàn bộ cơ thể", "D. Chỉ phổi", "C", "Động mạch chủ xuất phát từ tâm thất trái, phân nhánh cung cấp máu giàu O₂ cho toàn thân."],
        ["Máu từ cơ thể trở về tim qua:", "A. Động mạch", "B. Tĩnh mạch", "C. Mao mạch", "D. Động mạch chủ", "B", "Tĩnh mạch đưa máu nghèo O₂ từ cơ thể về tim, có van một chiều ngăn máu chảy ngược."]
    ]
};

// Function thiết lập môn học và level
function set_subject_and_level(subject, level) {
    current_subject = subject;
    current_level = level;
}

// Function chọn câu hỏi ngẫu nhiên theo môn và level
function pick_random_question() {
    var question_array = [];
    
    // Chọn ngân hàng câu hỏi theo môn
    switch(current_subject) {
        case "physics":
            switch(current_level) {
                case 1: question_array = physics_questions.level1; break;
                case 2: question_array = physics_questions.level2; break;
                case 3: question_array = physics_questions.level3; break;
            }
            break;
        case "chemistry":
            switch(current_level) {
                case 1: question_array = chemistry_questions.level1; break;
                case 2: question_array = chemistry_questions.level2; break;
                case 3: question_array = chemistry_questions.level3; break;
            }
            break;
        case "biology":
            switch(current_level) {
                case 1: question_array = biology_questions.level1; break;
                case 2: question_array = biology_questions.level2; break;
                case 3: question_array = biology_questions.level3; break;
            }
            break;
    }
    
    // Random câu hỏi
    current_question = irandom(array_length(question_array) - 1);
    correct_answer = question_array[current_question][5];
}
