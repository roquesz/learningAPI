

-- -----------------------------------------------------

-- Table `users`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `users` ;



CREATE  TABLE IF NOT EXISTS `users` (

  `id` INT NOT NULL AUTO_INCREMENT ,

  `name` VARCHAR(100) NOT NULL ,

  `email` VARCHAR(100) NOT NULL ,

  `login` VARCHAR(45) NOT NULL ,

  `password` VARCHAR(45) NOT NULL ,

  `lastLogin` DATETIME NULL ,

  `lastIp` VARCHAR(45) NULL ,

  `type` CHAR(1) NULL ,

  PRIMARY KEY (`id`) )

ENGINE = InnoDB;



INSERT INTO `users` (`name`, `email`, `login`, `password`, `type`) VALUES ('a', 'a', 'a', 'a', 'a');


-- -----------------------------------------------------

-- Table `clients`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `clients` ;



CREATE  TABLE IF NOT EXISTS `clients` (

  `id` INT NOT NULL AUTO_INCREMENT ,

  `user_id` INT NOT NULL ,

  `cpf` VARCHAR(11) NULL ,

  `address` VARCHAR(255) NULL ,

  PRIMARY KEY (`id`) ,

  INDEX `fk_clients_users_idx` (`user_id` ASC) ,

  CONSTRAINT `fk_clients_users`

    FOREIGN KEY (`user_id` )

    REFERENCES `users` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `providers`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `providers` ;



CREATE  TABLE IF NOT EXISTS `providers` (

  `id` INT NOT NULL AUTO_INCREMENT ,

  `name` VARCHAR(45) NULL ,

  `cnpj` VARCHAR(45) NULL ,

  `address` VARCHAR(255) NULL ,

  PRIMARY KEY (`id`) )

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `salesman`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `salesman` ;



CREATE  TABLE IF NOT EXISTS `salesman` (

  `id` INT NOT NULL AUTO_INCREMENT ,

  `user_id` INT NOT NULL ,

  `cpf` VARCHAR(11) NULL ,

  `registration` VARCHAR(45) NULL ,

  `hiring_date` VARCHAR(45) NULL ,

  `active` TINYINT NULL ,

  `address` VARCHAR(255) NULL ,

  PRIMARY KEY (`id`) ,

  INDEX `fk_clients_users_idx` (`user_id` ASC) ,

  CONSTRAINT `fk_clients_users0`

    FOREIGN KEY (`user_id` )

    REFERENCES `users` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `categories`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `categories` ;



CREATE  TABLE IF NOT EXISTS `categories` (

  `id` INT NOT NULL AUTO_INCREMENT ,

  `name` VARCHAR(45) NOT NULL ,

  PRIMARY KEY (`id`) )

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `products`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `products` ;



CREATE  TABLE IF NOT EXISTS `products` (

  `id` INT NOT NULL AUTO_INCREMENT ,

  `category_id` INT NOT NULL ,

  `provider_id` INT NOT NULL ,

  `name` VARCHAR(45) NOT NULL ,

  `quantity` INT NULL ,

  `quantityMinumun` INT NULL ,

  `price` DECIMAL(10,2) NULL ,

  `description` VARCHAR(245) NULL ,

  `image` BLOB NULL ,

  `active` TINYINT NULL ,

  `code` VARCHAR(45) NULL ,

  PRIMARY KEY (`id`) ,

  INDEX `fk_products_categories1_idx` (`category_id` ASC) ,

  INDEX `fk_products_providers1_idx` (`provider_id` ASC) ,

  CONSTRAINT `fk_products_categories1`

    FOREIGN KEY (`category_id` )

    REFERENCES `categories` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION,

  CONSTRAINT `fk_products_providers1`

    FOREIGN KEY (`provider_id` )

    REFERENCES `providers` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `sales`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `sales` ;



CREATE  TABLE IF NOT EXISTS `sales` (

  `id` INT NOT NULL AUTO_INCREMENT ,

  `client_id` INT NOT NULL ,

  `salesman_id` INT NOT NULL ,

  `shipping_id` INT NULL ,

  `sale_date` DATETIME NULL ,

  `send_date` DATETIME NULL ,

  PRIMARY KEY (`id`) ,

  INDEX `fk_sales_clients1_idx` (`client_id` ASC) ,

  INDEX `fk_sales_salesman1_idx` (`salesman_id` ASC) ,

  CONSTRAINT `fk_sales_clients1`

    FOREIGN KEY (`client_id` )

    REFERENCES `clients` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION,

  CONSTRAINT `fk_sales_salesman1`

    FOREIGN KEY (`salesman_id` )

    REFERENCES `salesman` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `sale_items`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `sale_items` ;



CREATE  TABLE IF NOT EXISTS `sale_items` (

  `id` INT NOT NULL AUTO_INCREMENT ,

  `sale_id` INT NOT NULL ,

  `product_id` INT NOT NULL ,

  `quantity` INT NOT NULL ,

  `price` DECIMAL(10,2) NULL ,

  PRIMARY KEY (`id`) ,

  INDEX `fk_sale_items_sales1_idx` (`sale_id` ASC) ,

  INDEX `fk_sale_items_products1_idx` (`product_id` ASC) ,

  CONSTRAINT `fk_sale_items_sales1`

    FOREIGN KEY (`sale_id` )

    REFERENCES `sales` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION,

  CONSTRAINT `fk_sale_items_products1`

    FOREIGN KEY (`product_id` )

    REFERENCES `products` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;