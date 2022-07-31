CREATE TABLE Students (
    id INT NOT NULL PRIMARY KEY,
    fullname NVARCHAR (100) NOT NULL,
    email VARCHAR (150) NOT NULL UNIQUE,
    phone VARCHAR(10) NULL UNIQUE,
    faculty NVARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Students (id, fullname, email, phone, faculty)
VALUES
(1, N'Trần Tuấn Kiệt', 'tuankiett@gmail.com', '0931908960', N'CNTT'),
(2, N'Mai Xuân Tài', 'xuantai97@gmail.com', '0931602128', N'Điện - Điện tử'),
(3, N'Lê Quỳnh Như', 'quynhnhu2k1@gmail.com', '0902330613', N'Ngoại ngữ');

