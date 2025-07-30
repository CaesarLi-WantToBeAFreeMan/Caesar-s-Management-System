-- +--------------------------------------------------------------------+
-- | database server type:               mysql 8.0                      |
-- | database server host:               localhost:3306                 |
-- | database name:                      cms_db                         |
-- | served application:                 Caesar's Management  System    |
-- | database management application:    DBeaver Community Version      |
-- | SQL author:                         Caesar James LEE               |
-- +--------------------------------------------------------------------+

-- database

DROP DATABASE IF EXISTS `cms_db`;
CREATE DATABASE `cms_db`
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE `cms_db`;

-- use Unicode

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET collation_connection = 'utf8mb4_unicode_ci';

-- +--------------------+
-- | reference tables   |
-- +--------------------+

-- +------------+
-- | genders    |
-- +------------+

DROP TABLE IF EXISTS `genders`;

CREATE TABLE `genders`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique gender type ID',
    `name` VARCHAR(50) NOT NULL UNIQUE COMMENT 'gender name'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'gender definitions';

INSERT INTO `genders`
    (`id`,  `name`          )
VALUES
    (1,     'male'          ),
    (2,     'demiboy'       ),
    (3,     'female'        ),
    (4,     'demigirl'      ),
    (5,     'two-spirit'    ),
    (6,     'cisgender'     ),
    (7,     'transgender'   ),
    (8,     'non-binary'    ),
    (9,     'genderqueer'   ),
    (10,    'genderfluid'   ),
    (11,    'agender'       ),
    (12,    'intersex'      ),
    (13,    'androgynous'   ),
    (14,    'third gender'  ),
    (15,    'bigender'      ),
    (16,    'trigender'     ),
    (17,    'polygender'    );

-- +------------+
-- | diplomas   |
-- +------------+

DROP TABLE IF EXISTS `diplomas`;

CREATE TABLE `diplomas`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique diploma ID',
    `abbreviation` VARCHAR(10) NOT NULL UNIQUE COMMENT 'diploma abbreviation',
    `name` VARCHAR(50) NOT NULL UNIQUE COMMENT 'full diploma name'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'diploma qualifications';

INSERT INTO `diplomas`
    (`id`,  `abbreviation`, `name`                                              )
VALUES
    (1,     'UHS',          'under high school'                                 ),
    (2,     'HS',           'high school'                                       ),
    (3,     'AA',           'Associate of Arts'                                 ),
    (4,     'AS',           'Associate of Science'                              ),
    (5,     'AAS',          'Associate of Applied Science'                      ),
    (6,     'BA',           'Bachelor of Arts'                                  ),
    (7,     'BS',           'Bachelor of Science'                               ),
    (8,     'BFA',          'Bachelor of Fine Arts'                             ),
    (9,     'BBA',          'Bachelor of Business Administration'               ),
    (10,    'BSBA',         'Bachelor of Science in Business Administration'    ),
    (11,    'BEng',         'Bachelor of Engineering'                           ),
    (12,    'BSN',          'Bachelor of Science in Nursing'                    ),
    (13,    'BEd',          'Bachelor of Education'                             ),
    (14,    'BArch',        'Bachelor of Architecture'                          ),
    (15,    'BMus',         'Bachelor of Music'                                 ),
    (16,    'MA',           'Master of Arts'                                    ),
    (17,    'MS',           'Master of Science'                                 ),
    (18,    'MBA',          'Master of Business Administration'                 ),
    (19,    'MFA',          'Master of Fine Arts'                               ),
    (20,    'MEd',          'Master of Education'                               ),
    (21,    'MSW',          'Master of Social Work'                             ),
    (22,    'MPA',          'Master of Public Administration'                   ),
    (23,    'MPH',          'Master of Public Health'                           ),
    (24,    'MSN',          'Master of Science in Nursing'                      ),
    (25,    'MEng',         'Master of Engineering'                             ),
    (26,    'JD',           'Juris Doctor'                                      ),
    (27,    'MD',           'Doctor of Medicine'                                ),
    (28,    'DO',           'Doctor of Osteopathic Medicine'                    ),
    (29,    'DVM',          'Doctor of Veterinary Medicine'                     ),
    (30,    'DDS',          'Doctor of Dental Surgery'                          ),
    (31,    'DMD',          'Doctor of Medicine in Dentistry'                   ),
    (32,    'PharmD',       'Doctor of Pharmacy'                                ),
    (33,    'DPT',          'Doctor of Physical Therapy'                        ),
    (34,    'PhD',          'Doctor of Philosophy'                              ),
    (35,    'EdD',          'Doctor of Education'                               ),
    (36,    'PsyD',         'Doctor of Psychology'                              ),
    (37,    'DS',           'Doctor of Science'                                 ),
    (38,    'ThD',          'Doctor of Theology'                                );

-- +------------+
-- | currencies |
-- +------------+

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique currency ID',
    `abbreviation` VARCHAR(3) NOT NULL UNIQUE COMMENT 'currency code ISO 4217',
    `name` VARCHAR(50) NOT NULL UNIQUE COMMENT 'currency full name'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'Currency list';

INSERT INTO `currencies`
    (`id`,  `abbreviation`, `name`                                      )
VALUES
    (1,     'AED',          'United Arab Emirates dirham'               ),
    (2,     'AFN',          'Afghan afghani'                            ),
    (3,     'ALL',          'Albania lek'                               ),
    (4,     'AMD',          'Armenian dram'                             ),
    (5,     'AOA',          'Angolan kwanza'                            ),
    (6,     'ARS',          'Argentine peso'                            ),
    (7,     'AUD',          'Australian dollar'                         ),
    (8,     'AWG',          'Aruban florin'                             ),
    (9,     'AZN',          'Azerbaijani manat'                         ),
    (10,    'BAM',          'Bosnia and Herzegovina convertible mark'   ),
    (11,    'BBD',          'Barbados dollar'                           ),
    (12,    'BDT',          'Bangladeshi taka'                          ),
    (13,    'BGN',          'Bulgarian lev'                             ),
    (14,    'BHD',          'Bahraini dinar'                            ),
    (15,    'BIF',          'Burundian franc'                           ),
    (16,    'BMD',          'Bermudian dollar'                          ),
    (17,    'BND',          'Brunei dollar'                             ),
    (18,    'BOB',          'Boliviano'                                 ),
    (19,    'BRL',          'Brazilian real'                            ),
    (20,    'BSD',          'Bahamian dollar'                           ),
    (21,    'BTN',          'Bhutanese ngultrum'                        ),
    (22,    'BWP',          'Botswana pula'                             ),
    (23,    'BYN',          'Belarusian ruble'                          ),
    (24,    'BZD',          'Belize dollar'                             ),
    (25,    'CAD',          'Canadian dollar'                           ),
    (26,    'CDF',          'Congolese franc'                           ),
    (27,    'CHF',          'Swiss franc'                               ),
    (28,    'CLP',          'Chilean peso'                              ),
    (29,    'CNY',          'Chinese Yuan'                              ),
    (30,    'COP',          'Colombian peso'                            ),
    (31,    'CRC',          'Costa Rican colon'                         ),
    (32,    'CUP',          'Cuban peso'                                ),
    (33,    'CVE',          'Cape Verdean escudo'                       ),
    (34,    'CZK',          'Czech koruna'                              ),
    (35,    'DJF',          'Djiboutian franc'                          ),
    (36,    'DKK',          'Danish krone'                              ),
    (37,    'DOP',          'Dominican peso'                            ),
    (38,    'DZD',          'Algerian dinar'                            ),
    (39,    'EGP',          'Egyptian pound'                            ),
    (40,    'ERN',          'Eritrean nakfa'                            ),
    (41,    'ETB',          'Ethiopian birr'                            ),
    (42,    'EUR',          'Euro'                                      ),
    (43,    'FJD',          'Fiji dollar'                               ),
    (44,    'FKP',          'Falkland Islands pound'                    ),
    (45,    'GBP',          'pound sterling'                            ),
    (46,    'GEL',          'Georgian lari'                             ),
    (47,    'GHS',          'Ghanaian cedi'                             ),
    (48,    'GIP',          'Gibraltar pound'                           ),
    (49,    'GMD',          'Gambian dalasi'                            ),
    (50,    'GNF',          'Guinean franc'                             ),
    (51,    'GTQ',          'Guatemalan quetzal'                        ),
    (52,    'GYD',          'Guyanese dollar'                           ),
    (53,    'HKD',          'Hong Kong dollar'                          ),
    (54,    'HNL',          'Honduran lempira'                          ),
    (55,    'HTG',          'Haitian gourde'                            ),
    (56,    'HUF',          'Hungarian forint'                          ),
    (57,    'IDR',          'Indonesian rupiah'                         ),
    (58,    'ILS',          'Israeli new shekel'                        ),
    (59,    'INR',          'Indian rupee'                              ),
    (60,    'IQD',          'Iraqi dinar'                               ),
    (61,    'IRR',          'Iranian rial'                              ),
    (62,    'ISK',          'Icelandic króna'                           ),
    (63,    'JMD',          'Jamaican dollar'                           ),
    (64,    'JOD',          'Jordanian dinar'                           ),
    (65,    'JPY',          'Japanese yen'                              ),
    (66,    'KES',          'Kenyan shilling'                           ),
    (67,    'KGS',          'Kyrgyzstani som'                           ),
    (68,    'KHR',          'Cambodian riel'                            ),
    (69,    'KMF',          'Comoro franc'                              ),
    (70,    'KPW',          'North Korean won'                          ),
    (71,    'KRW',          'South Korean won'                          ),
    (72,    'KWD',          'Kuwaiti dinar'                             ),
    (73,    'KYD',          'Cayman Islands dollar'                     ),
    (74,    'KZT',          'Kazakhstani tenge'                         ),
    (75,    'LAK',          'Lao kip'                                   ),
    (76,    'LBP',          'Lebanese pound'                            ),
    (77,    'LKR',          'Sri Lankan rupee'                          ),
    (78,    'LRD',          'Liberian dollar'                           ),
    (79,    'LSL',          'Lesotho loti'                              ),
    (80,    'LYD',          'Libyan dinar'                              ),
    (81,    'MAD',          'Moroccan dirham'                           ),
    (82,    'MDL',          'Moldovan leu'                              ),
    (83,    'MGA',          'Malagasy ariary'                           ),
    (84,    'MKD',          'Macedonian denar'                          ),
    (85,    'MMK',          'Myanmar kyat'                              ),
    (86,    'MNT',          'Mongolian tögrög'                          ),
    (87,    'MOP',          'Macanese pataca'                           ),
    (88,    'MRU',          'Mauritanian ouguiya'                       ),
    (89,    'MUR',          'Mauritian rupee'                           ),
    (90,    'MVR',          'Maldivian rufiyaa'                         ),
    (91,    'MWK',          'Malawian kwacha'                           ),
    (92,    'MXN',          'Mexican peso'                              ),
    (93,    'MYR',          'Malaysian ringgit'                         ),
    (94,    'MZN',          'Mozambican metical'                        ),
    (95,    'NAD',          'Namibian dollar'                           ),
    (96,    'NGN',          'Nigerian naira'                            ),
    (97,    'NIO',          'Nicaraguan córdoba'                        ),
    (98,    'NOK',          'Norwegian krone'                           ),
    (99,    'NPR',          'Nepalese rupee'                            ),
    (100,   'NZD',          'New Zealand dollar'                        ),
    (101,   'OMR',          'Omani rial'                                ),
    (102,   'PAB',          'Panamanian balboa'                         ),
    (103,   'PEN',          'Peruvian sol'                              ),
    (104,   'PHK',          'Papua New Guinean kina'                    ),
    (105,   'PHP',          'Philippine peso'                           ),
    (106,   'PKR',          'Pakistani rupee'                           ),
    (107,   'PLN',          'Polish złoty'                              ),
    (108,   'PYG',          'Paraguayan guaraní'                        ),
    (109,   'QAR',          'Qatari riyal'                              ),
    (110,   'RON',          'Romanian leu'                              ),
    (111,   'RSD',          'Serbian dinar'                             ),
    (112,   'RUB',          'Russian ruble'                             ),
    (113,   'RWF',          'Rwandan franc'                             ),
    (114,   'SAR',          'Saudi riyal'                               ),
    (115,   'SBD',          'Solomon Islands dollar'                    ),
    (116,   'SCR',          'Seychelles rupee'                          ),
    (117,   'SDG',          'Sudanese pound'                            ),
    (118,   'SEK',          'Swedish krona'                             ),
    (119,   'SGD',          'Singapore dollar'                          ),
    (120,   'SHP',          'Saint Helena pound'                        ),
    (121,   'SLE',          'Sierra Leonean leone'                      ),
    (122,   'SOS',          'Somalian shilling'                         ),
    (123,   'SRD',          'Surinamese dollar'                         ),
    (124,   'SSP',          'South Sudanese pound'                      ),
    (125,   'STN',          'São Tomé and Príncipe dobra'               ),
    (126,   'SVC',          'Salvadoran colón'                          ),
    (127,   'SYP',          'Syrian pound'                              ),
    (128,   'SZL',          'Swazi lilangeni'                           ),
    (129,   'THB',          'Thai baht'                                 ),
    (130,   'TJS',          'Tajikistani somoni'                        ),
    (131,   'TMT',          'Turkmenistan manat'                        ),
    (132,   'TND',          'Tunisian dinar'                            ),
    (133,   'TOP',          'Tongan pa''anga'                           ),
    (134,   'TRY',          'Turkish lira'                              ),
    (135,   'TTD',          'Trinidad and Tobago dollar'                ),
    (136,   'TWD',          'New Taiwan dollar'                         ),
    (137,   'TZS',          'Tanzanian shilling'                        ),
    (138,   'UAH',          'Ukrainian hryvnia'                         ),
    (139,   'UGX',          'Ugandan shilling'                          ),
    (140,   'USD',          'United States dollar'                      ),
    (141,   'UYU',          'Uruguayan peso'                            ),
    (142,   'UZS',          'Uzbekistani sum'                           ),
    (143,   'VED',          'Venezuelan digital bolívar'                ),
    (144,   'VES',          'Venezuelan sovereign bolívar'              ),
    (145,   'VND',          'Vietnamese đồng'                           ),
    (146,   'VUV',          'Vanuatu vatu'                              ),
    (147,   'WST',          'Samoan tala'                               ),
    (148,   'XAF',          'CFA franc BEAC'                            ),
    (149,   'XCD',          'East Caribbean dollar'                     ),
    (150,   'XCG',          'Caribbean guilder'                         ),
    (151,   'XOF',          'CFA franc BCEAO'                           ),
    (152,   'XPF',          'CFP franc'                                 ),
    (153,   'YER',          'Yemeni rial'                               ),
    (154,   'ZAR',          'South African rand'                        ),
    (155,   'ZMW',          'Zambian kwacha'                            ),
    (156,   'ZWG',          'Zimbabwe Gold'                             );
                           
-- +----------------+
-- | nationalities  |
-- +----------------+
                           
DROP TABLE IF EXISTS `nationalities`;

CREATE TABLE `nationalities`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique nationality ID',
    `abbreviation` VARCHAR(3) NOT NULL UNIQUE COMMENT 'country code ISO 3166-1 alpha-3',
    `name` VARCHAR(55) NOT NULL UNIQUE COMMENT 'country name'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'Nationalities list';

INSERT INTO `nationalities`
    (
        `id`,  `abbreviation`,  `name`
    )
VALUES
    (
        1,      'ABW',          'Aruba'
    ),
    (
        2,      'AFG',          'Afghanistan'
    ),
    (
        3,      'AGO',          'Angola'
    ),
    (
        4,      'AIA',          'Anguilla'
    ),
    (
        5,      'ALA',          'Åland Islands'
    ),
    (
        6,      'ALB',          'Albania'
    ),
    (
        7,      'AND',          'Andorra'
    ),
    (
        8,      'ARE',          'United Arab Emirates'
    ),
    (
        9,      'ARG',          'Argentina'
    ),
    (
        10,     'ARM',          'Armenia'
    ),
    (
        11,     'ASM',          'American Samoa'
    ),
    (
        12,     'ATA',          'Antarctica'
    ),
    (
        13,     'ATF',          'French Southern Territories'
    ),
    (
        14,     'ATG',          'Antigua and Barbuda'
    ),
    (
        15,     'AUS',          'Australia'
    ),
    (
        16,     'AUT',          'Austria'
    ),
    (
        17,     'AZE',          'Azerbaijan'
    ),
    (
        18,     'BDI',          'Burundi'
    ),
    (
        19,     'BEL',          'Belgium'
    ),
    (
        20,     'BFA',          'Burkina Faso'
    ),
    (
        21,     'BGD',          'Bangladesh'
    ),
    (
        22,     'BGR',          'Bulgaria'
    ),
    (
        23,     'BHR',          'Bahrain'
    ),
    (
        24,     'BHS',          'Bahamas'
    ),
    (
        25,     'BIH',          'Bosnia and Herzegovina'
    ),
    (
        26,     'BLM',          'Saint Barthélemy'
    ),
    (
        27,     'BLR',          'Belarus'
    ),
    (
        28,     'BLZ',          'Belize'
    ),
    (
        29,     'BMU',          'Bermuda'
    ),
    (
        30,     'BOL',          'Bolivia, Plurinational State of'
    ),
    (
        31,     'BRA',          'Brazil'
    ),
    (
        32,     'BRB',          'Barbados'
    ),
    (
        33,     'BRN',          'Brunei Darussalam'
    ),
    (
        34,     'BTN',          'Bhutan'
    ),
    (
        35,     'BVT',          'Bouvet Island'
    ),
    (
        36,     'BWA',          'Botswana'
    ),
    (
        37,     'CAF',          'Central African Republic'
    ),
    (
        38,     'CAN',          'Canada'
    ),
    (
        39,     'CCK',          'Cocos (Keeling) Islands'
    ),
    (
        40,     'CHE',          'Switzerland'
    ),
    (
        41,     'CHL',          'Chile'
    ),
    (
        42,     'CHN',          'China'
    ),
    (
        43,     'CIV',          'Côte d'
    ),
    (
        44,     'CMR',          'Cameroon'
    ),
    (
        45,     'COD',          'Congo, Democratic Republic of the'
    ),
    (
        46,     'COG',          'Congo'
    ),
    (
        47,     'COK',          'Cook Islands'
    ),
    (
        48,     'COL',          'Colombia'
    ),
    (
        49,     'COM',          'Comoros'
    ),
    (
        50,     'CPV',          'Cabo Verde'
    ),
    (
        51,     'CRI',          'Costa Rica'
    ),
    (
        52,     'CUB',          'Cuba'
    ),
    (
        53,     'CUW',          'Curaçao'
    ),
    (
        54,     'CXR',          'Christmas Island'
    ),
    (
        55,     'CYM',          'Cayman Islands'
    ),
    (
        56,     'CYP',          'Cyprus'
    ),
    (
        57,     'CZE',          'Czechia'
    ),
    (
        58,     'DEU',          'Germany'
    ),
    (
        59,     'DJI',          'Djibouti'
    ),
    (
        60,     'DMA',          'Dominica'
    ),
    (
        61,     'DNK',          'Denmark'
    ),
    (
        62,     'DOM',          'Dominican Republic'
    ),
    (
        63,     'DZA',          'Algeria'
    ),
    (
        64,     'ECU',          'Ecuador'
    ),
    (
        65,     'EGY',          'Egypt'
    ),
    (
        66,     'ERI',          'Eritrea'
    ),
    (
        67,     'ESH',          'Western Sahara'
    ),
    (
        68,     'ESP',          'Spain'
    ),
    (
        69,     'EST',          'Estonia'
    ),
    (
        70,     'ETH',          'Ethiopia'
    ),
    (
        71,     'FIN',          'Finland'
    ),
    (
        72,     'FJI',          'Fiji'
    ),
    (
        73,     'FLK',          'Falkland Islands (Malvinas)'
    ),
    (
        74,     'FRA',          'France'
    ),
    (
        75,     'FRO',          'Faroe Islands'
    ),
    (
        76,     'FSM',          'Micronesia, Federated States of'
    ),
    (
        77,     'GAB',          'Gabon'
    ),
    (
        78,     'GBR',          'United Kingdom of Great Britain and Northern Ireland'
    ),
    (
        79,     'GEO',          'Georgia'
    ),
    (
        80,     'GGY',          'Guernsey'
    ),
    (
        81,     'GHA',          'Ghana'
    ),
    (
        82,     'GIB',          'Gibraltar'
    ),
    (
        83,     'GIN',          'Guinea'
    ),
    (
        84,     'GLP',          'Guadeloupe'
    ),
    (
        85,     'GMB',          'Gambia'
    ),
    (
        86,     'GNB',          'Guinea-Bissau'
    ),
    (
        87,     'GNQ',          'Equatorial Guinea'
    ),
    (
        88,     'GRC',          'Greece'
    ),
    (
        89,     'GRD',          'Grenada'
    ),
    (
        90,     'GRL',          'Greenland'
    ),
    (
        91,     'GTM',          'Guatemala'
    ),
    (
        92,     'GUF',          'French Guiana'
    ),
    (
        93,     'GUM',          'Guam'
    ),
    (
        94,     'GUY',          'Guyana'
    ),
    (
        95,     'HKG',          'Hong Kong'
    ),
    (
        96,     'HMD',          'Heard Island and McDonald Islands'
    ),
    (
        97,     'HND',          'Honduras'
    ),
    (
        98,     'HRV',          'Croatia'
    ),
    (
        99,     'HTI',          'Haiti'
    ),
    (
        100,    'HUN',          'Hungary'
    ),
    (
        101,    'IDN',          'Indonesia'
    ),
    (
        102,    'IMN',          'Isle of Man'
    ),
    (
        103,    'IND',          'India'
    ),
    (
        104,    'IOT',          'British Indian Ocean Territory'
    ),
    (
        105,    'IRL',          'Ireland'
    ),
    (
        106,    'IRN',          'Iran, Islamic Republic of'
    ),
    (
        107,    'IRQ',          'Iraq'
    ),
    (
        108,    'ISL',          'Iceland'
    ),
    (
        109,    'ISR',          'Israel'
    ),
    (
        110,    'ITA',          'Italy'
    ),
    (
        111,    'JAM',          'Jamaica'
    ),
    (
        112,    'JEY',          'Jersey'
    ),
    (
        113,    'JOR',          'Jordan'
    ),
    (
        114,    'JPN',          'Japan'
    ),
    (
        115,    'KAZ',          'Kazakhstan'
    ),
    (
        116,    'KEN',          'Kenya'
    ),
    (
        117,    'KGZ',          'Kyrgyzstan'
    ),
    (
        118,    'KHM',          'Cambodia'
    ),
    (
        119,    'KIR',          'Kiribati'
    ),
    (
        120,    'KNA',          'Saint Kitts and Nevis'
    ),
    (
        121,    'KOR',          'Korea, Republic of'
    ),
    (
        122,    'KWT',          'Kuwait'
    ),
    (
        123,    'LAO',          'Lao People'
    ),
    (
        124,    'LBN',          'Lebanon'
    ),
    (
        125,    'LBR',          'Liberia'
    ),
    (
        126,    'LBY',          'Libya'
    ),
    (
        127,    'LCA',          'Saint Lucia'
    ),
    (
        128,    'LIE',          'Liechtenstein'
    ),
    (
        129,    'LKA',          'Sri Lanka'
    ),
    (
        130,    'LSO',          'Lesotho'
    ),
    (
        131,    'LTU',          'Lithuania'
    ),
    (
        132,    'LUX',          'Luxembourg'
    ),
    (
        133,    'LVA',          'Latvia'
    ),
    (
        134,    'MAC',          'Macao'
    ),
    (
        135,    'MAF',          'Saint Martin (French part)'
    ),
    (
        136,    'MAR',          'Morocco'
    ),
    (
        137,    'MCO',          'Monaco'
    ),
    (
        138,    'MDA',          'Moldova'
    ),
    (
        139,    'MDG',          'Madagascar'
    ),
    (
        140,    'MDV',          'Maldives'
    ),
    (
        141,    'MEX',          'Mexico'
    ),
    (
        142,    'MHL',          'Marshall Islands'
    ),
    (
        143,    'MKD',          'North Macedonia'
    ),
    (
        144,    'MLI',          'Mali'
    ),
    (
        145,    'MLT',          'Malta'
    ),
    (
        146,    'MMR',          'Myanmar'
    ),
    (
        147,    'MNE',          'Montenegro'
    ),
    (
        148,    'MNG',          'Mongolia'
    ),
    (
        149,    'MNP',          'Northern Mariana Islands'
    ),
    (
        150,    'MOZ',          'Mozambique'
    ),
    (
        151,    'MRT',          'Mauritania'
    ),
    (
        152,    'MSR',          'Montserrat'
    ),
    (
        153,    'MTQ',          'Martinique'
    ),
    (
        154,    'MUS',          'Mauritius'
    ),
    (
        155,    'MWI',          'Malawi'
    ),
    (
        156,    'MYS',          'Malaysia'
    ),
    (
        157,    'MYT',          'Mayotte'
    ),
    (
        158,    'NAM',          'Namibia'
    ),
    (
        159,    'NCL',          'New Caledonia'
    ),
    (
        160,    'NER',          'Niger'
    ),
    (
        161,    'NFK',          'Norfolk Island'
    ),
    (
        162,    'NGA',          'Nigeria'
    ),
    (
        163,    'NIC',          'Nicaragua'
    ),
    (
        164,    'NIU',          'Niue'
    ),
    (
        165,    'NLD',          'Netherlands'
    ),
    (
        166,    'NOR',          'Norway'
    ),
    (
        167,    'NPL',          'Nepal'
    ),
    (
        168,    'NRU',          'Nauru'
    ),
    (
        169,    'NZL',          'New Zealand'
    ),
    (
        170,    'OMN',          'Oman'
    ),
    (
        171,    'PAK',          'Pakistan'
    ),
    (
        172,    'PAN',          'Panama'
    ),
    (
        173,    'PCN',          'Pitcairn'
    ),
    (
        174,    'PER',          'Peru'
    ),
    (
        175,    'PHL',          'Philippines'
    ),
    (
        176,    'PLW',          'Palau'
    ),
    (
        177,    'PNG',          'Papua New Guinea'
    ),
    (
        178,    'POL',          'Poland'
    ),
    (
        179,    'PRI',          'Puerto Rico'
    ),
    (
        180,    'PRK',          'Korea, Democratic People'
    ),
    (
        181,    'PRT',          'Portugal'
    ),
    (
        182,    'PRY',          'Paraguay'
    ),
    (
        183,    'PSE',          'Palestine'
    ),
    (
        184,    'PYF',          'French Polynesia'
    ),
    (
        185,    'QAT',          'Qatar'
    ),
    (
        186,    'REU',          'Réunion'
    ),
    (
        187,    'ROU',          'Romania'
    ),
    (
        188,    'RUS',          'Russian Federation'
    ),
    (
        189,    'RWA',          'Rwanda'
    ),
    (
        190,    'SAU',          'Saudi Arabia'
    ),
    (
        191,    'SDN',          'Sudan'
    ),
    (
        192,    'SEN',          'Senegal'
    ),
    (
        193,    'SGP',          'Singapore'
    ),
    (
        194,    'SGS',          'South Georgia and the South Sandwich Islands'
    ),
    (
        195,    'SHN',          'Saint Helena'
    ),
    (
        196,    'SJM',          'Svalbard and Jan Mayen'
    ),
    (
        197,    'SLB',          'Solomon Islands'
    ),
    (
        198,    'SLE',          'Sierra Leone'
    ),
    (
        199,    'SLV',          'El Salvador'
    ),
    (
        200,    'SMR',          'San Marino'
    ),
    (
        201,    'SOM',          'Somalia'
    ),
    (
        202,    'SPM',          'Saint Pierre and Miquelon'
    ),
    (
        203,    'SRB',          'Serbia'
    ),
    (
        204,    'SSD',          'South Sudan'
    ),
    (
        205,    'STP',          'Sao Tome and Principe'
    ),
    (
        206,    'SUR',          'Suriname'
    ),
    (
        207,    'SVK',          'Slovakia'
    ),
    (
        208,    'SVN',          'Slovenia'
    ),
    (
        209,    'SWE',          'Sweden'
    ),
    (
        210,    'SWZ',          'Eswatini'
    ),
    (
        211,    'SXM',          'Sint Maarten (Dutch part)'
    ),
    (
        212,    'SYC',          'Seychelles'
    ),
    (
        213,    'SYR',          'Syrian Arab Republic'
    ),
    (
        214,    'TCA',          'Turks and Caicos Islands'
    ),
    (
        215,    'TCD',          'Chad'
    ),
    (
        216,    'TGO',          'Togo'
    ),
    (
        217,    'THA',          'Thailand'
    ),
    (
        218,    'TJK',          'Tajikistan'
    ),
    (
        219,    'TKL',          'Tokelau'
    ),
    (
        220,    'TKM',          'Turkmenistan'
    ),
    (
        221,    'TLS',          'Timor-Leste'
    ),
    (
        222,    'TON',          'Tonga'
    ),
    (
        223,    'TTO',          'Trinidad and Tobago'
    ),
    (
        224,    'TUN',          'Tunisia'
    ),
    (
        225,    'TUR',          'Türkiye'
    ),
    (
        226,    'TUV',          'Tuvalu'
    ),
    (
        227,    'TWN',          'Taiwan'
    ),
    (
        228,    'TZA',          'Tanzania, United Republic of'
    ),
    (
        229,    'UGA',          'Uganda'
    ),
    (
        230,    'UKR',          'Ukraine'
    ),
    (
        231,    'UMI',          'United States Minor Outlying Islands'
    ),
    (
        232,    'URY',          'Uruguay'
    ),
    (
        233,    'USA',          'United States of America'
    ),
    (
        234,    'UZB',          'Uzbekistan'
    ),
    (
        235,    'VAT',          'Holy See'
    ),
    (
        236,    'VCT',          'Saint Vincent and the Grenadines'
    ),
    (
        237,    'VEN',          'Venezuela'
    ),
    (
        238,    'VGB',          'Virgin Islands (British)'
    ),
    (
        239,    'VIR',          'Virgin Islands (U.S.)'
    ),
    (
        240,    'VNM',          'Viet Nam'
    ),
    (
        241,    'VUT',          'Vanuatu'
    ),
    (
        242,    'WLF',          'Wallis and Futuna'
    ),
    (
        243,    'WSM',          'Samoa'
    ),
    (
        244,    'YEM',          'Yemen'
    ),
    (
        245,    'ZAF',          'South Africa'
    ),
    (
        246,    'ZMB',          'Zambia'
    ),
    (
        247,    'ZWE',          'Zimbabwe'
    );

-- +------------+
-- | languages  |
-- +------------+

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique language ID',
    `abbreviation` VARCHAR(5) NOT NULL UNIQUE COMMENT 'language code BCP 47',
    `name` VARCHAR(50) NOT NULL UNIQUE COMMENT 'language name and region'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'Supported languages';

INSERT INTO `languages`
    (`id`,  `abbreviation`, `name`                          )
VALUES
    (1,     'ar_SA',        'Arabic (Saudi Arabia)'         ),
    (2,     'bn_BD',        'Bangla (Bangladesh)'           ),
    (3,     'bn_IN',        'Bangla (India)'                ),
    (4,     'cs_CZ',        'Czech (Czech Republic)'        ),
    (5,     'da_DK',        'Danish (Denmark)'              ),
    (6,     'de_AT',        'Austrian German'               ),
    (7,     'de_CH',        'Swiss German'                  ),
    (8,     'de_DE',        'Standard German'               ),
    (9,     'el_GR',        'Modern Greek'                  ),
    (10,    'en_AU',        'Australian English'            ),
    (11,    'en_CA',        'Canadian English'              ),
    (12,    'en_GB',        'Kingdom British English'       ),
    (13,    'en_IE',        'Irish English'                 ),
    (14,    'en_IN',        'Indian English'                ),
    (15,    'en_NZ',        'New Zealand English'           ),
    (16,    'en_US',        'States US English'             ),
    (17,    'en_ZA',        'English (South Africa)'        ),
    (18,    'es_AR',        'Argentine Spanish'             ),
    (19,    'es_CL',        'Chilean Spanish'               ),
    (20,    'es_CO',        'Colombian Spanish'             ),
    (21,    'es_ES',        'Castilian Spanish'             ),
    (22,    'es_MX',        'Mexican Spanish'               ),
    (23,    'es_US',        'American Spanish'              ),
    (24,    'fr_CA',        'Canadian French'               ),
    (25,    'fr_CH',        'Swiss French'                  ),
    (26,    'fr_FR',        'Standard French'               ),
    (27,    'he_IL',        'Hebrew (Israel)'               ),
    (28,    'hi_IN',        'Hindi (India)'                 ),
    (29,    'hu_HU',        'Hungarian (Hungary)'           ),
    (30,    'id_ID',        'Indonesian (Indonesia)'        ),
    (31,    'it_CH',        'Swiss Italian'                 ),
    (32,    'it_IT',        'Standard Italian'              ),
    (33,    'ja_JP',        'Japanese (Japan)'              ),
    (34,    'ko_KR',        'Korean (Republic of Korea)'    ),
    (35,    'nl_BE',        'Belgian Dutch'                 ),
    (36,    'nl_NL',        'Standard Dutch'                ),
    (37,    'no_NO',        'Norwegian (Norway)'            ),
    (38,    'pl_PL',        'Polish (Poland)'               ),
    (39,    'pt_BR',        'Brazilian Portuguese'          ),
    (40,    'pt_PT',        'European Portuguese'           ),
    (41,    'ro_RO',        'Romanian (Romania)'            ),
    (42,    'ru_RU',        'Russian (Russian Federation)'  ),
    (43,    'sk_SK',        'Slovak (Slovakia)'             ),
    (44,    'sv_SE',        'Swedish (Sweden)'              ),
    (45,    'ta_IN',        'Indian Tamil'                  ),
    (46,    'ta_LK',        'Sri Lankan Tamil'              ),
    (47,    'th_TH',        'Thai (Thailand)'               ),
    (48,    'tr_TR',        'Turkish (Turkey)'              ),
    (49,    'zh_CN',        'Chinese (China)'               ),
    (50,    'zh_HK',        'Chinese (Hong Kong)'           ),
    (51,    'zh_TW',        'Chinese (Taiwan)'              );

-- +----------------+
-- | request_types  |
-- +----------------+

CREATE TABLE `request_types`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique request type ID',
    `type` VARCHAR(50) NOT NULL UNIQUE COMMENT 'request type'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'types of requests';

INSERT INTO `request_types`
    (`id`,  `type`              )
VALUES
    (1,     'promotion'         ),
    (2,     'salary_increase'   ),
    (3,     'quit'              ),
    (4,     'change_department' ),
    (5,     'change_team'       ),
    (6,     'create_department' ),
    (7,     'create_team'       ),
    (8,     'leave'             ),
    (9,     'personal_leave'    ),
    (10,    'sick_leave'        ),
    (11,    'annual_leave'      ),
    (12,    'maternity_leave'   ),
    (13,    'paternity_leave'   ),
    (14,    'official_leave'    ),
    (15,    'funeral_leave'     ),
    (16,    'menstrual_leave'   ),
    (17,    'marriage_leave'    ),
    (18,    'unpaid_leave'      ),
    (19,    'paid_leave'        ),
    (20,    'parental_leave'    ),
    (21,    'temporary_break'   ),
    (22,    'work_overtime'     ),
    (23,    'negotiate'         ),
    (24,    'meeting'           );
                
-- +----------------+
-- | request_status |
-- +----------------+

CREATE TABLE `request_status`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique request status ID',
    `type` VARCHAR(50) NOT NULL UNIQUE COMMENT 'request status type'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'status values for requests';

INSERT INTO `request_status`
    (`id`,  `type`              )
VALUES
    (1,     'pending'           ),
    (2,     'approved'          ),
    (3,     'rejected'          ),
    (4,     'need_negotiate'    );

-- +--------+
-- | roles  |
-- +--------+

CREATE TABLE `roles`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique role ID',
    `name` VARCHAR(20) NOT NULL UNIQUE COMMENT 'role name'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'user roles and job positions';

INSERT INTO `roles`
    (`id`,  `name`          )
VALUES
    (1,     'chairperson'   ),
    (2,     'director'      ),
    (3,     'ceo'           ),
    (4,     'clo'           ),
    (5,     'cto'           ),
    (6,     'coo'           ),
    (7,     'cfo'           ),
    (8,     'cmo'           ),
    (9,     'cso'           ),
    (10,    'chro'          ),
    (11,    'cio'           ),
    (12,    'cco'           ),
    (13,    'manager'       ),
    (14,    'employee'      );
          
-- +------------+
-- | log types  |
-- +------------+

CREATE TABLE `log_types`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique log type ID',
    `type` VARCHAR(50) NOT NULL UNIQUE COMMENT 'type of log event'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'types of event logs';

INSERT INTO `log_types`
    (`id`,  `type`              )
VALUES
    (1,     'register'          ),
    (2,     'login'             ),
    (3,     'logout'            ),
    (4,     'reset_password'    ),
    (5,     'update_info'       ),
    (6,     'view_info'         ),
    (7,     'report_data'       ),
    (8,     'upload_data'       ),
    (9,     'create_department' ),
    (10,    'update_department' ),
    (11,    'delete_department' ),
    (12,    'create_team'       ),
    (13,    'update_team'       ),
    (14,    'delete_team'       ),
    (15,    'create_role'       ),
    (16,    'update_role'       ),
    (17,    'delete_role'       ),
    (18,    'update_user'       ),
    (19,    'delete_user'       ),
    (20,    'create_skill'      ),
    (21,    'update_skill'      ),
    (22,    'delete_skill'      ),
    (23,    'send_request'      ),
    (24,    'view_request'      ),
    (25,    'approve_request'   ),
    (26,    'reject_request'    ),
    (27,    'send_message'      ),
    (28,    'read_message'      );

-- +----------------------------------------+
-- | departments, teams and roles tables    |
-- +----------------------------------------+

-- +----------------+
-- | departments    |
-- +----------------+

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique department ID',
    `name` VARCHAR(100) NOT NULL UNIQUE COMMENT 'department name',
    `description` TEXT COMMENT 'department description',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation timestamp',
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update timestamp'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'departments in the company';

INSERT INTO `departments`
    (
        `id`,   `name`,
        `description`
    )
VALUES
    (
        1,      'legal department', 
        'Manage legal affairs, ensuring compliance, handling contracts, IP, litigation, and risk management to protect the company from legal risks.'
    ),
    (
        2,      'technical department',
        'Develops, implements, and maintains tech solutions, focusing on software, hardware, IT infrastructure, and cybersecurity.'
    ),
    (
        3,      'operations department',
        'Optimize daily processes, logistics, and resource management to ensure smooth business operations, efficiency, and quality.'
    ),
    (
        4,      'financial department',
        'Oversee budgeting, accounting, payroll, financial reporting, and ensures compliance with financial regulations to maintain the company'
    ),
    (
        5,      'marketing department',
        'Promote the company'
    ),
    (
        6,      'strategy & innovation department',
        'Define long-term strategy, explores new opportunities, and drives innovation through research, planning, and business development.'
    ),
    (
        7,      'human resources department',
        'Handle recruitment, training, performance, employee relations, and benefits to build a productive, aligned workforce.'
    ),
    (
        8,      'IT department',
        'Manage network, data security, software, and provides IT support to ensure smooth operation and efficient tools for employees.'
    ),
    (
        9,      'compliance & risk department',
        'Monitor adherence to laws and internal policies, conducts risk assessments, and develops strategies to minimize legal and financial risks.'
    );

-- +--------+
-- | teams  |
-- +--------+

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique team ID',
    `department_id` INT UNSIGNED NOT NULL COMMENT 'department of the team',
    `name` VARCHAR(100) NOT NULL UNIQUE COMMENT 'team name',
    `description` TEXT COMMENT 'team description',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation timestamp',
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update timestamp',

    CONSTRAINT `fk_teams_department`
        FOREIGN KEY(`department_id`)
        REFERENCES `departments`(`id`)
        ON DELETE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'teams within departments';

INSERT INTO `teams`
    (
        `id`,   `department_id`,    `name`,
        `description`
    )
VALUES
    (
        1,      1,                  'copyright team',
        'Protect the company'
    ),
    (
        2,      1,                  'litigation team',
        'Handle legal disputes and represents the company in court.'
    ),
    (
        3,      1,                  'compliance team',
        'Ensure company practices align with laws and regulations.'
    ),
    (
        4,      2,                  'backend development team',
        'Build and maintains server-side logic, APIs, and database systems.'
    ),
    (
        5,      2,                  'frontend development team',
        'Design and develops user interfaces for web and mobile platforms.'
    ),
    (
        6,      2,                  'data science team',
        'Analyze data to support decision-making and build intelligent systems.'
    ),
    (
        7,      2,                  'security team',
        'Protect systems from cyber threats and ensures data integrity.'
    ),
    (
        8,      3,                  'logistics team',
        'Manage supply chains, inventory, and product distribution.'
    ),
    (
        9,      3,                  'project management team',
        'Plan, execute, and monitor projects to ensure timely delivery.'
    ),
    (
        10,     4,                  'accounting team',
        'Manage financial records, reporting, and ensures compliance with standards.'
    ),
    (
        11,     4,                  'investment team',
        'Oversee company investments and develops financial growth strategies.'
    ),
    (
        12,     5,                  'advertisement team',
        'Design ad campaigns to boost brand awareness and product reach.'
    ),
    (
        13,     5,                  'market research team',
        'Study market trends and consumer needs to guide strategy.'
    ),
    (
        14,     5,                  'digital marketing team',
        'Promote the brand through digital platforms like social media and SEO.'
    ),
    (
        15,     6,                  'innovation team',
        'Explore new ideas and technologies to improve products or services.'
    ),
    (
        16,     6,                  'business development team',
        'Identify growth opportunities and builds strategic partnerships.'
    ),
    (
        17,     7,                  'recruitment team',
        'Attract, interview, and hire top talent for the organization.'
    ),
    (
        18,     7,                  'training team',
        'Develop programs to enhance employee skills and growth.'
    ),
    (
        19,     7,                  'employee relations team',
        'Manage workplace issues and fosters a positive culture.'
    ),
    (
        20,     8,                  'network infrastructure team',
        'Design and maintains network systems and hardware.'
    ),
    (
        21,     8,                  'software development team',
        'Build internal tools and systems to support operations.'
    ),
    (
        22,     8,                  'it support team',
        'Provide tech support and troubleshooting for all staff.'
    ),
    (
        23,     9,                  'risk management team',
        'Assess and mitigates business and operational risks.'
    ),
    (
        24,     9,                  'audit team',
        'Review internal processes to ensure accuracy and legal compliance.'
    );

-- +------------+
-- | file types |
-- +------------+

CREATE TABLE `file_types`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique file type ID',
    `abbreviation` VARCHAR(10) NOT NULL UNIQUE COMMENT 'file type short code',
    `name` VARCHAR(50) NOT NULL UNIQUE COMMENT 'file type name'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'supported upload and report file types';

INSERT INTO `file_types`
    (`id`,  `abbreviation`,    `name`                   )
VALUES
    (1,     'excel',           'Microsoft Excel'        ),
    (2,     'sheet',           'Google Sheet'           ),
    (3,     'md',              'Markdown'               ),
    (4,     'latex',           'LaTeX'                  ),
    (5,     'csv',             'Comma Separated values' ),
    (6,     'tsv',             'Tab Separated Values'   );

-- +------------+
-- | log tables |
-- +------------+

-- +--------+
-- | users  |
-- +--------+

CREATE TABLE `users`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique user ID',
    `username` VARCHAR(50) NOT NULL UNIQUE COMMENT 'unique username',
    `password` VARCHAR(255) NOT NULL COMMENT '2B BCrypt with cost of 12 password',
    `first_name` VARCHAR(50) NOT NULL COMMENT 'user first name',
    `last_name` VARCHAR(50) NOT NULL COMMENT 'user last name',
    `gender_id` INT UNSIGNED DEFAULT NULL COMMENT 'gender ID defined in genders table',
    `email` VARCHAR(100) UNIQUE COMMENT 'user email',
    `phone` VARCHAR(100) UNIQUE COMMENT 'user phone number',
    `diploma_id` INT UNSIGNED DEFAULT NULL COMMENT 'diploma ID defined in diplomas table',
    `department_id` INT UNSIGNED DEFAULT NULL COMMENT 'department ID defined in departments table',
    `team_id` INT UNSIGNED DEFAULT NULL COMMENT 'team ID defined in teams table',
    `role_id` INT UNSIGNED NOT NULL COMMENT 'role ID defined in roles table',
    `hire_date` DATE DEFAULT NULL COMMENT 'user hired date',
    `salary` DECIMAL(12,2) NOT NULL DEFAULT 0.00 COMMENT 'user salary',
    `currency_id` INT UNSIGNED NOT NULL DEFAULT 141 COMMENT 'display currency ID defined in currencies table, default is USD',
    `first_language_id` INT UNSIGNED NOT NULL DEFAULT 16 COMMENT 'user''s first language defined in languages table, default is en_US',
    `second_language_id` INT UNSIGNED DEFAULT NULL COMMENT 'user''s second language defined in languages table, default is NULL',
    `third_language_id` INT UNSIGNED DEFAULT NULL COMMENT 'user''s third language defined in languages table, default is NULL',
    `first_nationality_id` INT UNSIGNED NOT NULL DEFAULT 235 COMMENT 'user''s first nationality id defined in nationalities table, default is USA',
    `second_nationality_id` INT UNSIGNED DEFAULT NULL COMMENT 'user''s second nationality id defined in nationalities table, default is NULL',
    `status` BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'account status, enable/disable',
    `icon` VARCHAR(255) DEFAULT NULL COMMENT 'user icon URL/path',
    `description` TEXT DEFAULT NULL COMMENT 'user additional description',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation timestamp',
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update timestamp',

    CONSTRAINT `fk_users_gender`
        FOREIGN KEY(`gender_id`)
        REFERENCES `genders`(`id`)
        ON DELETE SET NULL,
    CONSTRAINT `fk_users_diploma`
        FOREIGN KEY(`diploma_id`)
        REFERENCES `diplomas`(`id`)
        ON DELETE SET NULL,
    CONSTRAINT `fk_users_department`
        FOREIGN KEY(`department_id`)
        REFERENCES `departments`(`id`)
        ON DELETE SET NULL,
    CONSTRAINT `fk_users_team`
        FOREIGN KEY(`team_id`)
        REFERENCES `teams`(`id`)
        ON DELETE SET NULL,
    CONSTRAINT `fk_users_role`
        FOREIGN KEY(`role_id`)
        REFERENCES `roles`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_users_currency`
        FOREIGN KEY(`currency_id`)
        REFERENCES `currencies`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_users_first_language`
        FOREIGN KEY(`first_language_id`)
        REFERENCES `languages`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_users_second_language`
        FOREIGN KEY(`second_language_id`)
        REFERENCES `languages`(`id`)
        ON DELETE SET NULL,
    CONSTRAINT `fk_users_third_language`
        FOREIGN KEY(`third_language_id`)
        REFERENCES `languages`(`id`)
        ON DELETE SET NULL,
    CONSTRAINT `fk_users_first_nationality`
        FOREIGN KEY(`first_nationality_id`)
        REFERENCES `nationalities`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_users_second_nationality`
        FOREIGN KEY(`second_nationality_id`)
        REFERENCES `nationalities`(`id`)
        ON DELETE SET NULL
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'company employees';

INSERT INTO `users`
(
    `id`,   `username`,
    `password`,
    `first_name`,   `last_name`,    `gender_id`,    `email`,
    `phone`,        `diploma_id`,   `department_id`,    `team_id`,  `role_id`,
    `hire_date`,    `salary`,   `currency_id`,  `first_language_id`,
    `second_language_id`,   `third_language_id`,    `first_nationality_id`,
    `second_nationality_id`,    `status`
)
VALUES
(
    1,      'chairperson_caesar',
    '$2b$12$rH9e.zA8OSgih7v4QreUrOHJtNBkfjyQN1DrnzOR9qJlP1VyKSARS',
    'Caesar',       'Lee',          2,              'ceasar_cofounder@cjl.com',
    '12345678900',  34,             NULL,               NULL,       1,
    '2025-01-01',   300000.00,  148,            51,
    16,                     NULL,                   227,
    233,                        TRUE
),
(
    2,      'director_alice',
    '$2b$12$4MuHfjzYWSesQEHPXVwHv.NWtBWGf5BkLqfB34hj4oJDtaYATyL/q',
    'Alice',        'Jackson',      4,              'alice_cofounder@cjl.com',
    '12345678901',  34,             NULL,               NULL,       2,
    '2025-01-01',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    3,      'director_john',
    '$2b$12$5zQPjFSSGJvnl1RLl0GLGeEKL3RYy4D4Nlbtt.fkSxm0SEsdKeUyi',
    'John',         'Lawrence',     1,              'john_investor@cjl.com',
    '525512345678', 18,             NULL,               NULL,       2,
    '2025-01-01',   300000.00,  94,             22,
    16,                     NULL,                   141,
    235,                        TRUE
),
(
    4,      'ceo_caesar',
    '$2b$12$cOaJkI.UtH6c8JGdGQjbaO3tbE7l0PeRYxGzjyAprQkoVyvcAJTv2',
    'Caesar',       'Lee',          2,              'ceasar_ceo@cjl.com',
    '886912345678', 34,             NULL,               NULL,       3,
    '2025-01-01',   300000.00,  138,            51,
    16,                     NULL,                   229,
    233,                        TRUE
),
(
    5,      'fox_lawyer',
    '$2b$12$W7Ovvzni.3022oRiJmJE8OXyetRY1j.ee9r9ZVTKW4qePWVL3NTzW',
    'Steve',        'Washington',   10,             'fox_lawyer@cjl.com',
    '12345678902',  2,              1,                  NULL,       4,
    '2025-01-02',   200000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    6,      'frank_smith_legal_copyright_manager',
    '$2b$12$PQCemJZSk837oN3zDlvCBeLKMcYF832ywqQ0gq5s82DoHBqCxPizG',
    'Frank',        'Smith',        9,              'frank_smith_legal_copyright_manager@cjl.com',
    '12345678903',  2,              1,                  1,          4,
    '2025-01-02',   150000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    7,      'frank_smith_loves_steam',
    '$2b$12$0HiSDI1KM1ZEkmmSo2Gox.FHu9aZZvtWgzusG6ySD4SXeQr73GteK',
    'Frank',        'Smith',        15,             'frank_smith_lawyer@cjl.com',
    '12345678904',  2,              1,                  1,          12,
    '2025-01-03',   150000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    8,      'uzumaki_naruto_ninja',
    '$2b$12$D/TDCEgDt6xefjumLz2Iou7jqcHn6z7XS6rRIM63I.yBm7p.B8eqq',
    'Naruto',       'Uzumaki',      12,             'naruto_ninja@cjl.com',
    '81312345678',  2,              1,                  1,          12,
    '2025-01-02',   100000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    9,      'jessica_bp',
    '$2b$12$mLfj06n.oEmLba9bvYD/PemnTx18XCUy/yIzu7a5FZpPymTqCmsym',
    'Jessica',      'Lee',          4,              'jessica_blackpink@cjl.com',
    '12345678905',  2,              1,                  2,          4,
    '2025-01-02',   120000.00,  142,            16,
    34,                     NULL,                   233,
    NULL,                       TRUE
),
(
    10,     'clark_sm',
    '$2b$12$8XxQumDVN9zoj9InQJLKoeJ//NJ5tMdCpk0XGBsXQTYehlMk1LBym',
    'Clark',        'Smith',        1,              'clark_on_planet_krypton@cjl.com',
    '12345678906',  2,              1,                  2,          12,
    '2025-01-02',   100000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    11,     'bernard',
    '$2b$12$QlbQiE/cRBzsV0S6sPEIb.apRpDp6wtyYjsptXwDFFWrAz9089vUu',
    'James',        'Bernard',      1,              'marvel_worser_2018@cjl.com',
    '12345678907',  2,              1,                  2,          12,
    '2025-01-03',   120000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       FALSE
),
(
    12,     'jennie',
    '$2b$12$GE6DAJ1tpqQIrsBRwOfDl.AIjtbGCAz7wnyYVuVJIUOCNysIYveaG',
    'Jennie',       'Li',           4,              'jennie_dislike_jennie@cjl.com',
    '12345678908',  2,              1,                  3,          4,
    '2025-01-03',   150000.00,  142,            16,
    51,                     34,                     233,
    121,                        TRUE
),
(
    13,     'lily_neverland',
    '$2b$12$enPXm6/0OLD2ZkP6.yU3zuLRAsM05crQcL6FTNjm5VlUUUakWGh.S',
    'Lily',         'Park',         4,              'lily_neverland@cjl.com',
    '12345678909',  2,              1,                  3,          4,
    '2025-01-03',   150000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    14,     'la_lisa',
    '$2b$12$yBFJwiv7SHNyGh1qgL5yZ.efPaXKmHVd2unmLPBsjQ38NCn2aRwIq',
    'Lisa',         'Jackson',      11,             'la_lisa@cjl.com',
    '12345678910',  2,              1,                  3,          4,
    '2025-01-03',   120000.00,  142,            16,
    34,                     NULL,                   233,
    NULL,                       TRUE
),
(
    15,     'cto_caesar',
    '$2b$12$RXUS1sGFKxiDWQo6LTiPe.yzdMWz3mE32L2H66iY0Vqgq6mxDBU7m',
    'Caesar',       'Lee',          2,              'caesar_cto@cjl.com',
    '12345678911',  34,             2,                  NULL,       5,
    '2025-01-01',   300000.00,  138,            51,
    16,                     NULL,                   227,
    233,                        TRUE
),
(
    16,     'peter_park_spiderman',
    '$2b$12$jiIit1sxiyWsKp1heLaV.ef0Pfxw57MAAe9zI2eRPGm.Nxi8sEvHi',
    'Peter',        'Park',         1,              'pp_sm@cjl.com',
    '12345678912',  2,              2,                  4,          4,
    '2025-01-03',   200000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    17,     'harry_potter',
    '$2b$12$YKpHRX.rwjWJRoj9TIRQ9uVnFh72NcPmiRvdh1OKhYofriZBS/dRa',
    'Harry',        'Potter',       1,              'happy_hppw@cjl.com',
    '12345678913',  7,              2,                  4,          12,
    '2025-01-03',   200000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    18,     'elon_musk',
    '$2b$12$Qvw1NHhtCX.8xCYaiMdcle4ikQW/0QEYkHITcIzfHJFveJChz9AZO',
    'Elon',         'Musk',         1,              'the_hitchhiker_s_guide_to_the_galaxy@cjl.com',
    '12345678914',  34,             2,                  4,          12,
    '2025-01-03',   300000.00,  142,            17,
    16,                     NULL,                   245,
    233,                        FALSE
),
(
    19,     'mark_zuckerberg',
    '$2b$12$C/lSMFWUqjY0976cX1QxA.MO07gM4fS2pYWxDOkZiWGIx5RIshI3K',
    'Mark',         'Zuckerberg',   1,              'mark_zuck@cjl.com',
    '12345678915',  34,             2,                  5,          4,
    '2025-01-03',   300000.00,  142,            16,
    49,                     NULL,                   233,
    NULL,                       FALSE
),
(
    20,     'jeff',
    '$2b$12$EQYuoY8i/7fghcSstsbCo.0qIfHDvbLNHGXTTvTmsZ/uLwt3u1qEK',
    'Jeff',         'Bozes',        1,              'jeff_blue_origin@cjl.com',
    '12345678916',  7,              2,                  5,          4,
    '2025-01-03',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       FALSE
),
(
    21,     'spongebob',
    '$2b$12$/P5ixX4p3fH6oesB6giDu.SJSs2erYYq8ElxkHq/wesSCKwfqvK06',
    'Spongebob',    'Brown',        14,             'spongebob@cjl.com',
    '12345678917',  7,              2,                  5,          4,
    '2025-01-03',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    22,     'autobot_optimus_prime',
    '$2b$12$zhk3ybxteG2LcfLH2XdwZejU5cLpTTp/xCBXEsp/pMwyGYfLNoaca',
    'Optimus',      'Prime',        14,             'autobot_optimus_prime@cjl.com',
    '12345678918',  17,             2,                  6,          4,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       FALSE
),
(
    23,     'autobot_bumblebee',
    '$2b$12$C.ByZmrL.1MayU5gnraTUODWNsIyV1hr/YSuhSUxkwhFTPAOtFL5G',
    'Bumblebee',    'Jones',        14,             'autobot_bumblebee@cjl.com',
    '12345678919',  8,              2,                  6,          4,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    24,     'autobot_ratchet',
    '$2b$12$KQuY1Fv7UrXYqgwrEIrhVOiMoE0n1C/ZtL.joXMcvy3Cofu3GqbsO',
    'Ratchet',      'Miller',       14,             'autobot_ratchet@cjl.com',
    '12345678920',  7,              2,                  6,          12,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    25,     'deception_megatron',
    '$2b$12$bEzpxRNzCCug0p9by6t.VuZNEG8IczDBK7pUjZYuCljX5rsuqDWjW',
    'Megatron',     'Martinez',     14,             'deception_megatron@cjl.com',
    '12345678921',  17,             2,                  7,          4,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    26,     'deception_starscream',
    '$2b$12$PmaIjp16SUlr.21ugVK.neAQhnfN/jnsJmgYQdL4kgdhlrv5vUL2O',
    'Starscream',   'Starscream',   14,             'deception_anderson@cjl.com',
    '12345678922',  8,              2,                  7,          12,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    27,     'deception_shockwave',
    '$2b$12$JFlYOizqyK0AMkmJMXKCiOpNeCIkpsU2TeCK3fVMHDEXQvPZQLw4C',
    'Shockwave',    'Moore',        14,             'deception_shockwave@cjl.com',
    '12345678923',  8,              2,                  7,          12,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       FALSE
),
(
    28,     'x_men_professor_x_coo',
    '$2b$12$sL7hSJB7TTM51jkVbFEpUuMG13C3W22Ds8eH4vEacAsJmovwP6vEu',
    'Charles',      'Xavier',       1,              'charlesxavier@cjl.com',
    '12345678924',  18,             3,                  NULL,       6,
    '2025-01-04',   200000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    29,     'professor_x_manager',
    '$2b$12$N5ew.Yyo4Gpw7hsRsCslKuHc3pk369PF01SmoAwvaSjPL7AmVXRme',
    'Charles',      'Xavier',       1,              'professorx@cjl.com',
    '4915112345678',18,             3,                  8,          4,
    '2025-01-04',   200000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    30,     'mystique',
    '$2b$12$skiqizoOc3Frh/cbcy2ybOEyKRG1kTOrLMfVN6fKCZLmKc5/z//VS',
    'Raven',        'Darkhölme',    3,              'mystique@cjl.com',
    '12345678925',  1,              3,                  8,          12,
    '2025-01-04',   200000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    31,     'wolverine',
    '$2b$12$88U68dszOcF31SHPKWh6yOCVu1/DP4a4KR69WjVjxqLklR3eedhke',
    'James',        'Howlett',      1,              'wolverine@cjl.com',
    '12345678926',  16,             3,                  8,          12,
    '2025-01-04',   200000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    32,     'phoenix',
    '$2b$12$4DQjsUV25xHZtubHM0n9UuWF1pMV7vuxgyV3pryddVkyaYZPr40By',
    'Jean',         'Grey',         4,              'phoenix@cjl.com',
    '12345678927',  8,              3,                  9,          4,
    '2025-01-04',   200000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    33,     'beast',
    '$2b$12$/FCCfP6nNOMB/E1TqqC/MO.u/BsOEa4X8JmwscdLtWJTKOZPAHj6S',
    'Henry',        'McCoy',        1,              'beast@cjl.com',
    '12345678928',  8,              3,                  9,          12,
    '2025-01-04',   200000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    34,     'magneto',
    '$2b$12$.W6jSVcW/ARvhiiK5xe//ecYRCSkqY4paxVMPKwdsKz5IeznKI7Ma',
    'Max',          'Eisenhardt',   1,              'magneto@cjl.com',
    '12345678929',  8,              3,                  9,          12,
    '2025-01-04',   200000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    35,     'alice_cfo',
    '$2b$12$rstVqLCdNFPus8WmJj3A1uy/pxtqzu/4Gjv3oxieQ.EjcHdxTfLUS',
    'Alice',        'Jackson',      4,              'alice_cfo@cjl.com',
    '12345678930',  34,             4,                  NULL,       7,
    '2025-01-04',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       FALSE
),
(
    36,     'captain_america',
    '$2b$12$DmQOzmjRhno3ZAprWK5yZerxI4hQOO974nRpsrhc0ySc.Wv4Y4IVi',
    'Steve',        'Rogers',       1,              'captain_america@cjl.com',
    '12345678931',  2,              4,                  10,         12,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    37,     'iron_man',
    '$2b$12$BGegCT6ysZYs2c4aH.xyEeSeM2c9H9esxsMsd8Qh.Jeb4Vk883GwC',
    'Tony',         'Stack',        1,              'iron_man@cjl.com',
    '12345678932',  17,             4,                  10,         12,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    38,     'thor',
    '$2b$12$w6Tzk5.CpXA959WTQGJRnuoomI1rbbR61I7.7gs4527vkOVf8dLra',
    'Thor',         'Thor',         1,              'thor@cjl.com',
    '12345678933',  1,              4,                  10,         12,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    39,     'black_widow',
    '$2b$12$H6ffT4i/kwZEO3SOKajfFeW4fK6C4FpxrxbilZ.luGv0M2GM1Oodm',
    'Natasha',      'Romanoff',     4,              'black_widow@cjl.com',
    '12345678934',  1,              4,                  10,         12,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    40,     'yelena_belova',
    '$2b$12$M3/nwYA5lVjbuOcNNDW9COqzFh1glUyWgPLxbbdRk4w3rtC871j0y',
    'Yelena',       'Belova',       4,              'yelena_belova@cjl.com',
    '12345678935',  1,              4,                  11,         12,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    41,     'bucky_barnes',
    '$2b$12$JxXVlyYMKOM3NHlR7EOIWOrBHdfuTgOq372nVc6FH8xg3QVuR5ld6',
    'Bucky',        'Barnes',       1,              'bucky_barnes@cjl.com',
    '12345678936',  7,              4,                  11,         12,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    42,     'hulk',
    '$2b$12$.icyPyFDdjhiDNMqhsaHquoBCbKUFd9BO6tfS/uxflEWGqWAAo80S',
    'Bruce',        'Banner',       15,             'bruce_banner@cjl.com',
    '12345678937',  34,             4,                  11,         12,
    '2025-01-04',   250000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    43,     'wanda_maximoff',
    '$2b$12$djxysZ5Dj96xQIklP0.ccOO5rT3nKawTESMY9OrU02K9CPt73wYie',
    'Wanda',        'Maximoff',     4,              'wanda_maximoff@cjl.com',
    '12345678938',  8,              5,                  NULL,       8,
    '2025-01-04',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    44,     'vision',
    '$2b$12$yvLfx/7nAkIkYOAnqQiE5O8WpOHYH77oHLd/.f8CFnu1n7USK8/1q',
    'Vision',       'Vision',       11,             'vision@cjl.com',
    '12345678939',  7,              5,                  12,         8,
    '2025-01-04',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    45,     'falcon',
    '$2b$12$ZAtvCEnVNZIuN/6J9zlg4OcjFW0bU6wBkZgntJym7q1R9s.HNUjXq',
    'Sam',          'Wilson',       1,              'falcon@cjl.com',
    '12345678940',  9,              5,                  12,         12,
    '2025-01-04',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    46,     'spider_man',
    '$2b$12$FlqdmEz5fFhBK4jRYedpKuYVEaqnON9IT4hGkOmpGQmdBZUYuLqlG',
    'Peter',        'Parker',       1,              'spider_man@cjl.com',
    '12345678941',  2,              5,                  12,         12,
    '2025-01-04',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    47,     'black_panther',
    '$2b$12$WW/EhXPVQf2deDwdOKemfudJFBaecc21rS2Yq4K9TnnXn/rv5QVYu',
    'T''Challa',    'T''Challa',    1,              'black_panther@cjl.com',
    '12345678942',  7,              5,                  13,         8,
    '2025-01-04',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    48,     'groot',
    '$2b$12$bHKL1aRBaqiCcekOEvVJbuccgsMJbgdscYYCbRpzeKmZWumRHEGwS',
    'Groot',        'Groot',        11,             'i_am_groot@cjl.com',
    '12345678943',  2,              5,                  13,         12,
    '2025-01-04',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    49,     'rocket',
    '$2b$12$XyqascqmOton9w2pFIjFi.ZXlLUwvLGM1E4JyP1KMCoica7WeGism',
    'Rocket',       'Rocket',       14,             'rocket@cjl.com',
    '12345678944',  2,              5,                  13,         12,
    '2025-01-04',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    50,     'gamora',
    '$2b$12$bdUQOSyLx0mY2KKKAoi8jek.3Wju5STQaPGldcL8cfEaOZQT4nfaa',
    'Gamora',       'Gamora',       4,              'gamora@cjl.com',
    '12345678945',  7,              5,                  14,         8,
    '2025-01-04',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    51,     'star_lord',
    '$2b$12$f1DcZutEQgIWKEjXSIF0SeASLVx9tQ/EeR2m8T4pBG4ZZchj45EOq',
    'Peter',        'Quill',        1,              'star_lord@cjl.com',
    '12345678946',  7,              5,                  14,         12,
    '2025-01-04',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    52,     'thanos',
    '$2b$12$QGWvkxBywUeODe3tApL9GeqNr2Z.Qdq1Y9naJwJmHPsEHW66lOjEO',
    'Thanos',       'Thanos',       1,              'thanos@cjl.com',
    '12345678947',  7,              5,                  14,         12,
    '2025-01-04',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    53,     'eren_yeager',
    '$2b$12$tvd93mqLhAbYl6c20VxtIOGNjjSQYrq/S8MdfEIVCsyNaKimReBDO',
    'Eren',         'Yeager',       1,              'eren_yeager@cjl.com',
    '12345678948',  7,              6,                  NULL,       9,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    54,     'mikasa_ackerman',
    '$2b$12$cFrajuXW1DFcZrfKx/K3yOczl/cPgN5cxzKqrJ3MeArJAOwNawJZ6',
    'Mikasa',       'Ackerman',     4,              'mikasa_ackerman@cjl.com',
    '12345678949',  7,              6,                  15,         9,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    55,     'armin_arlert',
    '$2b$12$8vnkqZS460GDsOlW0IGy.eJrXZsZVNGRR2Hiu5l3AQEjSssInRhNq',
    'Armin',        'Arlert',       1,              'armin_arlert@cjl.com',
    '12345678950',  7,              6,                  15,         9,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    56,     'reiner_braun',
    '$2b$12$4z7IAroEZe8EMXVVF2nJR.9lFFWtAXIfQ60nTmD3ysHEc8r8Au.AC',
    'Reiner',       'Braun',        1,              'reiner_braun@cjl.com',
    '12345678951',  7,              6,                  16,         9,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    57,     'berthold_hoover',
    '$2b$12$iF9nkzYAlrn0Fk3YEojnA.aCkcYY/r7l4iTCJ8b7MN3h33oU8pVGW',
    'Bertholdt',    'Hoover',       1,              'berthold_hoover@cjl.com',
    '12345678952',  7,              6,                  16,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    58,     'annie_leonhart',
    '$2b$12$mHmJR4oBHp9nc8dH3PGFkOvsjvtJW/1wAXazedkRLdRQHIw7BxTTq',
    'Annie',        'Leonhart',     4,              'annie_leonhart@cjl.com',
    '12345678953',  7,              6,                  16,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    59,     'connie_springer',
    '$2b$12$YpyA7pzsySdTvXbB41ISWea2R6dRIt93685P9BVhad4cKKPQ4C7Am',
    'Connie',       'Springer',     1,              'connie_springer@cjl.com',
    '12345678954',  16,             6,                  16,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    60,     'sasha_blouse',
    '$2b$12$TQahxBJVM0kxukjn/JJpDOZa3tTWwjD9.iWuDp2jX37C7vS1il9Zm',
    'Sasha',        'Blouse',       4,              'sasha_blouse@cjl.com',
    '12345678955',  7,              7,                  NULL,       10,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    61,     'historia_reiss',
    '$2b$12$s2liH34KmvxaSWK3czu35.anBqGF3/.N2y4Amn9pdDh5cTFJP0Rdq',
    'Historia',     'Reiss',        4,              'historia_reiss@cjl.com',
    '12345678956',  7,              7,                  17,         10,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    62,     'christa_lenz',
    '$2b$12$gtT4RoAUTpFxbFDfpKcgeekRFifNvHIxInD9klvLT4fhJrl0h75U2',
    'Christa',      'Lenz',         4,              'christa_lenz@cjl.com',
    '12345678957',  7,              7,                  17,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    63,     'ymir',
    '$2b$12$seYW7zIf6LzLMpkpipRuoe3erlh0gwYNCt9FpVSQ9psnRTYtSqo0K',
    'Ymir',         'Ymir',         4,              'ymir@cjl.com',
    '12345678958',  7,              7,                  17,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    64,     'floch_forster',
    '$2b$12$hSh1TxbH4IEco5fqpIfEgOguEzlgV5nSv5S4XCmc9ZhRprZtOTyvK',
    'Floch',        'Forster',      1,              'floch_forster@cjl.com',
    '12345678959',  7,              7,                  18,         10,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    65,     'erwin_smith',
    '$2b$12$RnClpE1SecGPpL2YJDXNp.DANFAo9GC8BJl.9Ru3hpwbLpIDpliE6',
    'Erwin',        'Smith',        1,              'erwin_smith@cjl.com',
    '12345678960',  7,              7,                  18,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    66,     'levi_ackerman',
    '$2b$12$GkaAdrtAx3iZVnv8quCZVOm9HP88GH9sPY9SMmoWGtxNtx696zgyW',
    'Levi',         'Ackerman',     1,              'levi_ackerman@cjl.com',
    '12345678961',  7,              7,                  18,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    67,     'hange_zoe',
    '$2b$12$2xNALeW4zlfOsWJm8XVr4eIwJn7ZKsttY9oiaZRctsPkWIlqXu09m',
    'Hange',        'Zoe',          11,             'hange_zoe@cjl.com',
    '12345678962',  7,              7,                  19,         10,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    68,     'marlo_fredenburg',
    '$2b$12$8BbdwiVNiOR/5iEB/9VLi.aOZ.cPVzmzRf.641SPJ98GER.XpedO.',
    'Marlo',        'Fredenburg',   1,              'marlo_fredenburg@cjl.com',
    '12345678963',  7,              7,                  19,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    69,     'hitch_dreyse',
    '$2b$12$q0XGYaR4EzFxiZfVIGnSR.QKUNltsgs4OyyvgxkSMRHAcXLcGsVu2',
    'Hitch',        'Dreyse',       1,              'hitch_dreyse@cjl.com',
    '12345678964',  7,              7,                  19,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    70,     'ymir_fritz',
    '$2b$12$Y5pmyXuClJAsU32X4k8S7.ZM73K1.VhyvY1m7nWuc4IWUSW0yEDYG',
    'Ymir',         'Fritz',        11,             'ymir_fritz@cjl.com',
    '12345678965',  2,              8,                  NULL,       11,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    71,     'maria_fritz',
    '$2b$12$kpjmFJnuN4xXGibmJBLAPuJBlOxZpg2TStAythCI1pxWsF7wyQ7f.',
    'Maria',        'Fritz',        11,             'maria_fritz@cjl.com',
    '12345678966',  2,              8,                  20,         11,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    72,     'rose_fritz',
    '$2b$12$0yD4dgYep9U8SokGElPUx.7EGYrj2ozrmpQI.8bcrlwxxB3/ziDiq',
    'Rose',         'Fritz',        11,             'rose_fritz@cjl.com',
    '12345678967',  2,              8,                  20,         11,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    73,     'sina_fritz',
    '$2b$12$6.wsks4VCm/MiGrwtMhKqunvid7r97UsojXIoGTcMiFneYq0lLHGy',
    'Sina',         'Fritz',        11,             'sina_fritz@cjl.com',
    '12345678968',  2,              8,                  20,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    74,     'grisha_yeager',
    '$2b$12$RDOtgJkTsO2K7F.EQbOOOumP6Oyu8agCFMBdsrVtkjzIf0duQmjjO',
    'Grisha',       'Yeager',       1,              'grisha_yeager@cjl.com',
    '12345678969',  2,              8,                  21,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    75,     'carla_yeager',
    '$2b$12$IWPCYgfbc1KapNhbjhxshu2qWcgf4PuAneYVZoqGGc6oxVTEZq7Rq',
    'Carla',        'Yeager',       11,             'carla_yeager@cjl.com',
    '12345678970',  2,              8,                  21,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    76,     'zeka_yeager',
    '$2b$12$N36Da0ZZah3y9lR6XbCCJOzFVe9oLh/.iaKshCP76gkxvFFRinch2',
    'Zeka',         'Yeager',       1,              'zeka_yeager@cjl.com',
    '12345678971',  7,              8,                  21,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    77,     'pieck_finger',
    '$2b$12$xIPB3YMuXOTM/xyUlZlmCuguM4MA4uzqKduRkLWNGHFyymNJUP7zS',
    'Pieck',        'Finger',       4,              'pieck_finger@cjl.com',
    '12345678972',  7,              8,                  22,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    78,     'gabi_braun',
    '$2b$12$oQ.Epx0NPCx78Oisz0J1aeIH1ItgsDF9BlQl1XTnvGwteDlenHK0.',
    'Gabi',         'Braun',        4,              'gabi_braun@cjl.com',
    '12345678973',  7,              8,                  22,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    79,     'falco_grice',
    '$2b$12$JQ80rdF0pkgxGNa1B4zEs.rCQu.RBCXFqo3/TIKoNsF6YHtuMk1yK',
    'Falco',        'Grice',        1,              'falco_grice@cjl.com',
    '12345678974',  7,              8,                  22,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    80,     'yelena_aot',
    '$2b$12$3hCFM3B3PESvFz4bB9tfeOzh4dpLCtGtuIFkenLo2yNskbApMQRw2',
    'Yelena',       'Yelena',       4,              'yelena_aot@cjl.com',
    '12345678975',  7,              9,                  NULL,       12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    81,     'onyankopon',
    '$2b$12$DkKMwp8gH5iW/QhkY.5h5.MiMycLrWD1JXnhNU6kB9stGDQh7Zzam',
    'Onyankopon',   'Onyankopon',   1,              'onyankopon@cjl.com',
    '12345678976',  7,              9,                  23,         12,
    '2025-01-05',   300000.00,  67,             33,
    16,                     NULL,                   114,
    NULL,                       TRUE
),
(
    82,     'jessica_jones',
    '$2b$12$E9P.MMCVc7b8SiXgsGt6sO2x.N.hUNjGpVrPdlTiqbgJ2//WVWpLG',
    'Jessica',      'Jones',        4,              'jessica_jones@cjl.com',
    '12345678977',  7,              9,                  23,         12,
    '2025-01-05',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    83,     'luke_cage',
    '$2b$12$vfpyLsZ6HYLp.fLU08nCW.gEphmooo1G5Ince9dVIGMD.KdoVRECy',
    'Luke',         'Cage',         1,              'luke_cage@cjl.com',
    '12345678978',  7,              9,                  23,         12,
    '2025-01-05',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    84,     'patricia_walker',
    '$2b$12$zutR4zvqXUAufL2CFfrw0eOLyawT3Q1p3DEFjrNb6M1Xv5UGaytt.',
    'Patricia',     'Walker',       4,              'patricia_walker@cjl.com',
    '12345678979',  7,              9,                  24,         12,
    '2025-01-05',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    85,     'daredevil',
    '$2b$12$r3eDonEmKdx7oPIy7QBeJ.hdKB/2xQvCZpTyaSQF8Q/thMWEJlFdq',
    'Matt',         'Murdock',      1,              'daredevil@cjl.com',
    '12345678980',  2,              9,                  24,         12,
    '2025-01-05',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
),
(
    86,     'iron_fist',
    '$2b$12$lzOdeIzrsaKt1xI9u7/jMOZF95u1D5NVrTEo/NrVos6T2jpYzbsiu',
    'Danny',        'Rand',         1,              'iron_fist@cjl.com',
    '12345678981',  7,              9,                  24,         12,
    '2025-01-05',   300000.00,  142,            16,
    NULL,                   NULL,                   233,
    NULL,                       TRUE
);

-- add officer_id for departments

ALTER TABLE `departments`
    ADD COLUMN `officer_id` BIGINT UNSIGNED COMMENT 'officer of the department',
    ADD CONSTRAINT `fk_departments_officer`
        FOREIGN KEY(`officer_id`)
        REFERENCES `users`(`id`)
        ON DELETE CASCADE;
UPDATE `departments` SET `officer_id` = 5 WHERE `id` = 1;
UPDATE `departments` SET `officer_id` = 15 WHERE `id` = 2;
UPDATE `departments` SET `officer_id` = 28 WHERE `id` = 3;
UPDATE `departments` SET `officer_id` = 36 WHERE `id` = 4;
UPDATE `departments` SET `officer_id` = 43 WHERE `id` = 5;
UPDATE `departments` SET `officer_id` = 53 WHERE `id` = 6;
UPDATE `departments` SET `officer_id` = 59 WHERE `id` = 7;
UPDATE `departments` SET `officer_id` = 69 WHERE `id` = 8;
UPDATE `departments` SET `officer_id` = 79 WHERE `id` = 9;

-- add manager_id for teams

ALTER TABLE `teams`
    ADD COLUMN `manager_id` BIGINT UNSIGNED COMMENT 'manager of the team',
    ADD CONSTRAINT `fk_teams_manager`
        FOREIGN KEY(`manager_id`)
        REFERENCES `users`(`id`)
        ON DELETE CASCADE;
UPDATE `teams` SET `manager_id` = 6 WHERE `id` = 1;
UPDATE `teams` SET `manager_id` = 9 WHERE `id` = 2;
UPDATE `teams` SET `manager_id` = 12 WHERE `id` = 3;
UPDATE `teams` SET `manager_id` = 16 WHERE `id` = 4;
UPDATE `teams` SET `manager_id` = 21 WHERE `id` = 5;
UPDATE `teams` SET `manager_id` = 23 WHERE `id` = 6;
UPDATE `teams` SET `manager_id` = 25 WHERE `id` = 7;
UPDATE `teams` SET `manager_id` = 29 WHERE `id` = 8;
UPDATE `teams` SET `manager_id` = 32 WHERE `id` = 9;
UPDATE `teams` SET `manager_id` = 37 WHERE `id` = 10;
UPDATE `teams` SET `manager_id` = 40 WHERE `id` = 11;
UPDATE `teams` SET `manager_id` = 44 WHERE `id` = 12;
UPDATE `teams` SET `manager_id` = 47 WHERE `id` = 13;
UPDATE `teams` SET `manager_id` = 50 WHERE `id` = 14;
UPDATE `teams` SET `manager_id` = 54 WHERE `id` = 15;
UPDATE `teams` SET `manager_id` = 57 WHERE `id` = 16;
UPDATE `teams` SET `manager_id` = 61 WHERE `id` = 17;
UPDATE `teams` SET `manager_id` = 64 WHERE `id` = 18;
UPDATE `teams` SET `manager_id` = 67 WHERE `id` = 19;
UPDATE `teams` SET `manager_id` = 71 WHERE `id` = 20;
UPDATE `teams` SET `manager_id` = 74 WHERE `id` = 21;
UPDATE `teams` SET `manager_id` = 77 WHERE `id` = 22;
UPDATE `teams` SET `manager_id` = 81 WHERE `id` = 23;
UPDATE `teams` SET `manager_id` = 84 WHERE `id` = 24;

-- +------------+
-- | requests   |
-- +------------+

CREATE TABLE `requests`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique request ID',
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user making the request',
    `type_id` INT UNSIGNED NOT NULL COMMENT 'type of request',
    `details` TEXT DEFAULT NULL COMMENT 'additional details of the request',
    `status` INT UNSIGNED NOT NULL DEFAULT 1 COMMENT 'request status, default is pending',
    `handler_id` BIGINT UNSIGNED NOT NULL COMMENT 'user handling the request',
    `handle_details` TEXT DEFAULT NULL COMMENT 'details about handling',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'request creation time',
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',

    CONSTRAINT `fk_requests_user`
        FOREIGN KEY (`user_id`)
        REFERENCES `users`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_requests_type`
        FOREIGN KEY (`type_id`)
        REFERENCES `request_types`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_requests_status`
        FOREIGN KEY (`status`)
        REFERENCES `request_status`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_requests_handler`
        FOREIGN KEY (`handler_id`)
        REFERENCES `users`(`id`)
        ON DELETE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'user requests for changes and actions';

-- +------------+
-- | messages   |
-- +------------+

CREATE TABLE `messages`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique message ID',
    `sender_id` BIGINT UNSIGNED NOT NULL COMMENT 'user who sends the message',
    `receiver_id` BIGINT UNSIGNED NOT NULL COMMENT 'user who receives the message',
    `title` VARCHAR(50) NOT NULL COMMENT 'message title',
    `content` TEXT DEFAULT NULL COMMENT 'message content',
    `is_read` BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'read status',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'message creation time',
    `read_at` TIMESTAMP DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'message read time',

    CONSTRAINT `fk_messages_sender`
        FOREIGN KEY(`sender_id`)
        REFERENCES `users`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_messages_receiver`
        FOREIGN KEY(`receiver_id`)
        REFERENCES `users`(`id`)
        ON DELETE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'internal messaging system between employees';

-- +--------+
-- | Logs   |
-- +--------+

CREATE TABLE `logs`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique log entry ID',
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user involved in the event',
    `type_id` INT UNSIGNED NOT NULL DEFAULT 5 COMMENT 'log type, default is CSV',
    `details` TEXT DEFAULT NULL COMMENT 'additional details about the log event',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'log creation time',

    CONSTRAINT `fk_logs_user`
        FOREIGN KEY (`user_id`)
        REFERENCES `users`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_logs_type`
        FOREIGN KEY (`type_id`)
        REFERENCES `log_types`(`id`)
        ON DELETE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'audit logs for user activities';

-- +------------+
-- | uploads    |
-- +------------+

CREATE TABLE `uploads`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique upload ID',
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user who uploaded the file',
    `file_type_id` INT UNSIGNED NOT NULL DEFAULT 5 COMMENT 'file type, default is CSV',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'upload time',

    CONSTRAINT `fk_uploads_user`
        FOREIGN KEY (`user_id`)
        REFERENCES `users`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_uploads_file_type`
        FOREIGN KEY (`file_type_id`)
        REFERENCES `file_types`(`id`)
        ON DELETE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'file upload records';

-- +------------+
-- | reports    |
-- +------------+

CREATE TABLE `reports`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique report ID',
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT 'user who generated the report',
    `file_type_id` INT UNSIGNED NOT NULL DEFAULT 5 COMMENT 'report file type, default is CSV',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'report generation time',

    CONSTRAINT `fk_reports_user`
        FOREIGN KEY (`user_id`)
        REFERENCES `users`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_reports_file_type`
        FOREIGN KEY (`file_type_id`)
        REFERENCES `file_types`(`id`)
        ON DELETE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT 'generated report records';