DROP TABLE IF EXISTS `credit_card_data`;
CREATE TABLE `credit_card_data` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `offer_accepted` VARCHAR(6),
  `reward` VARCHAR(255),
  `mailer_type` VARCHAR(255),
  `income_level` VARCHAR(255),
  `nr_of_bank_accounts_open` int(11) DEFAULT NULL,
  `overdraft_protection` VARCHAR(6),
  `credit_rating` VARCHAR(255),
  `credit_cards_held` int(11) DEFAULT NULL,
  `nr_of_homes_owned` int(11) DEFAULT NULL,
  `household_size` int(11) DEFAULT NULL,
  `own_your_home` VARCHAR(6),
  `average_balance` float DEFAULT NULL,
  `balance_q1` float DEFAULT NULL,
  `balance_q2` float DEFAULT NULL,
  `balance_q3` float DEFAULT NULL,
  `balance_q4` float DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA LOCAL INFILE '/Users/saranavarromedina/Documents/GitHub/classification_project/project_content'
INTO TABLE credit_card_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"';