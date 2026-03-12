# Rental-Management-System
Rental Management System là một ứng dụng web giúp chủ trọ quản lý toàn bộ hoạt động vận hành phòng trọ một cách hiệu quả và chuyên nghiệp. Hệ thống hỗ trợ ba vai trò người dùng chính: Admin, Landlord (Chủ trọ) và Tenant (Người thuê), với các chức năng được phân quyền rõ ràng.
Dự án được xây dựng theo mô hình MVC, dùng Node.js – Express – Sequelize – MySQL ở backend, hướng tới việc mô phỏng quy trình quản lý phòng trọ ngoài đời thực.
🎯 Mục tiêu dự án
Số hóa việc quản lý phòng trọ vốn còn thủ công (giấy tờ, sổ ghi điện nước, sổ thu tiền).
Hỗ trợ chủ trọ theo dõi phòng trống, người thuê, hợp đồng, ghi điện nước, tạo hóa đơn tự động.
Giúp người thuê xem phòng, gửi yêu cầu thuê, theo dõi hóa đơn và lịch sử thanh toán.
Tối ưu vận hành, giảm sai sót, tăng tính minh bạch.
🚀 Các tính năng nổi bật
🔐 1. Hệ thống đăng nhập – phân quyền người dùng

Admin: quản lý toàn bộ người dùng & hệ thống

Landlord: quản lý dãy trọ, phòng, người thuê và hóa đơn

Tenant: xem phòng, gửi yêu cầu thuê, xem hóa đơn

🏠 2. Quản lý phòng trọ

Thêm / sửa / xoá phòng

Quản lý trạng thái phòng:
available, pending, reserved, rented

Upload hình ảnh phòng

Theo dõi phòng thuộc dãy trọ nào

🧑‍🤝‍🧑 3. Quản lý người thuê (Tenant)

Thêm người thuê vào phòng sau khi ký hợp đồng

Xem thông tin người thuê

Chuyển phòng hoặc trả phòng

📄 4. Yêu cầu thuê phòng (Rental Requests)

Người thuê gửi yêu cầu online

Chủ trọ duyệt hoặc hủy yêu cầu

Hỗ trợ nhiều người cùng yêu cầu 1 phòng (first-come-first-serve)

Không khoá phòng khi có yêu cầu giúp hạn chế “bom lịch”

📝 5. Hợp đồng thuê phòng

Tạo hợp đồng sau khi cọc

Quản lý trạng thái hợp đồng

Theo dõi thời hạn hợp đồng

⚡ 6. Ghi chỉ số điện – nước

Chủ trọ nhập chỉ số hàng tháng

Hệ thống tự tính:

số điện/nước sử dụng

số tiền dựa trên bảng giá mới nhất

Lưu lịch sử theo từng tháng

💵 7. Tạo hóa đơn tự động

Tự động tạo hóa đơn mỗi tháng dựa trên:

tiền phòng

tiền điện

tiền nước

các phụ phí (nếu có)

Trạng thái hóa đơn: unpaid, paid

Lưu lịch sử thanh toán

🔔 8. Notifications – Thông báo

Gửi thông báo khi có hóa đơn mới

Nhắc lịch thanh toán

Thông báo yêu cầu thuê mới

📝 9. Activity Logs – Nhật ký hoạt động

Ghi lại toàn bộ thao tác của landlord/admin

Hỗ trợ kiểm tra, audit và bảo mật hệ thống

🗂 Cấu trúc database chính (MySQL)

Dự án bao gồm các bảng:

users – Người dùng hệ thống

houses – Dãy trọ

rooms – Chi tiết phòng

rental_requests – Yêu cầu thuê phòng

contracts – Hợp đồng thuê

electric_water – Chỉ số điện nước

price_table – Bảng giá điện nước

bills – Hóa đơn

payments – Thanh toán

deposits – Quản lý cọc

notifications – Thông báo

activity_logs – Nhật ký hoạt động

🛠 Công nghệ sử dụng

Backend: Node.js, ExpressJS

ORM: Sequelize

Database: MySQL

Architecture: MVC + Service Layer

Auth: JWT

Storage: Multer (upload ảnh), Cloudinary (tuỳ chọn)

📈 Giá trị của dự án

Phù hợp làm dự án thực tập, đồ án tốt nghiệp hoặc portfolio cá nhân

Thể hiện khả năng:

Thiết kế hệ thống

Thiết kế database chuẩn hóa

Xử lý logic nghiệp vụ thực tế

Phân quyền người dùng

Work với ORM (Sequelize)

Xây dựng APIs chuyên nghiệp

Có thể mở rộng thành sản phẩm thực tế
