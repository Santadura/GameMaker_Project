// ===== NGÂN HÀNG CÂU HỎI - 45 CÂU =====

// Biến trạng thái
show_quiz = false;
game_paused = false;
current_question = 0;
chosen_answer = -1;
correct_answer = "";

// Ngân hàng câu hỏi - [câu hỏi, đáp án A, B, C, D, đáp án đúng]
question_bank = [
    ["Một vật chuyển động với vận tốc 10 m/s trong 5 giây. Quãng đường vật đi được là bao nhiêu?", "A. 30m", "B. 40m", "C. 50m", "D. 60m", "C"],
    ["Đơn vị đo vận tốc là gì?", "A. m/s", "B. kg", "C. N", "D. J", "A"],
    ["Công thức tính vận tốc là:", "A. v = s × t", "B. v = s ÷ t", "C. v = t ÷ s", "D. v = s + t", "B"],
    ["Một ô tô đi được 120km trong 2 giờ. Vận tốc trung bình của ô tô là:", "A. 50 km/h", "B. 60 km/h", "C. 70 km/h", "D. 80 km/h", "B"],
    ["Đơn vị đo lực trong hệ SI là:", "A. kg", "B. N (Newton)", "C. m/s", "D. J", "B"],
    ["Trọng lực là lực hút của:", "A. Mặt trời", "B. Trái Đất", "C. Mặt trăng", "D. Không khí", "B"],
    ["Công thức tính trọng lượng là:", "A. P = m + g", "B. P = m × g", "C. P = m ÷ g", "D. P = g ÷ m", "B"],
    ["Lực ma sát có tác dụng:", "A. Tăng tốc độ vật", "B. Cản trở chuyển động", "C. Không ảnh hưởng", "D. Làm vật nặng hơn", "B"],
    ["Công thức tính áp suất là:", "A. p = F ÷ S", "B. p = F × S", "C. p = S ÷ F", "D. p = F + S", "A"],
    ["Đơn vị đo áp suất là:", "A. N", "B. Pa (Pascal)", "C. kg", "D. m/s", "B"],
    ["Vì sao băng lại nổi trên mặt nước?", "A. Băng nóng hơn nước", "B. Băng nhẹ hơn nước", "C. Băng nặng hơn nước", "D. Băng cứng hơn nước", "B"],
    ["Lực đẩy Ác-si-mét có chiều:", "A. Hướng xuống", "B. Hướng lên", "C. Ngang", "D. Xiên", "B"],
    ["Đơn vị đo cường độ dòng điện là:", "A. V (Volt)", "B. A (Ampe)", "C. Ω (Ohm)", "D. W (Watt)", "B"],
    ["Sắt có bị hút bởi nam châm không?", "A. Không", "B. Có", "C. Tùy trường hợp", "D. Chỉ khi nung nóng", "B"],
    ["Loại điện năng khi cọ xát hai quả bóng bay là:", "A. Điện động", "B. Điện tĩnh", "C. Điện từ", "D. Điện hóa", "B"],
    ["Công thức hóa học của nước là gì?", "A. HO", "B. H₂O", "C. H₃O", "D. HO₂", "B"],
    ["Oxit là:", "A. Hỗn hợp của oxi với nguyên tố khác", "B. Hợp chất của oxi với nguyên tố khác", "C. Hợp chất của kim loại", "D. Hợp chất của phi kim", "B"],
    ["Công thức hóa học của muối ăn là:", "A. KCl", "B. NaCl", "C. CaCl₂", "D. MgCl₂", "B"],
    ["Số nguyên tử oxi trong phân tử CO₂ là:", "A. 1", "B. 2", "C. 3", "D. 4", "B"],
    ["Kim loại nào dễ phản ứng nhất với nước?", "A. Sắt", "B. Đồng", "C. Natri", "D. Nhôm", "C"],
    ["Khí oxi có màu gì?", "A. Xanh", "B. Không màu", "C. Vàng", "D. Đỏ", "B"],
    ["Chất nào làm quỳ tím chuyển sang màu đỏ?", "A. Nước", "B. Bazơ", "C. Axit", "D. Muối", "C"],
    ["Phản ứng hóa học là:", "A. Chất thay đổi hình dạng", "B. Chất biến đổi thành chất khác", "C. Chất tan trong nước", "D. Chất đổi màu", "B"],
    ["Oxit axit tác dụng với:", "A. Nước tạo axit", "B. Dung dịch bazơ tạo muối và nước", "C. Kim loại", "D. Phi kim", "B"],
    ["CO₂ là oxit gì?", "A. Oxit bazơ", "B. Oxit axit", "C. Oxit trung tính", "D. Oxit lưỡng tính", "B"],
    ["Chất nào tác dụng với nước tạo dung dịch bazơ?", "A. CO₂", "B. Na₂O", "C. SO₂", "D. P₂O₅", "B"],
    ["Oxit trung tính là oxit:", "A. Tác dụng với axit", "B. Tác dụng với bazơ", "C. Không tác dụng với axit và bazơ", "D. Tác dụng cả axit và bazơ", "C"],
    ["Dung dịch gồm:", "A. Chất tan", "B. Dung môi", "C. Chất tan và dung môi", "D. Chất kết tủa", "C"],
    ["Để pha loãng dung dịch ta cần thêm:", "A. Chất tan", "B. Dung môi", "C. Muối", "D. Axit", "B"],
    ["Chỉ thị màu phổ biến trong hóa học là:", "A. Nước muối", "B. Quỳ tím", "C. Nước cất", "D. Rượu", "B"],
    ["Bộ phận nào của tế bào điều khiển mọi hoạt động?", "A. Màng tế bào", "B. Nhân tế bào", "C. Ty thể", "D. Lục thể", "B"],
    ["Tế bào là:", "A. Bộ phận của cơ thể", "B. Đơn vị cấu trúc và chức năng cơ bản của sự sống", "C. Chất lỏng trong cơ thể", "D. Bộ phận của mô", "B"],
    ["Mô được tạo nên từ:", "A. Tế bào", "B. Các tế bào cùng loại", "C. Các nguyên tử", "D. Các phân tử", "B"],
    ["Lục thể là bộ phận của tế bào nào?", "A. Tế bào động vật", "B. Tế bào thực vật", "C. Cả hai", "D. Tế bào vi sinh vật", "B"],
    ["Hệ tiêu hóa bắt đầu từ:", "A. Thực quản", "B. Miệng", "C. Dạ dày", "D. Ruột non", "B"],
    ["Các lá phổi nằm trong:", "A. Tim", "B. Dạ dày", "C. Lồng ngực", "D. Bụng", "C"],
    ["Tim có bao nhiêu buồng?", "A. 2", "B. 3", "C. 4", "D. 5", "C"],
    ["Máu chứa chất nào vận chuyển oxy?", "A. Huyết tương", "B. Hemoglobin", "C. Bạch cầu", "D. Tiểu cầu", "B"],
    ["Chức năng chính của dạ dày là:", "A. Hấp thụ chất dinh dưỡng", "B. Nhai nhỏ và bài tiết dịch dạ dày", "C. Chế biến chất béo", "D. Hấp thụ nước", "B"],
    ["Enzyme tiêu hóa được sản xuất chủ yếu ở:", "A. Thực quản", "B. Dạ dày, ruột non, tuyến tụy", "C. Ruột già", "D. Hành tá tràng", "B"],
    ["Chỗ hấp thụ chất dinh dưỡng chính là:", "A. Dạ dày", "B. Ruột non", "C. Ruột già", "D. Miệng", "B"],
    ["Gan chủ yếu có chức năng:", "A. Tiêu hóa", "B. Chuyển hóa chất", "C. Hấp thụ", "D. Bài tiết", "B"],
    ["Tuần hoàn máu bao gồm:", "A. Tim", "B. Động mạch và tĩnh mạch", "C. Tim, động mạch, tĩnh mạch, mao mạch", "D. Chỉ động mạch", "C"],
    ["Động mạch chủ cung cấp máu cho:", "A. Chỉ tim", "B. Chỉ não", "C. Toàn bộ cơ thể", "D. Chỉ phổi", "C"],
    ["Máu từ cơ thể trở về tim qua:", "A. Động mạch", "B. Tĩnh mạch", "C. Mao mạch", "D. Động mạch chủ", "B"]
];

// Function chọn câu hỏi ngẫu nhiên
function pick_random_question() {
    var bank_length = array_length(question_bank);
    current_question = irandom(bank_length - 1);
    correct_answer = question_bank[current_question][5];
}
