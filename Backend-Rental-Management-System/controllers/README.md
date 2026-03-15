# 📂 controllers/

Thư mục `controllers` chứa toàn bộ logic xử lý request - response.

## Vai trò
- Nhận request từ routes
- Gọi service để xử lý nghiệp vụ
- Trả response về cho client

## Ví dụ file
- `AuthController.js`
- `UserController.js`
- `RentalController.js`
- `VehicleController.js`

## Nguyên tắc viết
- Không viết logic trực tiếp trong controller
- Controller chỉ gọi service và trả JSON