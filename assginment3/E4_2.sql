CREATE TABLE `users` (
  `id`           VARCHAR(20)  NOT NULL,
  `password`     VARCHAR(20)  NOT NULL,
  `nickname`     VARCHAR(20)  NOT NULL,
  `profile_link` VARCHAR(200),
  `profile_msg`  VARCHAR(20),
  `leave`        TINYINT(1)   DEFAULT 0,
  `date`         INT          NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
  `id`      INT(10)      NOT NULL,
  `ch_name` VARCHAR(50)  NOT NULL,
  `ch_user` VARCHAR(20)  NOT NULL,
  `ch_link` VARCHAR(100) NOT NULL,
  `max`     INT          NOT NULL,
  `leave`   TINYINT(1)   DEFAULT 0,
  `date`    INT          NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_channels_user`
    FOREIGN KEY (`ch_user`) REFERENCES `users`(`id`)
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `chats` (
  `id`          INT          NOT NULL,
  `msg`         VARCHAR(100) NOT NULL,
  `user`        VARCHAR(20)  NOT NULL,
  `channel`     INT          NOT NULL,
  `create_date` DATE         NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_chats_user`
    FOREIGN KEY (`user`) REFERENCES `users`(`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_chats_channel`
    FOREIGN KEY (`channel`) REFERENCES `channels`(`id`)
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `follows` (
  `follower`   VARCHAR(20) NOT NULL,
  `followee`   VARCHAR(20) NOT NULL,
  `follow_date` DATE       NOT NULL,
  PRIMARY KEY (`follower`, `followee`),
  CONSTRAINT `fk_follows_follower`
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_follows_followee`
    FOREIGN KEY (`followee`) REFERENCES `users`(`id`)
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `blocks` (
  `blocker`    VARCHAR(20) NOT NULL,
  `blocked`    VARCHAR(20) NOT NULL,
  `block_date` DATE        NOT NULL,
  PRIMARY KEY (`blocker`, `blocked`),
  CONSTRAINT `fk_blocks_blocker`
    FOREIGN KEY (`blocker`) REFERENCES `users`(`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_blocks_blocked`
    FOREIGN KEY (`blocked`) REFERENCES `users`(`id`)
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;