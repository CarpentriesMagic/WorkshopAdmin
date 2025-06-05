-- workshopadmin.carpentry definition

CREATE TABLE `carpentry` (
  `carpentry_code` varchar(9) NOT NULL,
  UNIQUE KEY `carpentry_code` (`carpentry_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- workshopadmin.curriculum definition

CREATE TABLE `curriculum` (
  `curriculum_code` varchar(20) NOT NULL,
  UNIQUE KEY `curriculum_code` (`curriculum_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- workshopadmin.flavour definition

CREATE TABLE `flavour` (
  `flavour_id` varchar(10) NOT NULL,
  UNIQUE KEY `flavour_id` (`flavour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- workshopadmin.people definition

CREATE TABLE `people` (
  `person_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(5) DEFAULT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `certified` tinyint(1) DEFAULT 0,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- workshopadmin.room definition

CREATE TABLE `room` (
  `room_id` varchar(10) NOT NULL,
  `description` varchar(60) NOT NULL,
  `longitude` varchar(10) NOT NULL,
  `latitude` varchar(10) NOT NULL,
  `what_three_words` varchar(40) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- workshopadmin.schedules definition

CREATE TABLE `schedules` (
  `schedule_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


-- workshopadmin.settings definition

CREATE TABLE `settings` (
  `keyvalue` varchar(20) NOT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`keyvalue`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


-- workshopadmin.workshops definition

CREATE TABLE `workshops` (
  `slug` varchar(40) NOT NULL,
  `title` varchar(100) NOT NULL,
  `humandate` varchar(25) NOT NULL,
  `humantime` varchar(25) NOT NULL,
  `startdate` varchar(10) NOT NULL,
  `enddate` varchar(10) NOT NULL,
  `room_id` varchar(10) NOT NULL,
  `language` varchar(2) NOT NULL,
  `country` varchar(2) NOT NULL,
  `online` tinyint(1) NOT NULL,
  `pilot` tinyint(1) NOT NULL,
  `inc_lesson_site` varchar(100) NOT NULL,
  `pre_survey` varchar(100) NOT NULL,
  `post_survey` varchar(100) NOT NULL,
  `carpentry_code` varchar(9) NOT NULL,
  `curriculum_code` varchar(20) NOT NULL,
  `flavour_id` varchar(10) NOT NULL,
  `eventbrite` varchar(100) NOT NULL DEFAULT ' ',
  `schedule` varchar(10) NOT NULL,
  PRIMARY KEY (`slug`),
  KEY `carpentry` (`carpentry_code`),
  KEY `room` (`room_id`),
  KEY `flavour` (`flavour_id`),
  KEY `curriculum` (`curriculum_code`),
  CONSTRAINT `carpentry` FOREIGN KEY (`carpentry_code`) REFERENCES `carpentry` (`carpentry_code`),
  CONSTRAINT `curriculum` FOREIGN KEY (`curriculum_code`) REFERENCES `curriculum` (`curriculum_code`),
  CONSTRAINT `flavour` FOREIGN KEY (`flavour_id`) REFERENCES `flavour` (`flavour_id`),
  CONSTRAINT `room` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- workshopadmin.emails definition

CREATE TABLE `emails` (
  `slug` varchar(40) NOT NULL,
  `person_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `emails` (`slug`,`person_id`) USING BTREE,
  KEY `contact` (`person_id`),
  CONSTRAINT `contact` FOREIGN KEY (`person_id`) REFERENCES `people` (`person_id`),
  CONSTRAINT `workshop` FOREIGN KEY (`slug`) REFERENCES `workshops` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- workshopadmin.helpers definition

CREATE TABLE `helpers` (
  `person_id` int(11) unsigned NOT NULL,
  `slug` varchar(40) NOT NULL,
  UNIQUE KEY `helpers` (`person_id`,`slug`),
  KEY `slug` (`slug`),
  CONSTRAINT `helpers` FOREIGN KEY (`person_id`) REFERENCES `people` (`person_id`),
  CONSTRAINT `slug` FOREIGN KEY (`slug`) REFERENCES `workshops` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- workshopadmin.instructors definition

CREATE TABLE `instructors` (
  `person_id` int(10) unsigned NOT NULL,
  `slug` varchar(40) NOT NULL,
  UNIQUE KEY `instructors` (`person_id`,`slug`) USING BTREE,
  KEY `workshopinstructor` (`slug`),
  CONSTRAINT `instructor` FOREIGN KEY (`person_id`) REFERENCES `people` (`person_id`),
  CONSTRAINT `workshopinstructor` FOREIGN KEY (`slug`) REFERENCES `workshops` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
