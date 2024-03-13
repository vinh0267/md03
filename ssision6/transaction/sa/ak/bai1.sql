-- Bắt đầu transaction
START TRANSACTION;

-- Kiểm tra nếu số tiền trong tài khoản A lớn hơn hoặc bằng số tiền cần trừ
-- Nếu không đủ số tiền, hủy bỏ transaction và báo lỗi
SELECT * FROM `account_banking` WHERE `name` = 'A' AND `amount` >= 5000000.0;

-- Trừ số tiền từ tài khoản A nếu số tiền đủ
UPDATE `account_banking`
SET `amount` = `amount` - 5000000.0
WHERE `name` = 'A' AND `amount` >= 5000000.0;

-- Cộng số tiền vào tài khoản B
UPDATE `account_banking`
SET `amount` = `amount` + 5000000.0
WHERE `name` = 'B';

-- Kiểm tra xem có lỗi không. Nếu không có lỗi, commit transaction
COMMIT;

-- Nếu có lỗi, rollback transaction
ROLLBACK;
