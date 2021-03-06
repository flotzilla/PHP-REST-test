-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `test_job`;
CREATE DATABASE `test_job` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test_job`;

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `quota` bigint(100) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `company` (`id`, `name`, `quota`) VALUES
(1,	'MomCorp',	1000000000000000000),
(2,	'MmC',	1000000000000),
(4,	'BBC incorporated',	20000000000000),
(5,	'Planet Express',	9999999999999999999)
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `name` = VALUES(`name`), `quota` = VALUES(`quota`);

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `company_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `customer` (`id`, `name`, `email`, `company_id`) VALUES
(1,	'John Doe',	'jd@best-test-email.com',	2),
(2,	'John Smith',	'some@ss',	1),
(8,	'John Smith12',	'some@ss',	1),
(9,	'Test User',	'sonetest@email.com',	4),
(10,	'Philip J. Fry',	'pjf@planet-express.com',	5),
(12,	'John Doe2',	'jd@best-test-email.com',	2)
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `name` = VALUES(`name`), `email` = VALUES(`email`), `company_id` = VALUES(`company_id`);

DROP TABLE IF EXISTS `transfer`;
CREATE TABLE `transfer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) unsigned NOT NULL,
  `url` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `transfered_bytes` bigint(100) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `transfer` (`id`, `customer_id`, `url`, `date`, `transfered_bytes`) VALUES
(640,	1,	'http://weissnat.com/',	'2017-01-19 15:19:25',	10641217070084),
(641,	1,	'http://www.hessel.com/libero-dolor-corporis-amet-corrupti-dolorem-quia-ullam.html',	'2017-06-13 15:35:57',	9638618869773),
(642,	1,	'http://www.hahn.biz/quam-omnis-quasi-tempora-doloribus-maxime-ut',	'2017-03-15 18:10:29',	1948371036242),
(643,	1,	'https://www.barrows.com/repudiandae-qui-eum-dolorem-accusamus-nulla-ea',	'2017-06-10 15:12:15',	7346459176993),
(644,	1,	'http://towne.com/praesentium-sapiente-quod-ipsa-dicta.html',	'2017-07-04 16:39:25',	9850622059531),
(645,	1,	'http://bashirian.com/a-sit-nostrum-repudiandae-expedita-quos-excepturi',	'2017-05-27 12:47:31',	2138398284880),
(646,	1,	'http://heaney.com/sint-consequatur-laboriosam-ipsa-consequatur-inventore',	'2017-05-20 18:13:55',	9757839656972),
(647,	1,	'http://lind.com/dolores-porro-voluptas-laudantium-alias-amet-quo-eligendi',	'2017-06-01 07:53:39',	2905987681353),
(648,	1,	'https://www.runolfsson.com/omnis-aut-at-qui-sint-debitis-unde-sed',	'2017-04-02 12:35:45',	10518693852165),
(649,	1,	'http://www.larson.com/nostrum-non-ab-et',	'2017-04-29 23:06:22',	990447841371),
(650,	1,	'http://www.williamson.biz/fugiat-cum-autem-ea-placeat',	'2017-06-24 05:03:21',	7134875822115),
(651,	1,	'http://www.lynch.com/',	'2017-03-24 22:43:22',	3132050365511),
(652,	1,	'https://braun.info/culpa-consequatur-ipsam-repudiandae-officiis-impedit-eum.html',	'2017-06-07 22:21:28',	6988799319077),
(653,	1,	'http://mraz.com/ea-sunt-consectetur-est-nihil-adipisci.html',	'2017-03-16 09:03:57',	7321692984354),
(654,	1,	'http://www.gorczany.net/repudiandae-dolor-accusamus-sit-quo-recusandae-pariatur-et',	'2017-01-22 23:47:13',	9137533849617),
(655,	1,	'http://www.keeling.com/',	'2017-04-21 02:53:42',	9552394920973),
(656,	1,	'http://kertzmann.org/repellendus-voluptas-quos-sint-et-enim',	'2017-02-09 04:34:24',	2356825656398),
(657,	1,	'http://www.kohler.net/nam-aut-qui-occaecati-voluptate',	'2017-03-21 19:31:11',	3436734069829),
(658,	1,	'http://www.murray.com/officiis-harum-voluptatem-qui-odit-nostrum-dolorum-quis.html',	'2017-04-28 15:58:31',	7732577786910),
(659,	1,	'http://www.mills.com/recusandae-soluta-fugiat-facere.html',	'2017-02-06 18:34:05',	2592103731276),
(660,	1,	'http://www.rau.com/quisquam-distinctio-sed-rem-qui-velit-laborum-qui',	'2017-03-07 21:15:11',	1253775902808),
(661,	1,	'http://balistreri.com/',	'2017-03-09 23:31:02',	7142228352035),
(662,	1,	'http://anderson.com/nobis-dolor-saepe-qui',	'2017-06-27 13:38:00',	1480942182486),
(663,	1,	'http://www.collier.com/eum-beatae-explicabo-non-non-nostrum-neque',	'2017-06-29 16:56:23',	8794664263700),
(664,	1,	'https://www.schowalter.com/veritatis-consectetur-laudantium-reiciendis-qui-doloribus-consequatur-excepturi',	'2017-05-12 09:06:40',	3279741562950),
(665,	1,	'http://www.gleichner.com/quo-voluptatem-modi-alias-aperiam-enim.html',	'2017-01-30 02:21:04',	8428502937624),
(666,	1,	'http://funk.biz/',	'2017-03-01 12:39:37',	9154637716497),
(667,	1,	'http://daugherty.com/quia-similique-consequatur-facilis-dolor',	'2017-04-27 20:11:23',	3719978859586),
(668,	1,	'http://www.gerhold.com/veritatis-quam-provident-non-optio-impedit-aut-odio-architecto.html',	'2017-07-01 02:17:17',	9329520296975),
(669,	1,	'http://www.abshire.com/harum-et-alias-illo-asperiores-facilis-a-natus',	'2017-05-01 18:17:53',	9241170314256),
(670,	1,	'https://tromp.com/error-illum-nihil-ea-et-repudiandae-labore.html',	'2017-02-24 17:08:08',	8459189386263),
(671,	1,	'http://www.williamson.biz/',	'2017-06-13 14:36:36',	8975621089299),
(672,	1,	'http://mueller.com/officia-sunt-quasi-adipisci-suscipit-quos',	'2017-03-12 23:43:15',	7884672906269),
(673,	1,	'http://www.mccullough.com/et-nam-non-cumque-nihil-qui-unde',	'2017-02-18 03:06:32',	10407560422406),
(674,	1,	'https://volkman.com/quis-ad-saepe-iste-est.html',	'2017-05-28 22:58:15',	5326963988532),
(675,	1,	'http://beier.net/saepe-enim-doloribus-laborum-sed-necessitatibus-blanditiis-autem',	'2017-06-20 08:24:25',	6740178688039),
(676,	1,	'https://www.schamberger.com/magni-suscipit-esse-delectus-exercitationem',	'2017-03-31 20:34:31',	1550842434646),
(677,	1,	'http://www.howell.com/est-eum-id-quia-impedit',	'2017-06-28 12:43:41',	4089687372863),
(678,	1,	'https://collins.biz/perferendis-tenetur-consectetur-est-aperiam-nulla.html',	'2017-06-24 07:38:06',	9646166369293),
(679,	1,	'http://www.dickens.com/sit-neque-delectus-rerum-nobis.html',	'2017-06-30 11:49:00',	1074420009050),
(680,	2,	'http://parisian.net/minus-odio-deserunt-omnis-nisi',	'2017-07-06 13:16:49',	5785925913647),
(681,	2,	'http://www.damore.org/impedit-distinctio-illo-commodi-fugit-rerum-tenetur',	'2017-01-23 07:29:24',	4206470374462),
(682,	2,	'http://www.bradtke.biz/eum-similique-reiciendis-molestiae-officiis-dicta',	'2017-07-06 12:23:59',	1073818255450),
(683,	2,	'http://stokes.info/quam-sunt-beatae-sit.html',	'2017-02-20 20:23:10',	2112502625360),
(684,	2,	'http://johns.com/sit-distinctio-ipsa-rerum-harum-quidem-odit',	'2017-02-27 20:26:42',	2348887946318),
(685,	2,	'https://ortiz.com/sint-mollitia-reiciendis-dolores-doloribus.html',	'2017-02-03 12:22:18',	10626213176324),
(686,	2,	'http://simonis.com/minima-reiciendis-minima-eum-quae-in',	'2017-03-31 15:22:48',	4469328281659),
(687,	2,	'https://champlin.net/qui-consequatur-dolorum-qui-aut-ut.html',	'2017-06-01 21:39:28',	5785622021167),
(688,	2,	'http://gutmann.com/est-sed-excepturi-et-ut-ea-sit-aut-voluptatem',	'2017-03-15 10:39:38',	7363674690593),
(689,	2,	'http://www.buckridge.com/',	'2017-07-12 02:23:55',	7061432012836),
(690,	2,	'http://www.klein.info/voluptate-voluptatem-optio-earum-et-aut',	'2017-03-25 06:23:33',	7039397923876),
(691,	2,	'http://www.armstrong.biz/iusto-ea-sequi-tempore-soluta-repudiandae-aut-dolore.html',	'2017-05-13 09:45:26',	3510786764868),
(692,	2,	'https://www.anderson.com/nostrum-voluptates-recusandae-eos-soluta-eos-autem',	'2017-02-18 06:07:59',	8542374200343),
(693,	2,	'http://ullrich.biz/quo-quia-ad-explicabo-vel-quaerat.html',	'2017-05-08 23:28:18',	4838945909816),
(694,	2,	'http://mckenzie.com/',	'2017-03-23 07:31:30',	6790528327718),
(695,	2,	'http://www.murray.org/',	'2017-06-30 13:29:35',	5975760860206),
(696,	2,	'http://www.borer.biz/',	'2017-05-05 20:36:14',	2998467348553),
(697,	2,	'http://kunze.com/voluptas-et-temporibus-ut-eius-consequuntur.html',	'2017-03-26 07:32:55',	10510507187205),
(698,	2,	'http://www.nienow.com/explicabo-iusto-vitae-similique-aut-rerum-culpa-odio',	'2017-03-03 08:16:30',	4310164884541),
(699,	2,	'http://gerlach.com/aut-sed-eum-sit-voluptatem.html',	'2017-06-26 03:09:16',	1244521385048),
(700,	2,	'http://mckenzie.com/sunt-facere-asperiores-atque-pariatur-qui-qui',	'2017-05-30 00:31:56',	7974580295708),
(701,	2,	'http://www.ebert.com/doloremque-reiciendis-nisi-et-est',	'2017-06-03 17:42:42',	2290669696079),
(702,	2,	'http://www.wisozk.com/delectus-ex-voluptas-corporis-voluptatem-hic',	'2017-03-18 07:47:53',	9129194296337),
(703,	2,	'http://torp.com/et-quas-sint-iste.html',	'2017-04-27 17:08:19',	7387024440353),
(704,	2,	'https://koelpin.net/facere-placeat-quaerat-numquam-porro-distinctio-voluptatem-repellendus.html',	'2017-01-24 23:09:18',	7617633689631),
(705,	2,	'http://harvey.info/dolore-voluptate-sint-sit-qui-eligendi-sapiente.html',	'2017-04-30 10:03:15',	4874256706616),
(706,	2,	'http://gleichner.com/pariatur-amet-exercitationem-sunt-autem-laboriosam-sapiente.html',	'2017-07-02 10:25:24',	8937866874899),
(707,	2,	'http://www.fahey.org/et-ipsa-omnis-ut-odit-omnis-iste-quae',	'2017-05-28 09:41:53',	712204784733),
(708,	2,	'http://hansen.info/consequuntur-ea-consequuntur-vero-illo',	'2017-05-21 13:10:39',	3525306803268),
(709,	2,	'http://www.kessler.com/maxime-quo-impedit-possimus-nam',	'2017-02-24 21:34:48',	10012286883849),
(710,	2,	'http://hagenes.com/non-excepturi-laboriosam-consequatur-vero',	'2017-02-13 09:16:42',	5792339998767),
(711,	2,	'http://www.heidenreich.com/repellendus-dicta-alias-temporibus-impedit-ut',	'2017-02-03 01:34:51',	9311232716816),
(712,	2,	'http://www.becker.com/',	'2017-03-21 12:14:06',	3223640980550),
(713,	2,	'http://www.greenfelder.com/ullam-culpa-veritatis-rerum-molestiae',	'2017-02-16 23:14:03',	6866158254118),
(714,	2,	'http://www.goldner.net/vel-assumenda-consectetur-et-doloremque-nihil',	'2017-04-30 08:42:27',	428619064416),
(715,	2,	'https://bode.biz/molestiae-id-numquam-voluptatem.html',	'2017-03-22 11:34:34',	5572528931889),
(716,	2,	'http://www.bergnaum.org/enim-consequatur-reiciendis-nemo',	'2017-03-16 20:52:48',	6497255157801),
(717,	2,	'http://schinner.com/',	'2017-04-10 23:03:06',	4897947345975),
(718,	2,	'http://www.mayer.com/',	'2017-06-16 15:48:57',	363034675296),
(719,	2,	'https://ward.com/voluptates-facilis-quisquam-inventore-asperiores-voluptatem.html',	'2017-04-15 07:30:17',	2865813570634),
(720,	2,	'http://mills.info/qui-deleniti-voluptas-qui-aut-corporis',	'2017-04-23 12:52:31',	964263086171),
(721,	2,	'http://grimes.com/sapiente-dolor-enim-sint-enim',	'2017-04-26 12:01:19',	7402432599073),
(722,	2,	'http://oberbrunner.org/',	'2017-03-21 04:31:50',	6376600335402),
(723,	8,	'http://www.quitzon.com/voluptates-commodi-porro-nihil-et-nostrum-libero',	'2017-07-08 14:05:27',	1246262231128),
(724,	8,	'http://www.mccullough.biz/ea-sed-culpa-officiis-autem-earum-est-rerum.html',	'2017-06-22 09:55:29',	2172012385360),
(725,	8,	'http://www.towne.biz/sunt-blanditiis-commodi-numquam-vel-numquam.html',	'2017-03-28 20:46:05',	4487281868859),
(726,	8,	'https://haag.com/blanditiis-itaque-delectus-natus-voluptatem-perspiciatis-sit.html',	'2017-03-14 10:37:50',	4244729579581),
(727,	8,	'http://stoltenberg.com/fugit-voluptatem-voluptas-quo-ea-non-quibusdam',	'2017-06-28 19:07:13',	1687403294804),
(728,	8,	'https://jast.biz/ipsam-asperiores-veritatis-in-excepturi-quis.html',	'2017-05-11 21:19:08',	8797446753300),
(729,	8,	'http://farrell.net/deserunt-reiciendis-ipsam-eaque-dolores-sint-officiis-magnam',	'2017-06-19 10:55:07',	5489250969650),
(730,	8,	'http://johnston.net/beatae-voluptatem-error-voluptates-excepturi',	'2017-03-15 22:25:00',	9661983590413),
(731,	8,	'http://schowalter.com/',	'2017-04-03 09:16:41',	93000176739),
(732,	8,	'http://prohaska.com/eos-enim-mollitia-perspiciatis-animi',	'2017-01-21 18:47:54',	3623328988227),
(733,	8,	'https://sawayn.biz/blanditiis-accusamus-numquam-labore-hic-velit-dicta-qui.html',	'2017-01-21 13:12:39',	6053891753005),
(734,	8,	'http://king.biz/delectus-aut-iusto-et-occaecati-ipsa-perferendis-quaerat',	'2017-02-26 08:30:51',	7710633866270),
(735,	8,	'http://marks.com/omnis-quam-maiores-ut-ullam-fugiat-quisquam.html',	'2017-06-22 00:03:27',	8497585694743),
(736,	8,	'http://heller.com/ipsa-rerum-minima-blanditiis-libero-maxime',	'2017-04-18 04:38:05',	3996642355264),
(737,	8,	'https://parisian.com/maiores-nemo-iure-doloribus-saepe-inventore-ex.html',	'2017-03-10 13:07:48',	8422838650904),
(738,	8,	'http://stokes.org/incidunt-qui-et-non-optio-et-voluptatum-qui',	'2017-04-08 05:27:34',	1027776220250),
(739,	8,	'http://www.dickens.biz/voluptas-vel-quaerat-fugiat-et-est-atque-rem',	'2017-06-23 07:39:04',	3013812961352),
(740,	8,	'http://www.aufderhar.com/',	'2017-03-21 05:09:36',	3220062371911),
(741,	8,	'http://morar.net/rerum-repellendus-rerum-vitae-a-atque.html',	'2017-06-04 14:05:59',	10339008942086),
(742,	8,	'http://hills.net/modi-aspernatur-aperiam-minus-totam-ut-quo-quisquam.html',	'2017-02-20 04:25:18',	6237453946923),
(743,	8,	'http://kunde.com/officiis-officia-qui-fugit-corporis-et-id-ea-dolorem',	'2017-06-17 13:25:50',	10086220625929),
(744,	8,	'http://halvorson.org/',	'2017-03-20 15:39:58',	10767628006403),
(745,	8,	'http://www.casper.biz/',	'2017-02-17 14:47:46',	814866601052),
(746,	8,	'http://www.heidenreich.org/est-ab-commodi-minus-culpa-aliquid-praesentium-voluptatum',	'2017-07-10 23:33:16',	5588359505969),
(747,	8,	'http://goodwin.biz/',	'2017-03-06 03:35:59',	4670459079737),
(748,	8,	'http://kuhn.com/iure-animi-molestiae-et-omnis-expedita.html',	'2017-07-05 06:09:31',	1177901276249),
(749,	8,	'https://thompson.net/autem-perferendis-rerum-veniam-sed.html',	'2017-03-04 01:47:18',	8454173076503),
(750,	8,	'http://langosh.biz/',	'2017-03-20 03:49:38',	5634722165809),
(751,	8,	'https://www.wilkinson.com/deserunt-consequatur-quis-occaecati-incidunt-rerum',	'2017-03-29 22:11:33',	8580333875222),
(752,	8,	'http://www.dickens.com/',	'2017-07-13 16:40:54',	3835657134145),
(753,	8,	'http://www.parker.com/',	'2017-02-23 16:14:21',	4146243174462),
(754,	8,	'http://www.schaden.com/',	'2017-03-06 02:23:37',	9826596106251),
(755,	8,	'http://bauch.info/',	'2017-06-14 23:29:14',	6007669519405),
(756,	8,	'http://www.wisoky.com/officiis-et-saepe-ut-illum',	'2017-06-22 03:04:31',	8633525043222),
(757,	8,	'http://steuber.com/excepturi-nemo-ut-ut-blanditiis-tempore',	'2017-04-08 20:39:06',	3076209408072),
(758,	8,	'http://www.harvey.biz/',	'2017-03-17 09:33:31',	7695072814110),
(759,	8,	'http://www.keeling.com/ipsa-quaerat-nisi-esse-laboriosam-est-non-sed-eum',	'2017-01-18 23:11:16',	6435855523882),
(760,	8,	'http://damore.biz/distinctio-eaque-est-et-sunt.html',	'2017-04-06 03:07:40',	8565460377622),
(761,	8,	'http://www.bergstrom.com/expedita-quasi-non-voluptatibus-sapiente-alias-eos',	'2017-03-22 04:17:16',	6361940126762),
(762,	8,	'http://www.prohaska.com/ea-aut-quo-quod-eum',	'2017-02-07 07:06:42',	6528855700521),
(763,	8,	'https://www.powlowski.com/repellendus-assumenda-vel-nesciunt-ut-sequi-nulla-beatae',	'2017-07-15 22:04:35',	1193673088089),
(764,	8,	'http://www.gislason.com/impedit-est-voluptas-eos-soluta-rerum',	'2017-02-22 07:53:42',	1420715607127),
(765,	8,	'http://www.lehner.com/aut-est-sequi-praesentium-consequatur-quisquam-dolor',	'2017-07-06 01:16:06',	3244373289030),
(766,	8,	'http://www.watsica.biz/',	'2017-06-18 01:05:11',	9691258787852),
(767,	8,	'http://www.stark.com/',	'2017-06-02 06:45:39',	5417357962291),
(768,	8,	'http://dickinson.com/vitae-eos-laborum-non-qui-tempore-accusantium-et-magnam',	'2017-02-24 02:01:27',	672095662173),
(769,	8,	'http://www.roberts.info/non-iure-laboriosam-libero-totam-assumenda',	'2017-02-15 03:01:52',	10719035008003),
(770,	8,	'http://hickle.biz/et-beatae-ipsa-qui-vitae-itaque-ratione',	'2017-03-16 07:57:40',	8431170923544),
(771,	8,	'http://www.schuster.com/',	'2017-04-10 07:02:39',	3892158033984),
(772,	8,	'http://welch.com/dolore-sequi-aut-id-quia.html',	'2017-05-20 15:49:51',	10062927672329),
(773,	8,	'http://gottlieb.net/reprehenderit-repellat-soluta-voluptatibus-qui-aperiam-rerum-iste-et',	'2017-04-17 17:22:56',	3673508592706),
(774,	8,	'http://grant.org/suscipit-est-quos-expedita-ipsa-voluptatem-aliquid-ipsa-maiores',	'2017-01-27 19:36:31',	2983262382153),
(775,	8,	'https://runolfsdottir.com/ipsam-autem-doloremque-rerum-aut-et-non.html',	'2017-05-14 21:43:10',	9835439406091),
(776,	8,	'http://oberbrunner.com/',	'2017-07-01 22:09:35',	4488375193659),
(777,	8,	'https://frami.com/tempore-eius-odio-doloribus-quaerat-debitis-illum.html',	'2017-04-24 19:54:14',	8571621893142),
(778,	8,	'http://mitchell.com/facere-impedit-quo-esse-omnis-voluptatem-delectus-inventore-explicabo.html',	'2017-03-03 02:14:16',	3510782208068),
(779,	8,	'http://reichert.org/pariatur-ratione-veniam-nisi-dolorem-maxime-eius.html',	'2017-02-25 17:53:58',	5666276469808),
(780,	8,	'http://www.reynolds.org/amet-est-amet-veniam-tempore-adipisci',	'2017-05-30 23:42:50',	6030678691885),
(781,	8,	'http://www.corkery.com/neque-officia-omnis-ullam-sed-cumque-omnis',	'2017-06-16 20:51:11',	9145504373777),
(782,	8,	'http://funk.com/id-nisi-perspiciatis-temporibus-sunt-ullam-eius',	'2017-05-09 15:45:11',	3251494067270),
(783,	8,	'https://lesch.com/error-ut-minus-officiis-optio-enim-quae-id.html',	'2017-04-17 10:32:37',	9866335831051),
(784,	8,	'https://kozey.com/deserunt-corporis-repellat-ex-quos-a-voluptates.html',	'2017-06-28 13:38:00',	2296631270479),
(785,	8,	'http://www.blanda.org/',	'2017-01-24 08:38:40',	2082973895761),
(786,	8,	'https://www.denesik.com/aut-est-deserunt-libero-porro-accusamus-quae-occaecati',	'2017-05-25 03:53:57',	4878889072696),
(787,	8,	'http://boehm.biz/voluptates-aspernatur-eius-ex-minus-vel-vel-eos-quis',	'2017-04-30 19:26:54',	10930156313601),
(788,	8,	'http://yost.com/atque-rerum-fugit-ea-autem-nam-molestiae-rerum',	'2017-06-16 08:11:11',	5159183308853),
(789,	8,	'https://wisoky.com/beatae-sint-fuga-laborum-modi-illum.html',	'2017-07-12 10:02:19',	1578845614165),
(790,	8,	'http://www.durgan.com/ut-rerum-quibusdam-et-sunt-non-maiores-in.html',	'2017-05-23 06:41:20',	6370895559722),
(791,	8,	'http://bashirian.biz/expedita-sed-molestiae-suscipit-dignissimos',	'2017-06-03 21:24:47',	2729527408715),
(792,	8,	'http://www.oreilly.com/blanditiis-aut-eius-qui-non-in-dolor-eos',	'2017-03-22 15:39:14',	7940785740828),
(793,	8,	'https://www.schmidt.biz/est-temporibus-eligendi-nihil',	'2017-02-18 21:33:36',	1904634982482),
(794,	8,	'http://mitchell.biz/',	'2017-05-30 14:10:35',	3923200501824),
(795,	8,	'http://www.kovacek.com/explicabo-repellat-doloremque-nostrum.html',	'2017-02-08 01:17:09',	9361501347855),
(796,	9,	'http://gorczany.org/ut-dignissimos-fugit-voluptas.html',	'2017-03-26 02:09:48',	2619343011916),
(797,	9,	'http://www.kuphal.com/perspiciatis-facilis-est-error-voluptatem.html',	'2017-03-14 08:44:15',	3783743032385),
(798,	9,	'http://collins.org/est-sit-ipsum-non-impedit',	'2017-02-19 16:12:50',	5821103933487),
(799,	9,	'http://www.glover.com/sed-temporibus-distinctio-quibusdam-laudantium-officia-ea-harum',	'2017-05-16 14:17:06',	2343261742158),
(800,	9,	'http://schultz.com/voluptatem-corporis-quis-culpa-enim-sit-voluptas-ipsa-ut',	'2017-01-29 17:50:51',	1219797683289),
(801,	9,	'http://becker.com/necessitatibus-saepe-impedit-ipsum-voluptas-mollitia-aut',	'2017-03-29 14:43:19',	9713261967372),
(802,	9,	'http://stokes.com/perspiciatis-aliquid-tempore-quos',	'2017-04-02 21:40:40',	1411073141847),
(803,	9,	'http://www.harris.com/omnis-commodi-qui-saepe.html',	'2017-02-13 02:27:16',	4893306275895),
(804,	9,	'https://aufderhar.com/autem-harum-dicta-aut-quia-molestiae-dolore-perferendis.html',	'2017-03-04 13:17:41',	1701408076884),
(805,	9,	'http://renner.org/et-doloremque-cumque-ut-perferendis',	'2017-02-05 03:42:26',	251396270177),
(806,	9,	'http://glover.biz/',	'2017-02-09 13:25:48',	9381681474575),
(807,	9,	'http://hirthe.net/sed-a-doloremque-placeat-voluptatibus-non-ipsa-non.html',	'2017-03-23 07:08:46',	10273029969927),
(808,	9,	'http://www.schaefer.info/autem-accusantium-temporibus-vitae-nisi-saepe-suscipit-in',	'2017-01-29 20:04:30',	3762178478146),
(809,	9,	'http://www.goyette.com/minus-in-aut-cumque-voluptatem-expedita-fugiat-autem.html',	'2017-06-18 07:30:14',	4052841666623),
(810,	9,	'http://www.pfannerstill.com/',	'2017-06-01 06:39:33',	5308592384052),
(811,	9,	'http://kassulke.biz/',	'2017-05-08 02:55:57',	1912566574162),
(812,	9,	'https://williamson.com/et-qui-eum-corporis-aut-itaque-repudiandae-adipisci-quia.html',	'2017-03-02 21:03:52',	7304335738914),
(813,	9,	'http://www.spencer.net/laborum-beatae-non-similique-accusantium-quia-odit',	'2017-04-04 04:29:33',	4179811937342),
(814,	9,	'https://www.klocko.biz/repudiandae-laboriosam-aut-laudantium-esse-suscipit-commodi',	'2017-02-17 20:51:43',	4209197844542),
(815,	9,	'http://www.ratke.com/ea-accusantium-sed-quos-alias-nesciunt-voluptatem-quasi.html',	'2017-06-27 17:51:53',	9387309634575),
(816,	9,	'http://shields.com/',	'2017-01-20 17:18:23',	9058701015058),
(817,	9,	'http://www.schumm.com/iusto-iusto-velit-facere-reprehenderit-consectetur-aut.html',	'2017-04-12 04:02:52',	4144237880382),
(818,	9,	'http://www.moen.biz/aut-et-non-illum-harum-consequatur-eligendi.html',	'2017-01-20 05:35:40',	3551376665668),
(819,	9,	'http://johnson.org/est-veritatis-autem-vero-placeat-ea',	'2017-03-17 01:00:59',	10637546629124),
(820,	9,	'http://beer.com/',	'2017-06-19 08:17:57',	10515133445125),
(821,	9,	'http://www.rau.com/',	'2017-03-05 03:16:16',	6280904079403),
(822,	9,	'http://www.zemlak.com/maiores-aut-quae-aliquid-velit-at-ipsam.html',	'2017-02-10 09:36:40',	7583216092191),
(823,	9,	'http://www.bailey.info/',	'2017-05-30 17:56:29',	1424652149847),
(824,	9,	'http://botsford.com/',	'2017-05-25 18:35:23',	10204104581128),
(825,	9,	'http://www.hills.biz/quia-quas-voluptas-consequatur-distinctio-dolorem',	'2017-02-13 22:04:25',	5949601167406),
(826,	9,	'http://keebler.com/natus-ut-nam-qui-aut-inventore-aut',	'2017-02-07 13:28:16',	6573660426280),
(827,	9,	'http://sipes.net/quam-voluptatibus-et-facilis-aut-accusamus-id-eaque',	'2017-05-13 17:25:47',	1828331315283),
(828,	9,	'https://www.zemlak.com/itaque-mollitia-nesciunt-ea-ea-reiciendis-voluptatem-deserunt',	'2017-02-06 04:03:21',	9733344199692),
(829,	9,	'http://feil.org/similique-architecto-corrupti-quasi-autem.html',	'2017-05-06 01:40:29',	1399648082007),
(830,	9,	'https://hand.com/non-mollitia-sapiente-deleniti-in-quibusdam.html',	'2017-05-11 22:40:21',	4171593057342),
(831,	9,	'http://www.hand.com/adipisci-sit-officia-accusamus-nisi-odio-corrupti-magnam',	'2017-04-15 00:03:25',	10953141882881),
(832,	9,	'http://hoeger.com/sequi-quibusdam-quisquam-eum',	'2017-03-16 20:44:42',	117793776738),
(833,	9,	'https://www.mante.org/nobis-cum-quo-fuga',	'2017-05-21 07:22:13',	5582666199089),
(834,	9,	'https://bayer.com/ullam-deserunt-assumenda-voluptatem-debitis-omnis.html',	'2017-07-03 17:43:52',	4851331886136),
(835,	9,	'http://oconnell.com/et-labore-ea-ea-quia-doloremque',	'2017-03-16 13:24:36',	1819201853523),
(836,	9,	'http://www.doyle.com/magnam-animi-saepe-esse-maiores-minima',	'2017-02-10 16:01:16',	5834062469167),
(837,	9,	'http://bernhard.com/doloribus-voluptas-ea-veniam-illo-praesentium-dolore-facilis.html',	'2017-03-05 06:12:39',	3237897082950),
(838,	9,	'http://www.barrows.com/ullam-rerum-repudiandae-totam-deleniti-cumque-recusandae.html',	'2017-02-18 17:02:23',	1097115545690),
(839,	10,	'http://conroy.biz/sapiente-et-aut-ullam.html',	'2017-05-20 18:06:43',	7290738749474),
(840,	10,	'http://www.kozey.com/sed-ipsam-quae-dignissimos-ex',	'2017-06-06 13:25:10',	6405707929642),
(841,	10,	'https://rolfson.com/sed-fugit-tenetur-expedita-id-vel-et-qui.html',	'2017-03-19 05:33:59',	513691243615),
(842,	10,	'http://walsh.com/dolores-sit-est-nemo-cum-excepturi-architecto-enim.html',	'2017-05-08 13:23:14',	3599958210627),
(843,	10,	'http://leuschke.com/',	'2017-06-28 07:59:56',	10585519872004),
(844,	10,	'https://www.metz.com/qui-harum-libero-non-omnis',	'2017-05-23 21:58:45',	4722889088057),
(845,	10,	'http://koepp.com/',	'2017-04-18 18:16:37',	1992151572562),
(846,	10,	'https://kemmer.com/maiores-nulla-ducimus-harum-vero-mollitia-omnis.html',	'2017-01-25 15:22:26',	8649104609302),
(847,	10,	'http://www.wolf.com/sunt-ut-qui-asperiores-omnis',	'2017-03-04 09:55:30',	8867126973460),
(848,	10,	'http://www.mayert.com/doloremque-praesentium-perferendis-odio-nisi-distinctio-aut',	'2017-02-12 23:41:57',	5543528238130),
(849,	10,	'http://www.funk.com/eum-incidunt-repudiandae-necessitatibus-voluptatem-perferendis-nulla.html',	'2017-04-14 02:59:59',	8291534960665),
(850,	10,	'http://www.haag.com/et-earum-quia-ab-est-molestias-minus.html',	'2017-06-26 03:47:56',	8387144140824),
(851,	10,	'http://wilderman.org/',	'2017-05-09 12:00:19',	829316039772),
(852,	10,	'http://www.langosh.biz/rerum-dolorem-ipsam-omnis-rerum',	'2017-05-14 09:39:51',	4879634775096),
(853,	10,	'http://wilkinson.org/placeat-in-quaerat-est-ut-assumenda',	'2017-03-12 00:21:28',	9811796290571),
(854,	10,	'http://www.barrows.com/qui-facilis-impedit-amet-debitis-sit-ea',	'2017-04-27 23:31:38',	38304343139),
(855,	10,	'http://waters.com/temporibus-aspernatur-aut-quisquam-sapiente-nemo-minima.html',	'2017-06-06 13:32:10',	10829235942402),
(856,	10,	'http://jacobi.org/delectus-dicta-corporis-officiis-reprehenderit-et',	'2017-02-19 22:23:35',	5390340439091),
(857,	10,	'http://osinski.com/quis-laborum-sequi-dolores-culpa-fugit-eveniet',	'2017-03-24 04:39:46',	1866635658323),
(858,	10,	'https://raynor.com/in-aspernatur-officiis-eligendi-sed-est-id.html',	'2017-05-20 15:48:43',	9567463869453),
(859,	10,	'http://www.hammes.com/et-esse-quae-unde-quae-et.html',	'2017-06-01 18:17:06',	6789988526118),
(860,	10,	'https://douglas.net/autem-praesentium-aut-non-non-neque-sed.html',	'2017-06-23 23:58:45',	6038228720685),
(861,	10,	'http://johns.com/doloremque-qui-voluptas-esse-quaerat-dolor-mollitia-impedit.html',	'2017-01-26 12:57:45',	9525489474574),
(862,	10,	'https://www.kub.info/incidunt-laudantium-a-in-explicabo-eveniet-eos-perspiciatis',	'2017-02-23 05:26:51',	6907782302757),
(863,	10,	'http://ohara.org/est-alias-animi-aut-modi',	'2017-07-06 05:19:26',	625778642014),
(864,	10,	'http://www.romaguera.net/cupiditate-asperiores-expedita-reprehenderit-suscipit-quae.html',	'2017-06-11 13:40:41',	3381705082949),
(865,	10,	'http://www.jacobs.com/',	'2017-03-28 04:52:28',	8726984156181),
(866,	10,	'http://ondricka.biz/aliquam-officiis-et-sequi-omnis',	'2017-02-19 11:55:57',	6459841116201),
(867,	10,	'https://prohaska.com/repellendus-eum-et-nemo-reprehenderit-et-rerum-officia-quo.html',	'2017-05-27 05:47:05',	6619602165800),
(868,	10,	'http://www.fisher.info/ipsum-aperiam-ullam-voluptatum-id-magnam',	'2017-03-11 14:49:10',	9824099701771),
(869,	10,	'http://www.mueller.com/',	'2017-07-02 05:40:19',	5060965785654),
(870,	10,	'http://koelpin.com/qui-aut-est-eum-architecto-eos',	'2017-01-19 21:22:33',	2915224642633),
(871,	10,	'http://www.franecki.com/',	'2017-03-03 11:08:00',	5234691353652),
(872,	10,	'https://www.turner.net/eveniet-velit-non-magnam-sunt-dolores',	'2017-02-25 18:05:05',	5574657034289),
(873,	10,	'http://www.kling.org/quam-impedit-dignissimos-nihil-necessitatibus.html',	'2017-03-07 06:05:05',	6515182853161),
(874,	10,	'https://www.cartwright.com/dolores-sit-voluptas-qui-et-est-tempore-quod',	'2017-02-24 17:36:54',	4825094947896),
(875,	10,	'http://www.glover.net/',	'2017-04-07 15:42:10',	10297546122247),
(876,	10,	'https://www.hahn.com/aut-quasi-dolore-sunt-et-similique-facere-voluptatem-qui',	'2017-02-11 15:46:05',	8507334425623),
(877,	10,	'https://wintheiser.com/possimus-voluptas-perferendis-consequatur-alias-modi-quos-aspernatur-quis.html',	'2017-01-24 13:42:53',	2479083279437),
(878,	10,	'http://www.pouros.com/commodi-blanditiis-maxime-doloribus-nemo-et-tenetur-perspiciatis-qui.html',	'2017-07-15 01:37:06',	8169556817946),
(879,	10,	'http://www.bradtke.com/',	'2017-06-03 20:29:46',	3055746391112),
(880,	10,	'http://stamm.info/possimus-earum-dolor-aut-molestias-soluta-quibusdam-voluptatum-nulla',	'2017-02-19 12:03:55',	10770618240003),
(881,	10,	'http://www.kerluke.com/',	'2017-03-19 06:33:29',	5561584681009),
(882,	10,	'http://bruen.com/incidunt-voluptate-maxime-voluptas-non',	'2017-04-09 14:55:31',	3885062430785),
(883,	10,	'http://powlowski.com/',	'2017-04-27 05:23:26',	4655136742458),
(884,	10,	'http://www.koelpin.com/autem-repellendus-id-cumque-officiis-ipsam.html',	'2017-04-04 20:25:15',	4378264698940),
(885,	10,	'http://mertz.com/voluptas-et-unde-autem-et-nihil',	'2017-01-26 19:28:48',	3923366778944),
(886,	10,	'http://www.reilly.com/omnis-iure-non-soluta',	'2017-05-07 07:55:15',	4489256407099),
(887,	10,	'http://huel.com/iste-necessitatibus-possimus-aut-rerum-atque-officiis.html',	'2017-04-14 10:58:42',	9768605137932),
(888,	10,	'https://www.little.com/fuga-laborum-quaerat-nesciunt-doloribus',	'2017-01-17 00:49:35',	5790002437167),
(889,	10,	'http://dare.com/atque-distinctio-quia-voluptas-illo-est.html',	'2017-04-17 16:38:18',	3061603998792),
(890,	10,	'http://www.predovic.com/',	'2017-04-07 06:24:04',	5563477386289),
(891,	10,	'https://www.hilll.biz/accusantium-et-aliquid-quia-officiis',	'2017-02-17 05:41:36',	833114880092),
(892,	10,	'http://wehner.com/qui-consectetur-ipsam-asperiores-sed-dolorem-voluptatem-itaque-eum.html',	'2017-07-14 11:20:40',	1591977200725),
(893,	10,	'http://www.bayer.org/dolor-natus-similique-doloremque-culpa-sint-eaque.html',	'2017-07-02 12:33:05',	1476143411286),
(894,	10,	'http://kovacek.com/voluptates-laboriosam-quasi-distinctio',	'2017-02-26 16:20:44',	1458893527126),
(895,	10,	'http://www.kuhn.biz/et-rerum-doloribus-libero-at-nihil-doloribus-quia-dolor',	'2017-06-20 11:35:24',	4973682283575),
(896,	10,	'http://ward.biz/',	'2017-03-09 15:21:21',	10203127567368),
(897,	10,	'http://kessler.org/',	'2017-05-06 14:55:36',	7918734643228),
(898,	10,	'http://www.dicki.com/quia-non-repellat-at-repudiandae-omnis',	'2017-04-08 23:57:37',	598168176734),
(899,	10,	'http://heidenreich.biz/quia-eligendi-quia-sunt',	'2017-03-08 09:18:39',	9032110991378),
(900,	10,	'https://www.robel.net/maiores-distinctio-consequatur-magni-perspiciatis-recusandae-sapiente',	'2017-04-21 00:21:34',	1984584151122),
(901,	10,	'http://www.lueilwitz.com/',	'2017-06-05 10:27:56',	3513392819268),
(902,	10,	'http://www.kovacek.com/corporis-inventore-iusto-voluptas-numquam-non-qui-quam.html',	'2017-05-07 02:24:10',	3271686072390),
(903,	10,	'http://halvorson.com/earum-culpa-alias-aspernatur-similique.html',	'2017-05-18 06:39:52',	7559241185311),
(904,	10,	'http://goodwin.com/ullam-eaque-nulla-ea-ipsa-quia-corporis-sed',	'2017-02-09 18:35:12',	10028575672329),
(905,	10,	'http://www.ritchie.com/voluptate-minima-nihil-adipisci-beatae-enim-non-molestiae-maiores',	'2017-07-07 15:14:14',	8096781020187),
(906,	10,	'http://crona.org/minima-officia-deleniti-ducimus-non-quo-praesentium',	'2017-05-17 01:11:08',	6861671034918),
(907,	10,	'http://www.wilkinson.com/ea-facere-repellendus-reprehenderit-recusandae-consectetur-similique-sed.html',	'2017-05-27 03:27:04',	7540793825312),
(908,	10,	'http://moore.com/',	'2017-03-07 12:01:19',	10575864304644),
(909,	10,	'http://mayert.com/ipsum-qui-hic-aliquam-sunt-ut',	'2017-03-29 03:35:59',	4036111575103),
(910,	10,	'https://moen.net/est-cupiditate-et-qui-hic-ipsa.html',	'2017-05-07 07:12:36',	10596540216324),
(911,	10,	'https://mayer.info/quis-rerum-blanditiis-quos.html',	'2017-07-13 12:09:56',	10351366266886),
(912,	10,	'http://hand.com/quia-voluptatem-debitis-vel',	'2017-05-13 18:17:05',	9597696261133),
(913,	12,	'http://www.jenkins.biz/',	'2017-05-21 05:47:26',	4011386731583),
(914,	12,	'http://www.huels.com/ipsa-aut-eum-incidunt-est-corporis-aperiam',	'2017-05-08 11:09:59',	2980844682313),
(915,	12,	'http://lehner.org/perferendis-pariatur-sed-ipsum-minus.html',	'2017-04-30 20:31:02',	7409853148193),
(916,	12,	'http://bruen.net/numquam-voluptatibus-culpa-incidunt-deleniti-ut-sed-necessitatibus.html',	'2017-06-26 07:08:35',	8500643143703),
(917,	12,	'http://cummings.com/',	'2017-01-29 10:41:07',	1754333542484),
(918,	12,	'https://roob.biz/omnis-recusandae-tempora-laudantium-eos.html',	'2017-05-25 00:46:53',	2204739312720),
(919,	12,	'http://gutkowski.info/saepe-autem-excepturi-vero-iste-quo-provident',	'2017-07-08 00:09:38',	567130864734),
(920,	12,	'https://ward.biz/laborum-ullam-magnam-saepe-beatae-provident-eaque-omnis-repellendus.html',	'2017-06-19 09:22:38',	7317810933794),
(921,	12,	'https://www.koch.com/quasi-odit-voluptates-animi-itaque-qui-non',	'2017-05-30 14:08:51',	3037854192712),
(922,	12,	'https://hirthe.com/ut-possimus-atque-quasi-nisi-accusantium-vero.html',	'2017-03-24 09:50:18',	2159108065360),
(923,	12,	'http://romaguera.com/',	'2017-06-15 22:15:51',	8793954344980),
(924,	12,	'http://www.stracke.com/',	'2017-02-11 00:51:49',	4496747719739),
(925,	12,	'https://sipes.com/voluptate-ut-itaque-cum-quidem-quis-ipsa.html',	'2017-03-09 09:10:50',	7132790353955),
(926,	12,	'http://hoppe.com/accusantium-qui-ut-voluptas-voluptatibus-harum-quaerat',	'2017-03-18 19:20:34',	8001965639707),
(927,	12,	'http://www.spencer.info/ab-reprehenderit-odio-temporibus-assumenda-beatae.html',	'2017-03-25 00:42:59',	1420366085207),
(928,	12,	'http://www.marquardt.com/voluptatem-voluptatibus-fuga-molestias-molestias-ut.html',	'2017-07-11 16:28:20',	7730958530590),
(929,	12,	'https://gibson.biz/ut-rerum-et-et-autem-harum-nobis.html',	'2017-01-19 16:27:50',	6038960353325),
(930,	12,	'http://stroman.net/sint-dignissimos-rerum-animi-impedit-est-sed-debitis-rerum',	'2017-02-02 05:53:36',	3404950241349),
(931,	12,	'https://satterfield.org/doloribus-architecto-doloribus-ex.html',	'2017-06-15 00:18:25',	249235072097),
(932,	12,	'http://brekke.com/autem-delectus-et-rerum-impedit-voluptas-ea',	'2017-06-18 15:31:33',	9310646425616),
(933,	12,	'http://www.flatley.com/sint-in-in-molestiae-autem-hic.html',	'2017-06-21 15:58:53',	10964191426561),
(934,	12,	'https://beahan.com/nulla-libero-a-et-incidunt-qui.html',	'2017-02-14 08:39:17',	10277810744327),
(935,	12,	'https://jones.com/quibusdam-nostrum-magni-culpa-labore.html',	'2017-06-27 17:28:36',	6412311173162),
(936,	12,	'https://www.kunze.com/ducimus-corrupti-est-nulla-doloremque-ipsam',	'2017-05-30 19:21:28',	6830746183718),
(937,	12,	'http://connelly.com/',	'2017-05-11 16:28:34',	6823488291878),
(938,	12,	'http://rowe.com/corrupti-quod-a-optio-eum-laborum-ut-id',	'2017-06-30 22:39:29',	5993059200046),
(939,	12,	'http://walter.com/dolores-sed-similique-minima-debitis',	'2017-04-23 06:00:31',	10866857763842),
(940,	12,	'http://www.wiza.org/distinctio-est-fugit-consectetur-esse-ut-saepe-quis',	'2017-03-29 00:38:41',	6424912230442),
(941,	12,	'http://www.bernier.com/assumenda-quis-cupiditate-rerum',	'2017-04-21 21:53:50',	5349309189171),
(942,	12,	'http://www.bogisich.com/ut-officia-atque-officiis-qui.html',	'2017-02-11 17:28:47',	9469437747214),
(943,	12,	'https://von.info/delectus-ea-et-voluptatem-laborum.html',	'2017-03-25 04:39:33',	9911398604810),
(944,	12,	'http://cremin.com/aut-saepe-et-sit-impedit-voluptatem',	'2017-04-08 17:57:33',	9360695925775)
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `customer_id` = VALUES(`customer_id`), `url` = VALUES(`url`), `date` = VALUES(`date`), `transfered_bytes` = VALUES(`transfered_bytes`);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- 2017-07-16 23:09:24
