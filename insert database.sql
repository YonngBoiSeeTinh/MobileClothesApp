-- Thêm dữ liệu vào bảng Categories
INSERT INTO Categories (name, description) VALUES
(N'Shirt', N'Các dòng iPhone mới nhất của Apple'),
(N'Shoes', N'Các dòng MacBook Air và MacBook Pro'),
(N'Jeans', N'Các dòng iPad từ Mini đến Pro'),
(N'Short', N'Tai nghe không dây cao cấp của Apple'),
(N'T Shirt', N'Apple Watch các phiên bản'),
(N'Pant', N'Các phụ kiện hỗ trợ Apple devices');


-- Thêm dữ liệu vào bảng Users
INSERT INTO Users (name, account, phone, address, role) VALUES
(N'Nguyễn Tùng Lâm', 1, '0987654321', N'TP.HCM', 2),
(N'Cao Xuân Quang', 2, '0912345678', N'TP.HCM', 4),
(N'Đoàn Hữu Nghĩa', 3, '0905123456', N'Đà Nẵng', 4),
(N'Nguyễn Ngọc Kim Sơn', 4, '0922334455', N'Hải Phòng', 4);

-- Thêm dữ liệu vào bảng Roles
INSERT INTO Roles (name, promo) VALUES
(N'Khách vãng lai', 0),
(N'Admin', 0),
(N'Nhân viên', 5),
(N'Khách hàng thường', 0),
(N'Khách hàng Bạc', 7),
(N'Khách hàng Vàng', 10),
(N'Khách hàng thường', 0),
(N'Khách hàng Bạc', 7),
(N'Khách hàng Vàng', 10),
(N'Khách hàng Kim Cương', 15);

-- Thêm dữ liệu vào bảng Accounts
INSERT INTO Accounts (user_id, email, password) VALUES
(1, 'lamnt108@gmail.com', '$2a$11$DtH80CwOQ5BiwisbC7g9eOEmBeIHWm4Wzw533d8k.nytLF87vo27a'),
(2, 'qcao@gmail.com', '$2a$11$DtH80CwOQ5BiwisbC7g9eOEmBeIHWm4Wzw533d8k.nytLF87vo27a'),
(3, 'dnghia@gmail.com', '$2a$11$DtH80CwOQ5BiwisbC7g9eOEmBeIHWm4Wzw533d8k.nytLF87vo27a'),
(4, 'nsong@gmail.com', '$2a$11$DtH80CwOQ5BiwisbC7g9eOEmBeIHWm4Wzw533d8k.nytLF87vo27a');

-- Thêm dữ liệu vào bảng Products
INSERT INTO Products (name, description, price, promo, unit, brand, category_id) VALUES
(N'T-Shirt Trắng', N'Áo T-Shirt trắng, 100% cotton', 150000, 10, N'Cái', N'Uniqlo', 5),
(N'Quần Jean Xanh', N'Quần Jean xanh chất lượng cao', 300000, 15, N'Cái', N'Levis', 3),
(N'Giày Thể Thao', N'Giày thể thao, thiết kế trẻ trung', 500000, 20, N'Đôi', N'Adidas', 2),
(N'Áo Sơ Mi', N'Áo sơ mi trắng công sở', 200000, 5, N'Cái', N'H&M', 1);

-- Thêm dữ liệu vào bảng ColorSize
INSERT INTO ColorSize (product_id, color, size, quantity, code) VALUES
(1, N'Trắng', N'M', 50, N'TS-WH-M'),
(1, N'Trắng', N'L', 40, N'TS-WH-L'),
(2, N'Xanh', N'32', 30, N'JE-BL-32'),
(2, N'Xanh', N'34', 25, N'JE-BL-34'),
(3, N'Đen', N'41', 20, N'SH-BL-41'),
(3, N'Đen', N'42', 15, N'SH-BL-42'),
(4, N'Tráng', N'M', 60, N'SM-WH-M'),
(4, N'Tráng', N'L', 50, N'SM-WH-L');

-- Thêm dữ liệu vào bảng Orders
INSERT INTO Orders (user_id, total_price, status, name, phone, address) VALUES
(1, 700000, N'Đang giao hàng', N'Nguyễn Tùng Lâm', '0987654321', N'TP.HCM'),
(2, 500000, N'Chờ xác nhận', N'Cao Xuân Quang', '0912345678', N'TP.HCM'),
(3, 300000, N'Hoàn thành', N'Đoàn Hữu Nghĩa', '0905123456', N'Đà Nẵng');

-- Thêm dữ liệu vào bảng OrderDetails
INSERT INTO OrderDetails (order_id, color_size_id, quantity, price, productId) VALUES
(1, 1, 2, 300000, 1),
(1, 3, 1, 300000, 2),
(2, 5, 1, 500000, 3),
(3, 7, 3, 600000, 4);

-- Thêm dữ liệu vào bảng Cart
INSERT INTO Cart (product_id, quantity, user_id, color_size_id, price) VALUES
(1, 2, 2, 2, 300000),
(2, 1, 3, 3, 300000),
(3, 1, 1, 5, 500000);

-- Thêm dữ liệu vào bảng Promotion
INSERT INTO Promotion (name, value, end_at) VALUES
(N'Khuyến mãi Tết', 100000, '2025-02-01'),
(N'Giảm giá cuối năm', 150000, '2025-12-31'),
(N'Giảm giá đặc biệt', 200000, '2025-05-15');
