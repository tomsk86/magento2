TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER trg_catalog_product_entity_gallery_after_insert AFTER INSERT ON catalog_product_entity_gallery FOR EACH ROW\nBEGIN\nINSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (NEW.`entity_id`);\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER trg_catalog_product_entity_gallery_after_update AFTER UPDATE ON catalog_product_entity_gallery FOR EACH ROW\nBEGIN\nIF (NEW.`value_id` != OLD.`value_id` OR NEW.`attribute_id` != OLD.`attribute_id` OR NEW.`store_id` != OLD.`store_id` OR NEW.`entity_id` != OLD.`entity_id` OR NEW.`position` != OLD.`position` OR NEW.`value` != OLD.`value`) THEN INSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (NEW.`entity_id`); END IF;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER trg_catalog_product_entity_gallery_after_delete AFTER DELETE ON catalog_product_entity_gallery FOR EACH ROW\nBEGIN\nINSERT IGNORE INTO `catalogrule_product_cl` (`entity_id`) VALUES (OLD.`entity_id`);\nEND'
sql_modes=524288 524288 524288
definers='root@localhost' 'root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8_general_ci' 'utf8_general_ci' 'utf8_general_ci'
created=154403839916 154403839916 154403839917
