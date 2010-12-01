CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL auto_increment,
  `item_id` int(11) default NULL,
  `cart_id` int(11) default NULL,
  `price` float default NULL,
  `amount` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `size_id` int(11) default NULL,
  `colour_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `carts` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `season_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `category1s` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `season_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `colours` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `html_code` varchar(6) default NULL,
  `name_eng` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) default NULL,
  `phone` varchar(50) default NULL,
  `address` varchar(100) default NULL,
  `photo` varchar(100) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `data_files` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  `root_id` int(11) NOT NULL default '0',
  `parent_id` int(11) NOT NULL default '0',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  `depth` int(11) NOT NULL default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `items` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `blurb` text,
  `price` float default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `category_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `items_colours` (
  `item_id` int(11) NOT NULL,
  `colour_id` int(11) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `items_sizes` (
  `item_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mugshots` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `content_type` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `size` int(11) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL auto_increment,
  `item_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  `price` float default NULL,
  `amount` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `size_id` int(11) default NULL,
  `colour_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `phone_number` varchar(255) default NULL,
  `ship_to_first_name` varchar(255) default NULL,
  `ship_to_last_name` varchar(255) default NULL,
  `ship_to_middle_name` varchar(255) default NULL,
  `ship_to_address` varchar(255) default NULL,
  `ship_to_city` varchar(255) default NULL,
  `ship_to_postal_code` varchar(255) default NULL,
  `ship_to_country` varchar(255) default NULL,
  `customer_ip` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `error_message` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `comments` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `photos` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `comment` varchar(50) default NULL,
  `parent_id` int(11) default NULL,
  `content_type` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `size` int(11) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `item_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) character set latin1 NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `seasons` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `icon` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `size1s` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `first_name` varchar(80) default NULL,
  `last_name` varchar(80) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) default NULL,
  `remember_token_expires_at` datetime default NULL,
  `activation_code` varchar(40) default NULL,
  `activated_at` datetime default NULL,
  `pw_reset_code` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20100329151521');

INSERT INTO schema_migrations (version) VALUES ('20100329152714');

INSERT INTO schema_migrations (version) VALUES ('20100330180350');

INSERT INTO schema_migrations (version) VALUES ('20100331112157');

INSERT INTO schema_migrations (version) VALUES ('20100417192453');

INSERT INTO schema_migrations (version) VALUES ('20100418124016');

INSERT INTO schema_migrations (version) VALUES ('20100419090344');

INSERT INTO schema_migrations (version) VALUES ('20100421103628');

INSERT INTO schema_migrations (version) VALUES ('20100421104623');

INSERT INTO schema_migrations (version) VALUES ('20100421194534');

INSERT INTO schema_migrations (version) VALUES ('20100421195214');

INSERT INTO schema_migrations (version) VALUES ('20100422130124');

INSERT INTO schema_migrations (version) VALUES ('20100422170151');

INSERT INTO schema_migrations (version) VALUES ('20100422172252');

INSERT INTO schema_migrations (version) VALUES ('20100425092746');

INSERT INTO schema_migrations (version) VALUES ('20100425093740');

INSERT INTO schema_migrations (version) VALUES ('20100427092653');

INSERT INTO schema_migrations (version) VALUES ('20100502141702');

INSERT INTO schema_migrations (version) VALUES ('20100502162842');

INSERT INTO schema_migrations (version) VALUES ('20100502190301');

INSERT INTO schema_migrations (version) VALUES ('20100504174745');

INSERT INTO schema_migrations (version) VALUES ('20100504181740');

INSERT INTO schema_migrations (version) VALUES ('20100504185451');

INSERT INTO schema_migrations (version) VALUES ('20100504205505');

INSERT INTO schema_migrations (version) VALUES ('20100507172606');

INSERT INTO schema_migrations (version) VALUES ('20100509130845');

INSERT INTO schema_migrations (version) VALUES ('20100515095544');

INSERT INTO schema_migrations (version) VALUES ('20100516065905');

INSERT INTO schema_migrations (version) VALUES ('20100516132623');

INSERT INTO schema_migrations (version) VALUES ('20100525103800');

INSERT INTO schema_migrations (version) VALUES ('20100526185736');

INSERT INTO schema_migrations (version) VALUES ('20100529102531');