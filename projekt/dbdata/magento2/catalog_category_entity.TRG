TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER trg_catalog_category_entity_after_insert AFTER INSERT ON catalog_category_entity FOR EACH ROW\nBEGIN\nINSERT IGNORE INTO `catalog_category_product_cl` (`entity_id`) VALUES (NEW.`entity_id`);\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER trg_catalog_category_entity_after_update AFTER UPDATE ON catalog_category_entity FOR EACH ROW\nBEGIN\nIF (NEW.`entity_id` != OLD.`entity_id` OR NEW.`attribute_set_id` != OLD.`attribute_set_id` OR NEW.`parent_id` != OLD.`parent_id` OR NEW.`created_at` != OLD.`created_at` OR NEW.`path` != OLD.`path` OR NEW.`position` != OLD.`position` OR NEW.`level` != OLD.`level` OR NEW.`children_count` != OLD.`children_count`) THEN INSERT IGNORE INTO `catalog_category_product_cl` (`entity_id`) VALUES (NEW.`entity_id`); END IF;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER trg_catalog_category_entity_after_delete AFTER DELETE ON catalog_category_entity FOR EACH ROW\nBEGIN\nINSERT IGNORE INTO `catalog_category_product_cl` (`entity_id`) VALUES (OLD.`entity_id`);\nEND'
sql_modes=524288 524288 524288
definers='root@localhost' 'root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8_general_ci' 'utf8_general_ci' 'utf8_general_ci'
created=154403839909 154403839909 154403839910
