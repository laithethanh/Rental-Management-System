# 🏠 Rental-Management-System (RMS)

**Rental Management System** là ứng dụng web hỗ trợ chủ trọ quản lý toàn bộ hoạt động cho thuê phòng trọ, bao gồm phòng, người thuê, hợp đồng, chỉ số điện nước và hóa đơn. Hệ thống được thiết kế theo mô hình MVC + Service Layer, sử dụng Node.js – Express – Sequelize – MySQL, bám sát nghiệp vụ quản lý trọ ngoài đời thực.

## 🎯 Mục tiêu dự án
* Số hóa quy trình quản lý phòng trọ (không còn sổ giấy, excel).
* Giảm sai sót trong tính tiền điện – nước và tạo hóa đơn.
* Hỗ trợ chủ trọ vận hành chuyên nghiệp, dễ dàng.
* Hỗ trợ người thuê xem phòng, gửi yêu cầu thuê và xem hóa đơn online.
* Tạo nền tảng có thể mở rộng thành sản phẩm thực tế.

## 🚀 Tính năng nổi bật

### 🔐 1. Hệ thống đăng nhập – phân quyền
* Admin: quản lý toàn bộ user và hệ thống.
* Landlord (chủ trọ): quản lý dãy trọ, phòng, người thuê, hợp đồng, hóa đơn.
* Tenant (người thuê): xem phòng, gửi yêu cầu thuê, xem hóa đơn, gửi yêu cầu sửa chữa.

### 🏠 2. Quản lý phòng trọ
* CRUD phòng: thêm, sửa, xóa.
* Trạng thái phòng: available, pending, reserved, rented.
* Quản lý thông tin phòng, hình ảnh, giá thuê, diện tích.
* Quản lý phòng theo từng dãy trọ (house).

### 👤 3. Quản lý người thuê
* Thêm người thuê vào phòng sau khi ký hợp đồng.
* Quản lý thông tin cá nhân, lịch sử thuê.
* Chuyển phòng hoặc trả phòng.

### 📄 4. Yêu cầu thuê phòng (Rental Requests)
* Tenant gửi yêu cầu xem/thuê phòng online.
* Landlord xem danh sách yêu cầu và xác nhận lịch hẹn.
* Nhiều người có thể gửi yêu cầu cùng một phòng.
* Không khoá phòng khi có yêu cầu (tránh tình trạng "bom lịch").

### 📝 5. Quản lý hợp đồng thuê
* Tạo hợp đồng sau khi cọc hoặc sau khi tenant đồng ý thuê.
* Theo dõi thời gian bắt đầu – kết thúc hợp đồng.
* Quản lý tình trạng hợp đồng: active, finished, canceled.

### ⚡ 6. Quản lý chỉ số điện – nước
* Landlord nhập chỉ số điện nước hàng tháng.
* Hệ thống tự động tính:
* Điện tiêu thụ
* Nước tiêu thụ
* Chi phí theo bảng giá mới nhất
* Lưu lịch sử từng tháng.

### 💵 7. Tạo hóa đơn tự động
* Tự động tạo hóa đơn dựa trên:
* Tiền phòng
* Tiền điện – nước
* Phụ phí khác (nếu có)
* Trạng thái hóa đơn: unpaid, paid.
* Người thuê xem hóa đơn trên trang cá nhân.

### 🔔 8. Notifications – Thông báo
* Gửi thông báo khi có hóa đơn mới.
* Thông báo lịch hẹn xem phòng.
* Thông báo cập nhật hợp đồng hoặc yêu cầu thuê.

### 📝 9. Activity Logs – Nhật ký hoạt động
* Ghi lại mọi thao tác quan trọng trong hệ thống.
* Hỗ trợ việc theo dõi, kiểm tra và tăng tính bảo mật.

## 🛠 Công nghệ sử dụng
* **React.JS**
* **Node.js, ExpressJS**
* **Sequelize ORM**
* **MySQL**
* **JWT Authentication**
* **MVC + Service Layer Architecture**
* **Multer (upload image)**
* **Cloudinary (optional)**

## 📈 Giá trị của dự án
* Phù hợp làm dự án thực tập / portfolio cá nhân.
* Giúp thể hiện khả năng:
* Thiết kế hệ thống thực tế
* Thiết kế database chuẩn
* Xây dựng API chuẩn RESTful
* Áp dụng phân quyền và bảo mật
* Xử lý logic nghiệp vụ thực tế
* Làm việc với ORM (Sequelize)
* Có thể mở rộng thành sản phẩm thực tế cho các dãy trọ nhỏ.

## 📌 Ghi chú
Dự án được xây dựng theo nhu cầu thực tế của nhiều khu trọ tại Việt Nam, mô phỏng đúng quy trình:
**xem phòng → yêu cầu thuê → xem trực tiếp → cọc → ký hợp đồng → ghi điện nước → tạo hóa đơn → thanh toán.**
