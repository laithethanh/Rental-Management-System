# 📂 config/

Thư mục `config` chứa toàn bộ các cấu hình cốt lõi của hệ thống backend.

## Nội dung chính
- **database.js**: Kết nối với cơ sở dữ liệu (MySQL / MongoDB / PostgreSQL).
- **env.js**: Load biến môi trường từ `.env`.
- **appConfig.js**: Các cấu hình chung cho server (port, cors, json limit,...).

## Mục đích
Tách riêng cấu hình giúp:
- Dễ bảo trì
- Dễ tái sử dụng
- Không lẫn logic với code xử lý nghiệp vụ