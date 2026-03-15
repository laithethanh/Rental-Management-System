# /src/contexts

Chứa các Context cung cấp state toàn cục (thay cho Redux):
- AuthContext.js: quản lý đăng nhập, token, user.
- RoomContext.js: quản lý phòng.
- TenantContext.js: quản lý người thuê.
- ContractContext.js: quản lý hợp đồng.
- InvoiceContext.js: quản lý hóa đơn.

Mỗi context chứa:
- state
- hàm cập nhật state
- provider để bao toàn app