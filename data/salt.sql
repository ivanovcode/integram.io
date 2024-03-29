-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: sait
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `parent` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_id_uindex` (`id`),
  UNIQUE KEY `categories_title_uindex` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Походы',0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datecreate` datetime NOT NULL,
  `datepublic` datetime NOT NULL,
  `dateevent` datetime NOT NULL,
  `id_category` int NOT NULL,
  `id_post` int NOT NULL,
  `id_location` int NOT NULL,
  `id_group` int NOT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_id_uindex` (`id`),
  KEY `events_categories_id_fk` (`id_category`),
  KEY `events_groups_id_fk` (`id_group`),
  KEY `events_locations_id_fk` (`id_location`),
  KEY `events_posts_id_fk` (`id_post`),
  CONSTRAINT `events_categories_id_fk` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`),
  CONSTRAINT `events_groups_id_fk` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`),
  CONSTRAINT `events_locations_id_fk` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id`),
  CONSTRAINT `events_posts_id_fk` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subscribers` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name_id_uindex` (`id`),
  UNIQUE KEY `groups_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Походы сочи донейшн','https://vk.com/public165829339',1792),(2,'Походы Выходного Дня СОЧИ','https://vk.com/pvd_sochi',7727),(3,'ТурКлуб «Равновесие» | Походы Скалолазание Сочи','https://vk.com/tourist_club_ravnovesie',1284),(4,'Походы Сочи, Крым, Кавказ, Кипр','https://vk.com/trop_pik',11984),(5,'Походы в горы Кавказа и Сочи /Sochi-mountain.ru','https://vk.com/public109216526',781),(6,'Турклуб Глобус | Походы и путешествия','https://vk.com/travel_kavkaz',31870),(7,'Духовные практики в Сочи','https://vk.com/artur.meditation',96),(8,'Походы по Сочи, Крыму, Турции, Кавказу','https://vk.com/pohod.sochi',21853),(9,'Турклуб Люутища . Походы в Сочи','https://vk.com/pohodyvsochi',158),(10,'На высоте! Походы и экскурсии в Сочи','https://vk.com/na_vysote23',153),(11,'ПОХОДЫ В СОЧИ - ТурКлуб \"АТМОСФЕРА\"','https://vk.com/pohody_v_sochi',4672),(12,'Туризм|Походы|Экскурсии|Активный отдых в Сочи','https://vk.com/moregoryvsochi',346),(13,'Походы в Сочи, Джиппинг, Путешествия','https://vk.com/angrygids',2855),(14,'Неизведанная Абхазия: приключенческий фото-тур','https://vk.com/abhazia2021',39),(15,'Развивающие походы Сочи, Краснодар и край','https://vk.com/detskie_tematichiskie_poxody',105),(16,'Походы Сочи Абхазия','https://vk.com/pohodvgoru',3185),(17,'Походы и отдых в Сочи','https://vk.com/sochipohod',2016),(18,'Походы и активный отдых в Сочи','https://vk.com/pohodiki_v_sochi',1307),(19,'Походы активный отдых в Сочи и Крыму, по Кавказу','https://vk.com/pohody_v_sochi_po_krimu_i_kavkaz',645),(20,'Походы Сочи Активный Отдых','https://vk.com/active_sochi_world',21),(21,'магазин приключений Just For Fun','https://vk.com/justforfun_a_s',863),(22,'Походы и экскурсии в Сочи','https://vk.com/sochiorgtourism',716),(23,'ТУРИЗМ СОЧИ ПОХОДЫ КРАСНАЯ ПОЛЯНА','https://vk.com/triptopeak',40),(24,'Походы в горы Сочи','https://vk.com/public30372347',71),(25,'Экскурсии и Походы в Сочи. Эксклюзив','https://vk.com/public100609312',35),(26,'Рупор Сочи','https://vk.com/ruporsochi',149),(27,'Альпинатур [#горный_туризм #пешие_походы#Сочи','https://vk.com/alpinatur',1870),(28,'Выгул собак в Сочи Viki Vinki','https://vk.com/viki.vinkii',141),(29,'Походы и велопокатухи по красотам Абхазии и Сочи','https://vk.com/club2829777',151),(30,'Турклуб Непросто походы в Сочи','https://vk.com/nepro100sochi',31),(31,'Фотопоходы Сочи | Походы Путешествия Фотография','https://vk.com/sochi_hiking',730),(32,'Adventure Mass Group (Походы/Сочи/Абхазия)','https://vk.com/adventuremassgroupe',475),(33,'Конные прогулки и походы в Лазаревском ЧК Ярис','https://vk.com/club87740729',1763),(34,'Персеиды 2021г. Наблюдения метеорного потока','https://vk.com/perseidyi',173),(35,'Event агентство \"Хоро-show тур\" Сочи','https://vk.com/club20710481',28),(36,'ПОХОДЫ В ГОРЫ','https://vk.com/pohodygory',1015),(37,'Star Party февраль 2021 Выезд из Сочи, Краснодар','https://vk.com/astro_tuapse',48),(38,'Мистические походы Сочи','https://vk.com/club149384710',21),(39,'Пешие походы, экскурсии | Красная Поляна Сочи','https://vk.com/gidpolyana',714),(40,'Крым. Астрофото тур, март 2021г','https://vk.com/astro_crimea',23),(41,'STARFEST 2019 в Абхазии','https://vk.com/astroabhazia',56),(42,'\"АртТур\" ~ станция Эко-туризма и Творчества','https://vk.com/stanciya_arttour_2018',62),(43,'Геминиды. Ярчайшая комета и меорный поток 2021!','https://vk.com/geminids',84),(44,'Яхт Клуб | ТамЗаГородами | Сочи','https://vk.com/clubza_yacht',26),(45,'Походы в Сочи | Скалолазание | Джуманджи','https://vk.com/pohodi_jumanji',32),(46,'MICE | Трансфер | Туризм | Походы | Сочи','https://vk.com/club186132335',18),(47,'Походы Сочи|Абхазия|Красная поляна 2016 :)','https://vk.com/pohody2016',736),(48,'В мире галактик и туманностей: Deep Sky выезд','https://vk.com/deepsky_observing',48),(49,'=▄▄===▄▄==▄█==▄▄= █==█=█==█==█=█==█ =▄▀==█==█...','https://vk.com/club19227049',14),(50,'СОЧИ. Активный отдых|Походы|Горы|Водопады','https://vk.com/sochi_travel.club',97),(51,'Природа Сочи','https://vk.com/priroda_sochi',249),(52,'Недавно переехавшие в Адлер, Сочи , походы 1 дня','https://vk.com/club110608669',30),(53,'Белоказачья община Рыбинска им.Б.И.Крутченского','https://vk.com/belokazaki',87),(54,'Сочи Кони. Конные походы, прогулки, фотосессии.','https://vk.com/sochikoni',42),(55,'Активный туризм.Джиппинг. Походы.','https://vk.com/club16262483',13),(56,'Есенин в душе.','https://vk.com/sergey.alc.esenin',47),(57,'Индивидуальные Походы Сочи','https://vk.com/kosatka_trip',910),(58,'\"Фантазёры\"','https://vk.com/club152295629',230),(59,'ВЕЛОТУРЫ И ПОХОДЫ В СОЧИ И АБХАЗИИ_GREEN TRAIL','https://vk.com/green_trail',4074),(60,'Путешествия | Походы | Горы','https://vk.com/travel.mountains',999),(61,'Отдых на море - Лазаревское, Аше','https://vk.com/club142608112',981),(62,'Походы / Красная поляна / Роза Хутор / Горы','https://vk.com/gornya_polana',144),(63,'SkyXakep [deathroad]','https://vk.com/skystalk',12),(64,'Походы по Сочи и Кавказу.','https://vk.com/sochitrek',7451),(65,'Походы в Сочи и Красной Поляне','https://vk.com/pohodyvsochi_1',1078),(66,'СОЛНЕЧНЫЕ ГОРЫ - ПОХОДЫ, ТРЕККИНГ, СОЧИ, АБХАЗИЯ','https://vk.com/sunnymountains',64),(67,'Ю.М.Рощупкин и его походы. Наши сочинения.','https://vk.com/club61944677',23),(68,'На Юг Готиница _Lermntovo_','https://vk.com/lermontovo_sea',2081),(69,'ТУРИСТИЧЕСКОЕ АГЕНТСТВО \"АРАВАНА\"','https://vk.com/club26336244',937),(70,'Индивидуальные экскурсии по Сочи','https://vk.com/dmitriypirozhkov',254),(71,'Club Adventurers Sochi - Походы в Сочи','https://vk.com/casochi',427),(72,'В Дебри - пешие походы в Сочи и Красной Поляне','https://vk.com/v.debri',454),(73,'Сочиняй мечты','https://vk.com/public26926107',69),(74,'Военная форма Сухпайки ВКПО ИРП Тушенка ВКБО','https://vk.com/irp_123',152),(75,'Хостел \"МЫ\"','https://vk.com/public143773668',44),(76,'Тридцатка с астронаблюдениями!','https://vk.com/30zovgor',65),(77,'БИЗНЕС РЕСУРС | СИЛА ОКРУЖЕНИЯ','https://vk.com/biz_res_trip',13),(78,'Че дома сидеть - Походы Скалолазание в Сочи','https://vk.com/why.staying.home',67),(79,'Семь самураев / Samurai Seven','https://vk.com/club67245574',304),(80,'Горы Красота и Экстрим ! Альпинизм Горный Туризм Горные Лыжи Сноуборд Скалолазание MTB Ледолазание','https://vk.com/jomolungma',4015),(81,'Семейный лагерь в Абхазии 2021 (0+)','https://vk.com/event160970943',119),(82,'KOVALEV TRAVEL| Походы, активный отдых в Абхазии','https://vk.com/kovalev_travel',336),(83,'Отдых в Сочи в горах (Лазаревский район)','https://vk.com/prirodavsochi',13),(84,'UNP _ UNITE NEL PALLONE','https://vk.com/c.azzurro',44),(85,'БРУСНИКА | Трансляции','https://vk.com/brusnika_org',42),(86,'Пешие походы по самым красивым местам планеты','https://vk.com/life4travel2',897),(87,'Теннисный клуб \"Династия\" Сочи, Санкт-Петербург','https://vk.com/mvsochi_tennis_dynasty',46),(88,'Конный туризм. Конные походы и туры.','https://vk.com/turizm_adugey_russia',33),(89,'Прокат туристического снаряжения в Сочи','https://vk.com/prokat_v_sochi',111),(90,'EXtreme Life - Sochi.','https://vk.com/extremelifesochi',65),(91,'Концерты и мероприятия \"Дом Ом\" г. Сочи','https://vk.com/public177624160',56),(92,'КришНаиТ ПоД аЯваскОЙ','https://vk.com/club72125038',124),(93,'Sochi Casuals','https://vk.com/sochicasuals8',107),(94,'Экскурсия Сочи','https://vk.com/exkursiasochi',1975),(95,'Фотограф Инга Мыцело. Сочи, Абхазия.','https://vk.com/fotograf.inga.mytcelo',293),(96,'22 - 29 января | SOCHI RED CAMP 2021','https://vk.com/stredcamp',38),(97,'Dolphins group','https://vk.com/dolphins_group',21),(98,'Йога на природе в горах Кавказа/Сочи','https://vk.com/club_oma',15),(99,'Greens - натуральные продукты в Сочи.','https://vk.com/storegreens',385),(100,'Остеопатия, висцеральная терапия | Сочи','https://vk.com/stupeni_zdorovya',111),(101,'•Береговая №1• Отдых в Сочи•Мацеста','https://vk.com/beregovaya_1',36),(102,'Детский спортивный лагерь \"Camp_Chemp\"','https://vk.com/camp_chemp',86),(103,'\"ЛАГУНА\" Молодежный лагерь п. Лермонтово (Черное','https://vk.com/lagunamore',50),(104,'Больше, чем просто подарок','https://vk.com/emotionforyou',43),(105,'Working!! / Работа!!','https://vk.com/club48842643',479),(106,'<< Фурри Сочи >>','https://vk.com/fursochi',26),(107,'\"Астротур клуб Орион\". Астротуризм','https://vk.com/astrocrimea',76),(108,'Группа для тех, кто хочет детей от Аркадия Укупника!!!','https://vk.com/club985936',44),(109,'Официальная группа ДОЛ \"Экспресс\" п. Солоники','https://vk.com/club46860739',186),(110,'Пешеходные прогулки и походы в Сочи','https://vk.com/sochitour2017',358),(111,'Утренние тренировки. Массаж. Шугаринг','https://vk.com/healthysochi',19),(112,'Точка Старта | Сочи для детей и взрослых','https://vk.com/tochka_starta_izh',106),(113,'Йети Гид Бюро Красная Поляна','https://vk.com/yetiguide',283),(114,'Горный поход из Адыгеи к Черному морю «30-ка»','https://vk.com/club156775634',16),(115,'Фитнес и йога туры','https://vk.com/fitness_yoga_tours',842),(116,'ST | 12 - 18 февраля | SOCHI RED CAMP 2021','https://vk.com/stredcamp2021',31),(117,'Походно-творческие фестивали \"Погружение\"','https://vk.com/mezmay_may',318),(118,'Клуб путешествий \"Горная высота\"','https://vk.com/club_gornaya_vysota',25),(119,'Летай, ты не призван ползать','https://vk.com/letaytineprizvanpolzat',4974),(120,'Доски с гвоздями | Мастерская VSADHU-SILA','https://vk.com/sadhu.sundesk',716),(121,'ЗЕБРА ТВ г. Сочи','https://vk.com/studiazebratv',824),(122,'Клуб Приключений \"Маттерхорн\"','https://vk.com/matterhorn_club',1225),(123,'Р@НЕТКИ','https://vk.com/club11095997',31),(124,'МЕСТА СИЛЫ','https://vk.com/mesta___sily',869),(125,'Selfie VLG | Магазин путешествий','https://vk.com/selfietourvlg.shop',57),(126,'Легкость с телом и жизнью Access_Theta','https://vk.com/darzhizniiszelenie',203),(127,'Квест-Программа детского лагеря \"Пионеры СССР\"','https://vk.com/pioner_camp',314),(128,'Младшая Молодежь ( подростки Сочи )','https://vk.com/christian_youth_of_sochi',138),(129,'Ра Свет Сочи','https://vk.com/club173639592',90),(130,'Походы сочинцев в горы','https://vk.com/club177025756',60),(131,'AKVAREL DANCE SUMMER CAMP','https://vk.com/akvareldancecamp',151),(132,'Туристическая группа \"Пятый элемент\"','https://vk.com/pohod_zapadnyj_kavkaz',14),(133,'Инструктор Анастасия Пичугина турклуб ЗовГор','https://vk.com/anastasiazovgor',126),(134,'КаРаБиН','https://vk.com/karabin21',99),(135,'Аниме)','https://vk.com/club18999807',128),(136,'Горный ретрит «АНАНДА 2021»','https://vk.com/anandaretrit',154),(137,'Детская народная дипломатия','https://vk.com/public54663520',26),(138,'Группа: ВсеРоссийский хип-хоп лагерь.','https://vk.com/club5227130',24),(139,'Детский Туристический Клуб ПИЛИГРИМ','https://vk.com/piligrim_kzn',171),(140,'Походы фотопрогулки в Сочи','https://vk.com/tracksochi',90),(141,'Сочи Туристо - Эко-туризм в Сочи!','https://vk.com/sochituristo',96),(142,'Походы, тур, экскурсии в горы | СОЧИ','https://vk.com/poshlivgory_sochi',123),(143,'Экскурсии, походы, бродилки по Сочи и Абхазии с','https://vk.com/public162100535',36),(144,'Вписки Сочи','https://vk.com/club118440461',11),(145,'Активный отдых в Сочи','https://vk.com/club71361495',50),(146,'Школа безопасности г. Сочи (Красная поляна)','https://vk.com/bezopasnostvsochi',268),(147,'My Trekking - походы по горам Кавказа','https://vk.com/mytrekking',496),(148,'ПРОЕКТ \"СОЧИГОРЬЕ\"','https://vk.com/sochigorie',17),(149,'ScolioСочи','https://vk.com/scoliosochi',64),(150,'Ламзак, Биван. г Сочи, Краснодар','https://vk.com/club149627692',36),(151,'Едем на Камчатку! Из Сочи и не только','https://vk.com/public122718042',19),(152,'Аренда в Сочи Хостел \"Дача\"|Комнаты|Походы|Отдых','https://vk.com/hostel_dacha',167),(153,'Горностай.Фрирайд,Обучение, Красная поляна','https://vk.com/freegor',125),(154,'Походы по окрестностям Сочи и Абхазии','https://vk.com/sunnyhike',47),(155,'Поездка в Сочи с Like Центр 2-5 октября 2017','https://vk.com/likecentresochi',122),(156,'Отдых Сочи, Красная Поляна, Роза Хутор','https://vk.com/soshi_24',16),(157,'Астротуризм на Кавказе, Сочи, Архыз, Эльбрус','https://vk.com/astroturclub',66),(158,'Группа тех, кто хоть раз ездил с нами в путешествие или обязательно поедет...','https://vk.com/club4140119',39),(159,'Правильный Отдых | Путешествия по Сочи','https://vk.com/traveltosochi',33),(160,'BAON. Магазин брендовой одежды. г.Щербинка','https://vk.com/baon_boutique',187),(161,'Гид по Сочи | Достопримечательности Сочи','https://vk.com/guideposochi',16),(162,'экскурсионные туры','https://vk.com/lagervkrymy',279),(163,'Traveler | Экотуризм в Сочи','https://vk.com/travelersochi',142),(164,'Алтимат Фрисби | Сочи','https://vk.com/frisbeesochi',37),(165,'Центр Отдыха \"Сочи\"','https://vk.com/cosochi',68),(166,'За Чертой Цивилизации | Фотопоходы по Сочи','https://vk.com/zashertoi.sochi',14),(167,'Клуб Рыболовных Походов','https://vk.com/club184529090',15),(168,'Discovery Travel Sochi ПОХОДЫ В СОЧИ','https://vk.com/discoverytravelsochi',307),(169,'Йога туры по миру! Апрель Абхазия! Лето Сочи!','https://vk.com/travel_yoga_foryou',1069),(170,'Sochi Diggers and Stalkers','https://vk.com/sochi_diggers',66),(171,'Гид по Сочи','https://vk.com/clubguidetosochi',148),(172,'Треккинг в Сочи','https://vk.com/trekking.v.sochi',193),(173,'ЭКСКУРСИИ И ТУРЫ КРАСНОДАР','https://vk.com/don_tour_krd',185),(174,'Творческие походы |СОЧИ|','https://vk.com/pohod_v_sochi',83),(175,'Отель на Красной поляне рядом с Роза Хутор','https://vk.com/club91793305',81),(176,'Альпийский лыжный клуб в сочи','https://vk.com/club105550003',14),(177,'Прокат / аренда автомобилей / авто в Сочи','https://vk.com/axrent_sochi',64),(178,'Помощь детям сиротам Сочи','https://vk.com/pomoshsochi',36),(179,'Женсккий центр \" РАДА - МИРА\" Адлер - Сочи','https://vk.com/club86481169',17),(180,'ВДЦ. ОРЛЕНОК. Те кто когда либо отдыхал в всероссийском детском центре под названием ОРЛЕНОК','https://vk.com/club10288877',30),(181,'ПОСТЕЛЬНОЕ БЕЛЬЕ II PostelnoevDom.ru','https://vk.com/magazinpostelnogo',574),(182,'Велорюкзаки, палатки ПИК-99 в Самаре','https://vk.com/public87831256',24),(183,'Photographer Gregory Runthal','https://vk.com/public165436253',58),(184,'ПОХОДЫ НАЛЕГКЕ','https://vk.com/tours_in_sochi',341),(185,'Походы Сочи','https://vk.com/clubpoxodsochi',25),(186,'Школа отдыха в Сочи','https://vk.com/passionforadventure',1431),(187,'Маршрут-бюро ГОРНЫЕ ВЕРШИНЫ - Красная поляна','https://vk.com/gornievershini',32),(188,'СЕМЕЙНЫЕ ПУТЕШЕСТВИЯ Family Camp','https://vk.com/familycampav',85),(189,'Наращивание ногтей в Сочи (shellac, био-гель) ✔','https://vk.com/naraschivanie_nogtej_v_sochi',162),(190,'Школа инструкторов спортивного туризма','https://vk.com/schooltourismrf',34),(191,'ГРУЗИЯ. Активный отдых. Туры в Грузию.','https://vk.com/georgia_travel.club',394),(192,'АБХАЗИЯ. Активный отдых. Туры в Абхазию.','https://vk.com/abkhazia_travel.club',379),(193,'Как создать отношения за месяц?|Корневая Терапия','https://vk.com/golovnevsm55',69),(194,'Тропами горного Черноморья.','https://vk.com/club57268176',216),(195,'Группа \"ЛЮБИТЕЛЕЙ ПУТЕШЕСТВИЙ\"','https://vk.com/club29247242',48),(196,'Хотите хорошо отдохнуть летом?','https://vk.com/club3526609',20),(197,'Ручная работа; Ручная роспись; Художник','https://vk.com/club128377804',196),(198,'Автокомплекс \"Бумер\"','https://vk.com/boomer_ru',57),(199,'EASY SOCHI RIDERS CLUB','https://vk.com/easy_sochi',10),(200,'Megalithica — туры на дольмены','https://vk.com/dolmens',80),(201,'DIVA 2019 FUTURO','https://vk.com/club52841633',100),(202,'Фитнес Тур Сочи 2019','https://vk.com/club29595495',207),(203,'Походы в Сочи','https://vk.com/vottak_pohod',52),(204,'«г. Сочи пансионат Лучезарный, 4 отряд 1 смена 2012»','https://vk.com/luchezarnui2012',22),(205,'TRON-X | управление сознанием','https://vk.com/tronsistema_x',157),(206,'ToursSochiClub','https://vk.com/club147430683',126),(207,'Tops-Travel.Schi','https://vk.com/topstravel',42),(208,'салон \"Relaх - SPA \"','https://vk.com/public187457175',44),(209,'Походы на природу','https://vk.com/pravpohodsochi',30),(210,'Горбунов Ярослав','https://vk.com/yaroslav_gorbunov',174),(211,'ТАКТИЧЕСКИЕ ИГРЫ - 48','https://vk.com/club68559352',23),(212,'Selfie SPB | Магазин путешествий','https://vk.com/selfietourspb',34),(213,'Lost Paradise Travel Company ( турфирма )','https://vk.com/club31664586',28),(214,'ФАН КЛУБ Дмитрия Васильева (Mister 254)','https://vk.com/club68042387',176),(215,'Фитнес-тур на Ачишхо','https://vk.com/achishkho',10),(216,'#СочиШколаГид','https://vk.com/club125035013',11),(217,'DANCE CAMP OBC 2013 -1 смены с 3 июня-23 июль, 2','https://vk.com/dancecampobc2013',55),(218,'►►►►►►Аркадий Укупник►►►►►►►►►','https://vk.com/club10313308',17),(219,'Joke and go','https://vk.com/jokeandgo',56),(220,'Фестиваль Эдванс \"В благости\"','https://vk.com/club38357375',26),(221,'Дороже Золота','https://vk.com/dorozhe_zolota_rm',100),(222,'Hostel Green Wood','https://vk.com/hostelgreenwood',317),(223,'Фитнес тур в Сочи','https://vk.com/fittur_sochi_adler',19),(224,'Portobello Sochi Hotel','https://vk.com/public198319915',41),(225,'ЛЕЧЕБНЫЙ ТУР','https://vk.com/lechebni_tur',2039),(226,'In Movie Tour | походы | Сочи | Крым','https://vk.com/inmovietour',349),(227,'ТУРИЗМ и ПОХОДЫ В СОЧИ','https://vk.com/public58201989',111),(228,'Походы в Сочи и регионе','https://vk.com/maxdzyubak_trips',257),(229,'ЭКСКУРСИИ, ПОХОДЫ СОЧИ~КРАСНАЯ ПОЛЯНА~АБХАЗИЯ','https://vk.com/club165323545',57),(230,'Клуб друзей Елены Кипор','https://vk.com/elena.kipor',222),(231,'ТурИндустрия - туристические походы в Сочи','https://vk.com/turindustria',77),(232,'Доставка суши и пиццы по Сочи (Watashi)','https://vk.com/watashisochi',936),(233,'Laura Team Сочи 2014','https://vk.com/laurateam2014',91),(234,'\"Дороже Золота\"','https://vk.com/more.than.gold',339),(235,'\"В спорте все равны!\"','https://vk.com/club30865440',72),(236,'Гостевой дом \" г. Туапсе Весенняя 53\"','https://vk.com/club118655210',86),(237,'Кухни и Мангалы БАРИН СПб','https://vk.com/mangal_barin_spb',47),(238,'Экспедиция \"Экология общения - 2016\"','https://vk.com/club70151846',42),(239,'СОВМЕСТНЫЕ ПОКУПКИ Sochi','https://vk.com/showroomsochi',56),(240,'Отдых на черном море 2019 \"Магнолия\"','https://vk.com/magnolia2009',177),(241,'Номера в селе Кривенковское.','https://vk.com/nomera247',115),(242,'-=Пик Коммунизма=-','https://vk.com/club8629431',59),(243,'♞♥КСК Maltesers♥♞ ( ЗАКРЫТА! )','https://vk.com/kck_maltesers',110),(244,'ТУРЫ В СОЧИ','https://vk.com/turyvsochi',597),(245,'ТУРИЗМ ДОСААФ)))) БЕГОМ К НАМ))) XD','https://vk.com/club28770166',24),(246,'Трикотаж для всей семьи. Ручная работа.','https://vk.com/modniiposhiv',72),(247,'FeelHill - походы в Красной Поляне','https://vk.com/feelhill',173),(248,'Альпинатур Клуб [#туризм Сочи#пешие#походы]','https://vk.com/alpinatyr',26),(249,'Походы в горы????Турклуб \"Сарин\"','https://vk.com/pohody_kavkaz',18),(250,'Походы и Треккинг в Сочи\" Квакватур\"','https://vk.com/club162099025',81),(251,'Великая Отечественная война Вторая мировая война','https://vk.com/club34883238',19),(252,'Трансформация/ перезагрузка / походы / экскурсии','https://vk.com/bezstrahasochi',18),(253,'Дом Солнца. Походы по горам.','https://vk.com/public124741103',17),(254,'Походы','https://vk.com/orekhovka',11),(255,'Походы сезон 2015','https://vk.com/pohod_spasochi',21),(256,'Походы в Сочи тел. 89384500274','https://vk.com/club77612905',42),(257,'Походы в Сочи!','https://vk.com/club106818095',41),(258,'5642 - 2868 - 1545, 30 дней лета и два алкаша','https://vk.com/club72944625',21),(259,'кто любит ходить в походы!','https://vk.com/club15683190',13),(260,'Походы и мероприятия Сочи 2018','https://vk.com/pohodi_sochi',36),(261,'Путешествие по Сочи (Попутчик)','https://vk.com/club188204000',28),(262,'Клуб Семейного Туризма СОЧИ','https://vk.com/club16132507',20),(263,'Отдых в Сочи и Адлере, Абхазии, активный туриз','https://vk.com/public23740417',56),(264,'Активные родители города Сочи','https://vk.com/club118129166',26),(265,'Горные Хомячки','https://vk.com/club11209205',11),(266,'НЕтипичный Сочи','https://vk.com/club93156851',56),(267,'Супер Туризм в Сочи!','https://vk.com/turysochi__com',59),(268,'Туристский клуб \"К2ТУР\" в Адлере(Сочи)','https://vk.com/adlerclubk2',103),(269,'Автопоход по горной Абхазии','https://vk.com/avtopohodsochi',28),(270,'Пешком по шпалам','https://vk.com/club9307632',12),(271,'Любителей Феодосии','https://vk.com/club10879019',24),(272,'Выживальщики РФ','https://vk.com/club24632064',21),(273,'Фитнес - туры в Сочи','https://vk.com/fitness_dvizeniye',69),(274,'Шкафы Купе и Гардеробные в Сочи на заказ','https://vk.com/club17420939',362),(275,'Ретрит-центр Йогадом/Yogahouse Сочи','https://vk.com/yogahouse108',66),(276,'Фестиваль в Сочи \"Клинок Кавказа 2010\"','https://vk.com/club17917328',64),(277,'Реклама на видеостойках в г. Сочи','https://vk.com/reklamanastoikah',50),(278,'Семейный спортивный лагерь \"Откровение\" г.Сочи','https://vk.com/club27594137',76),(279,'Tensegrity | Персональный тренинг в Сочи','https://vk.com/tensegrity.sochi',91),(280,'Походники','https://vk.com/sochi_energy',112),(281,'Мечты сбудутся! Я сама себе Газпром!','https://vk.com/club36841708',21),(282,'Сочи- //Естественный отбор/ПОСЛЕДНИЙ ГЕРОЙ Ψ КВЕ','https://vk.com/club129254256',30),(283,'Поход, горы, активный отдых: \"ВЕТЕР ПЕРЕМЕН\"','https://vk.com/windofhiking',79),(284,'СОЧИНСКАЯ ШКОЛА ТУРИЗМА','https://vk.com/school_tur_sochi',198),(285,'\"Сладкая жизнь\" турфирма, туры, путевки, горящие туры, туры 2011, горячие туры, турагентство, поиск тура, тур агентство, горящие туры...\"Сладкая...','https://vk.com/club28362641',155),(286,'Творческий эко кемп \"Лес\"','https://vk.com/club119446203',21),(287,'Фитнес-туры в Сочи для всех: море и горы ждут!!!','https://vk.com/fitnesstourvsochi',152),(288,'Семейный туристcкий клуб \"Роза ветров\"','https://vk.com/club175235658',14),(289,'Туристы','https://vk.com/club17820184',12),(290,'Бегущая по волнам - Лоо','https://vk.com/club16391858',180),(291,'Туристский клуб молодых семей \"7Я\"','https://vk.com/club15045751',13),(292,'Йога,Фитнес и Релакс Туры в Красную Поляну','https://vk.com/club147651883',61),(293,'Отдых на море - частный сектор \"АнВаЛия\"','https://vk.com/club98151634',48),(294,'Совместный отдых','https://vk.com/club124875930',31),(295,'Отдых в Красной Поляне без посредников!','https://vk.com/kp_sochi',32),(296,'на лето к морю _СКИФ сборы + поход_ июль 2014','https://vk.com/club68058154',52),(297,'Green People Sochi','https://vk.com/gpt_123',11),(298,'Йога-выходные в Абхазии! Зима 2020','https://vk.com/club94524842',12),(299,'Food Seasons. Доставка продуктов с рецептами.','https://vk.com/foodseasons',203),(300,'Это сладкое слово - ЛЕТО!!! ♥','https://vk.com/club36064814',11),(301,'Гении или распиздяи? И то и другое! =Р','https://vk.com/club15121720',33),(302,'Phototrip Sochi | Фототуры, фотосессии в Сочи','https://vk.com/lets_go_for_a_walk_sochi',47),(303,'Экстрим фотограф Сочи','https://vk.com/club172222325',17),(304,'Лагерь Холодный','https://vk.com/club56735581',15),(305,'Ночная жизнь в Сочи','https://vk.com/club9087312',44),(306,'Натуралистика','https://vk.com/public189498619',22),(307,'Обучение ACCESS BARS, FACELIFT, BODY PROCESS *','https://vk.com/potoksv',1039),(308,'Активный лагерь для юных вайшнавов и родителей','https://vk.com/club180254532',87),(309,'Подари море детям!!!!!','https://vk.com/club68047041',10),(310,'Сочинский сервак по CS \"Сочи ZONE\" [16+] beta','https://vk.com/sochizone',28),(311,'Баффы | Банданы | Магазин','https://vk.com/babaff',1184),(312,'#Ромаходит','https://vk.com/romahodit_sochi',2479),(313,'Yoga Camp ПИЛОНиЯ Йога тур','https://vk.com/camp_yoga',808),(314,'Клуб здорового образа жизни \"Фабрика Звёзд\"','https://vk.com/public169076549',26),(315,'Flame Project vol.1 Sochi,Rosa Khutor','https://vk.com/club165826639',47),(316,'Самшитовая сказка Кавказа','https://vk.com/samshit_skazka',55),(317,'вЛесном','https://vk.com/vlesnom_adler',15),(318,'MakeRideLife','https://vk.com/makeridelife',35),(319,'Dress ©ode','https://vk.com/club37733217',31),(320,'☽ТРОПЫ ПИЛИГРИМОВ☾','https://vk.com/piligrim.world',31),(321,'Туристский Приключенческий Экстрим Квест','https://vk.com/club117123479',87),(322,'10 дней в Богатырской заставе','https://vk.com/childrenscampsochi',50),(323,'JennyFITstudio','https://vk.com/jennyfitstudio',89),(324,'PUNKS NOT DEAD','https://vk.com/club11722322',17),(325,'Поезд Победы. 3 отряд','https://vk.com/poezd_pobedi',18),(326,'SYNERGY BUSINESS CAMP | Лагерь для школьников','https://vk.com/sbcamp',96),(327,'-\"МАСТАБА\"-','https://vk.com/club16977289',151),(328,'Детская Народная Дипломатия','https://vk.com/childrens_public_diplomacy',47),(329,'\"Праздник&Отдых\"','https://vk.com/club21123690',69),(330,'Motion Sochi','https://vk.com/motionsochi',180),(331,'=команда КВН *lodo4ka* г.Курск=','https://vk.com/club2334800',99),(332,'Гостевой дом Aura Mira','https://vk.com/club91002906',144),(333,'SkiSchoolClub. Горнолыжная школа.','https://vk.com/skischoolclub',158),(334,'Тоня Оборина. Психолог. Авторские методики.','https://vk.com/tusochi',615),(335,'ПРЯМОЙ ПОСТАВЩИК ТК САДОВОД','https://vk.com/sadovod.odejda',85),(336,'ExtremeGuide-Sochi','https://vk.com/gidkavkaza',145),(337,'Китайский Чай Сочи || People Tea People','https://vk.com/sochi_people_tea_people',19),(338,'sporttravelsochi','https://vk.com/sporttravelsochi',125),(339,'Мастерская Радости','https://vk.com/club30646338',238),(340,'\"Аллегро\" - Пермь','https://vk.com/allegro_prm',450),(341,'АНГАР','https://vk.com/angarsochi',15),(342,'Кавказ 2009,2010,2011.','https://vk.com/club11407129',15),(343,'Клуб волонтёров МЦ \"Апостол \"','https://vk.com/volunteer_apostol',275),(344,'ПВХ лодки, катамараны под парусом для всех .','https://vk.com/club74724672',171),(345,'Бандана - бафф \"Winder\"','https://vk.com/bandana_winder',97),(346,'Группа 68 \"Горные хомяки\"','https://vk.com/club11164592',13),(347,'Кавказ 2010!!!!!!!!!!!!!!','https://vk.com/club18952144',20),(348,'Scott Adkins-Boyka the best fighter in the world','https://vk.com/club30346223',155),(349,'Поход 2015 Псебай-Красная поляна | 12-16 августа','https://vk.com/club98654653',16);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups.queries`
--

DROP TABLE IF EXISTS `groups.queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups.queries` (
  `id_group` int NOT NULL,
  `id_query` int NOT NULL,
  UNIQUE KEY `groups.queries_id_group_id_query_uindex` (`id_group`,`id_query`),
  KEY `groups.queries_queries_id_fk` (`id_query`),
  CONSTRAINT `groups.queries_groups_id_fk` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`),
  CONSTRAINT `groups.queries_queries_id_fk` FOREIGN KEY (`id_query`) REFERENCES `queries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups.queries`
--

LOCK TABLES `groups.queries` WRITE;
/*!40000 ALTER TABLE `groups.queries` DISABLE KEYS */;
INSERT INTO `groups.queries` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(209,1),(210,1),(211,1),(212,1),(213,1),(214,1),(215,1),(216,1),(217,1),(218,1),(219,1),(220,1),(221,1),(222,1),(223,1),(224,1),(225,1),(226,1),(227,1),(228,1),(229,1),(230,1),(231,1),(232,1),(233,1),(234,1),(235,1),(236,1),(237,1),(238,1),(239,1),(240,1),(241,1),(242,1),(243,1),(244,1),(245,1),(246,1),(247,1),(248,1),(249,1),(250,1),(251,1),(252,1),(253,1),(254,1),(255,1),(256,1),(257,1),(258,1),(259,1),(260,1),(261,1),(262,1),(263,1),(264,1),(265,1),(266,1),(267,1),(268,1),(269,1),(270,1),(271,1),(272,1),(273,1),(274,1),(275,1),(276,1),(277,1),(278,1),(279,1),(280,1),(281,1),(282,1),(283,1),(284,1),(285,1),(286,1),(287,1),(288,1),(289,1),(290,1),(291,1),(292,1),(293,1),(294,1),(295,1),(296,1),(297,1),(298,1),(299,1),(300,1),(301,1),(302,1),(303,1),(304,1),(305,1),(306,1),(307,1),(308,1),(309,1),(310,1),(311,1),(312,1),(313,1),(314,1),(315,1),(316,1),(317,1),(318,1),(319,1),(320,1),(321,1),(322,1),(323,1),(324,1),(325,1),(326,1),(327,1),(328,1),(329,1),(330,1),(331,1),(332,1),(333,1),(334,1),(335,1),(336,1),(337,1),(338,1),(339,1),(340,1),(341,1),(342,1),(343,1),(344,1),(345,1),(346,1),(347,1),(348,1),(349,1);
/*!40000 ALTER TABLE `groups.queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locations_id_uindex` (`id`),
  UNIQUE KEY `locations_title_uindex` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datecreate` datetime NOT NULL,
  `datepublic` datetime NOT NULL,
  `_datepublic` varchar(25) NOT NULL,
  `content` longtext NOT NULL,
  `id_group` int DEFAULT NULL,
  `type` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_id_uindex` (`id`),
  UNIQUE KEY `posts_name_uindex` (`name`),
  KEY `posts_groups_id_fk` (`id_group`),
  CONSTRAINT `posts_groups_id_fk` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `id_category` int NOT NULL,
  `geo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `queries_id_uindex` (`id`),
  UNIQUE KEY `queries_title_uindex` (`title`),
  KEY `queries_categories_id_fk` (`id_category`),
  CONSTRAINT `queries_categories_id_fk` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,'сочи походы',1,'сочи');
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffs` (
  `id` int NOT NULL,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hash` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role` tinyint NOT NULL DEFAULT '0',
  `delete` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` VALUES (1,'Владимир','9164401342','admin','21232f297a57a5a743894a0e4a801fc3',NULL,1,NULL);
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `words` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `counts` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `words_id_uindex` (`id`),
  UNIQUE KEY `words_title_uindex` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-07 22:50:13