CREATE TABLE `user` (
                        `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        `name` VARCHAR(255),
                        `money` DECIMAL(10, 2),
                        `address` VARCHAR(255),
                        `phone` VARCHAR(15),
                        `birthdate` DATE,
                        `status` VARCHAR(50)
);

CREATE TABLE `transfer` (
                            `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                            `sender_id` INT,
                            `receiver_id` INT,
                            `money` DECIMAL(10, 2),
                            FOREIGN KEY (`sender_id`) REFERENCES `user`(`id`),
                            FOREIGN KEY (`receiver_id`) REFERENCES `user`(`id`)
);

