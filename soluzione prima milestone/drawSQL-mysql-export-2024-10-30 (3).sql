CREATE TABLE `likes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_post` BIGINT NOT NULL,
    `id_user` BIGINT NOT NULL
);
CREATE TABLE `post_like`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_post` BIGINT NOT NULL,
    `id_like` BIGINT NOT NULL
);
CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `age` TINYINT NOT NULL
);
CREATE TABLE `posts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `post_description` TEXT NOT NULL,
    `user_id` BIGINT NOT NULL
);
CREATE TABLE `media`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `post_id` BIGINT NOT NULL,
    `media_title` VARCHAR(255) NOT NULL,
    `media_type` BIGINT NOT NULL,
    `media_content` VARCHAR(255) NOT NULL,
    `media_format` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `likes` ADD CONSTRAINT `likes_id_user_foreign` FOREIGN KEY(`id_user`) REFERENCES `users`(`id`);
ALTER TABLE
    `posts` ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `media` ADD CONSTRAINT `media_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `posts`(`id`);
ALTER TABLE
    `post_like` ADD CONSTRAINT `post_like_id_post_foreign` FOREIGN KEY(`id_post`) REFERENCES `posts`(`id`);
ALTER TABLE
    `post_like` ADD CONSTRAINT `post_like_id_like_foreign` FOREIGN KEY(`id_like`) REFERENCES `likes`(`id`);
ALTER TABLE
    `likes` ADD CONSTRAINT `likes_id_post_foreign` FOREIGN KEY(`id_post`) REFERENCES `posts`(`id`);