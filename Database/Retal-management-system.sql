-- Tạo Database
CREATE DATABASE IF NOT EXISTS rental_management_system CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE rental_management_system;

-- 1. Bảng Users (Người dùng)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255) NOT NULL,
    avatar VARCHAR(255),
    role ENUM('admin', 'landlord', 'tenant') DEFAULT 'tenant',
    status ENUM('active', 'locked') DEFAULT 'active',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2. Bảng App Settings (Cấu hình hệ thống)
CREATE TABLE app_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    appName VARCHAR(100),
    logoUrl VARCHAR(255),
    bankName VARCHAR(100),
    bankAccount VARCHAR(50),
    bankOwner VARCHAR(100),
    qrCodeUrl VARCHAR(255)
);

-- 3. Bảng Amenities (Tiện ích danh mục)
CREATE TABLE amenities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    icon VARCHAR(50) -- lưu tên class icon hoặc link icon
);

-- 4. Bảng Services (Danh mục dịch vụ)
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    unit VARCHAR(50) NOT NULL, -- kWh, m3, person, room
    price DECIMAL(10, 2) NOT NULL,
    type ENUM('fixed', 'meter') DEFAULT 'fixed'
);

-- 5. Bảng Houses (Tòa nhà)
CREATE TABLE houses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    description TEXT,
    landlordId INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (landlordId) REFERENCES users(id) ON DELETE SET NULL
);

-- 6. Bảng Rooms (Phòng trọ)
CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    houseId INT,
    roomNumber VARCHAR(50) NOT NULL,
    priceRoom DECIMAL(15, 2) NOT NULL,
    area FLOAT,
    maxPeople INT,
    currentPeople INT,
    status ENUM('available', 'partially_rented', 'full', 'maintenance') DEFAULT 'available',
    description TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (houseId) REFERENCES houses(id) ON DELETE CASCADE
);

-- 7. Bảng Room Images (Hình ảnh phòng)
CREATE TABLE room_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roomId INT,
    imageUrl VARCHAR(255) NOT NULL,
    isPrimary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (roomId) REFERENCES rooms(id) ON DELETE CASCADE
);

-- 8. Bảng Room Amenities (Bảng trung gian Tiện ích)
CREATE TABLE room_amenities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roomId INT,
    amenityId INT,
    FOREIGN KEY (roomId) REFERENCES rooms(id) ON DELETE CASCADE,
    FOREIGN KEY (amenityId) REFERENCES amenities(id) ON DELETE CASCADE
);

-- 9. Bảng Room Services (Dịch vụ áp dụng cho từng phòng)
CREATE TABLE room_services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roomId INT,
    serviceId INT,
    FOREIGN KEY (roomId) REFERENCES rooms(id) ON DELETE CASCADE,
    FOREIGN KEY (serviceId) REFERENCES services(id) ON DELETE CASCADE
);

-- 10. Bảng Rental Requests (Yêu cầu xem phòng)
CREATE TABLE rental_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    roomId INT,
    appointmentDate DATETIME,
    status ENUM('pending', 'confirmed', 'canceled', 'success') DEFAULT 'pending',
    note TEXT,
    quantityPeople ENUM('1', '2', '3', '4') DEFAULT '1'
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (roomId) REFERENCES rooms(id) ON DELETE CASCADE
);

-- 11. Bảng Deposits (Cọc giữ phòng)
CREATE TABLE deposits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    roomId INT,
    amount DECIMAL(15, 2) NOT NULL,
    status ENUM('pending', 'success', 'refund', 'forfeited') DEFAULT 'pending',
    expiredAt DATETIME,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (roomId) REFERENCES rooms(id) ON DELETE CASCADE
);

-- 12. Bảng Contracts (Hợp đồng thuê)
CREATE TABLE contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roomId INT,
    tenantId INT,
    startDate DATE NOT NULL,
    endDate DATE,
    depositAmount DECIMAL(15, 2),
    paymentCycle INT DEFAULT 1, -- Số tháng thanh toán một lần
    status ENUM('active', 'finished', 'liquidated') DEFAULT 'active',
    contractPdfUrl VARCHAR(255),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (roomId) REFERENCES rooms(id) ON DELETE CASCADE,
    FOREIGN KEY (tenantId) REFERENCES users(id) ON DELETE CASCADE
);

-- 13. Bảng Electric Water Usage (Chỉ số điện nước)
CREATE TABLE electric_water_usage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roomId INT,
    serviceId INT,
    oldValue FLOAT DEFAULT 0,
    newValue FLOAT DEFAULT 0,
    imageProof VARCHAR(255),
    month INT,
    year INT,
    recordedBy INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (roomId) REFERENCES rooms(id) ON DELETE CASCADE,
    FOREIGN KEY (serviceId) REFERENCES services(id) ON DELETE CASCADE,
    FOREIGN KEY (recordedBy) REFERENCES users(id) ON DELETE SET NULL
);

-- 14. Bảng Bills (Hóa đơn tổng)
CREATE TABLE bills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contractId INT,
    month INT,
    year INT,
    roomPrice DECIMAL(15, 2),
    serviceTotal DECIMAL(15, 2),
    otherFees DECIMAL(15, 2) DEFAULT 0,
    totalAmount DECIMAL(15, 2),
    status ENUM('unpaid', 'partial', 'paid') DEFAULT 'unpaid',
    dueDate DATE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contractId) REFERENCES contracts(id) ON DELETE CASCADE
);

-- 15. Bảng Bill Details (Chi tiết hóa đơn)
CREATE TABLE bill_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    billId INT,
    serviceName VARCHAR(100),
    oldValue FLOAT,
    newValue FLOAT,
    usageValue FLOAT,
    unitPrice DECIMAL(10, 2),
    subTotal DECIMAL(15, 2),
    FOREIGN KEY (billId) REFERENCES bills(id) ON DELETE CASCADE
);

-- 16. Bảng Payments (Lịch sử thanh toán)
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    billId INT,
    amount DECIMAL(15, 2) NOT NULL,
    method ENUM('cash', 'bank', 'momo', 'zalopay') DEFAULT 'bank',
    transactionId VARCHAR(100),
    proofImageUrl VARCHAR(255),
    status ENUM('pending', 'success', 'failed') DEFAULT 'pending',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (billId) REFERENCES bills(id) ON DELETE CASCADE
);

-- 17. Bảng Notifications (Thông báo)
CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    title VARCHAR(255),
    message TEXT,
    type ENUM('bill', 'system', 'maintenance', 'request') DEFAULT 'system',
    isRead BOOLEAN DEFAULT FALSE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
);

-- 18. Bảng Maintenance Requests (Báo hỏng/sửa chữa)
CREATE TABLE maintenance_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roomId INT,
    tenantId INT,
    title VARCHAR(255),
    description TEXT,
    priority ENUM('low', 'high') DEFAULT 'low',
    status ENUM('open', 'processing', 'fixed') DEFAULT 'open',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (roomId) REFERENCES rooms(id) ON DELETE CASCADE,
    FOREIGN KEY (tenantId) REFERENCES users(id) ON DELETE CASCADE
);

-- 19. Bảng Maintenance Images (Ảnh hiện trạng hư hỏng)
CREATE TABLE maintenance_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    requestId INT,
    imageUrl VARCHAR(255) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (requestId) REFERENCES maintenance_requests(id) ON DELETE CASCADE
);

-- 20. Bảng Activity Logs (Nhật ký hoạt động)
CREATE TABLE activity_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    actionType VARCHAR(50),
    description TEXT,
    ipAddress VARCHAR(45),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(id) ON DELETE SET NULL
);