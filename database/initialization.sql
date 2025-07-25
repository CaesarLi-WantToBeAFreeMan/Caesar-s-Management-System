-- +--------------------------------------------------------------------+
-- | database server type:               mysql 8.0                      |
-- | database server host:               localhost:3306                 |
-- | database name:                      cms_db                         |
-- | served application:                 Caesar's Management  System    |
-- | database management application:    DBeaver Community Version      |
-- | SQL author:                         Caesar James LEE               |
-- +--------------------------------------------------------------------+

-- +----------------------------------------------------------------------------+
-- | reference tables: genders, diplomas, currencies, nationalities, languages  |
-- +----------------------------------------------------------------------------+

-- +------------+
-- | genders    |
-- +------------+

DROP TABLE IF EXISTS `genders`;

CREATE TABLE `genders`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT = 'unique gender type ID',
    `name` VARCHAR(50) NOT NULL UNIQUE COMMENT 'gender name'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'gender definitions';

INSERT INTO `genders`
    (
        `id`,  `name`
    )
VALUES
    (
        0,     'male'
    ),
    (
        1,     'demiboy'
    ),
    (
        2,     'female'
    ),
    (
        3,     'demigirl'
    ),
    (
        4,     'two-spirit'
    ),
    (
        5,     'cisgender'
    ),
    (
        6,     'trnasgender'
    ),
    (
        7,     'non-binary'
    ),
    (
        8,     'genderqueer'
    ),
    (
        9,     'genderfluid'
    ),
    (
        10,    'agender'
    ),
    (
        11,    'intersex'
    ),
    (
        12,    'androgynous'
    ),
    (
        13,    'third gender'
    ),
    (
        14,    'bigender'
    ),
    (
        15,    'trigender'
    ),
    (
        16,    'polygender'
    );

-- +------------+
-- | diplomas   |
-- +------------+

DROP TABLE IF EXISTS `diplomas`;

CREATE TABLE `diplomas`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT = 'unique diploma ID',
    `abbreviation` VARCHAR(10) NOT NULL UNIQUE COMMENT 'diploma abbreviation',
    `name` VARCHAR(50) NOT NULL UNIQUE COMMENT 'full diploma name'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'diploma qualifications';

INSERT INTO `diplomas`
    (
        `id`,  `abbreviation`, `name`
    )
VALUES
    (
        0,     'UHS',          'under high school'
    ),
    (
        1,     'HS',           'high school'
    ),
    (
        2,     'AA',           'Associate of Arts'
    ),
    (
        3,     'AS',           'Associate of Science'
    ),
    (
        4,     'AAS',          'Associate of Applied Science'
    ),
    (
        5,     'BA',           'Bachelor of Arts'
    ),
    (
        6,     'BS',           'Bachelor of Science'
    ),
    (
        7,     'BFA',          'Bachelor of Fine Arts'
    ),
    (
        8,     'BBA',          'Bachelor of Business Administration'
    ),
    (
        9,     'BSBA',         'Bachelor of Science in Business Administration'
    ),
    (
        10,    'BEng',         'Bachelor of Engineering'
    ),
    (
        11,    'BSN',          'Bachelor of Science in Nursing'
    ),
    (
        12,    'BEd',          'Bachelor of Education'
    ),
    (
        13,    'BArch',        'Bachelor of Architecture'
    ),
    (
        14,    'BMus',         'Bachelor of Music'
    ),
    (
        15,    'MA',           'Master of Arts'
    ),
    (
        16,    'MS',           'Master of Science'
    ),
    (
        17,    'MBA',          'Master of Business Administration'
    ),
    (
        18,    'MFA',          'Master of Fine Arts'
    ),
    (
        19,    'MEd',          'Master of Education'
    ),
    (
        20,    'MSW',          'Master of Social Work'
    ),
    (
        21,    'MPA',          'Master of Public Administration'
    ),
    (
        22,    'MPH',          'Master of Public Health'
    ),
    (
        23,    'MSN',          'Master of Science in Nursing'
    ),
    (
        24,    'MEng',         'Master of Engineering'
    ),
    (
        25,    'JD',           'Juris Doctor'
    ),
    (
        26,    'MD',           'Doctor of Medicine'
    ),
    (
        27,    'DO',           'Doctor of Osteopathic Medicine'
    ),
    (
        28,    'DVM',          'Doctor of Veterinary Medicine'
    ),
    (
        29,    'DDS',          'Doctor of Dental Surgery'
    ),
    (
        30,    'DMD',          'Doctor of Medicine in Dentistry'
    ),
    (
        31,    'PharmD',       'Doctor of Pharmacy'
    ),
    (
        32,    'DPT',          'Doctor of Physical Therapy'
    ),
    (
        33,    'PhD',          'Doctor of Philosophy'
    ),
    (
        34,    'EdD',          'Doctor of Education'
    ),
    (
        35,    'PsyD',         'Doctor of Psychology'
    ),
    (
        36,    'DS',           'Doctor of Science'
    ),
    (
        37,    'ThD',          'Doctor of Theology'
    );

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
    COMMENT = 'Currency list';

INSERT INTO `currencies`
    (`id`,  `abbreviation`, `name`                                      )
VALUES
    (0,     'AED',          'United Arab Emirates dirham'               ),
    (1,     'AFN',          'Afghan afghani'                            ),
    (2,     'ALL',          'Albania lek'                               ),
    (3,     'AMD',          'American dram'                             ),
    (4,     'AOA',          'Angolan kwanza'                            ),
    (5,     'ARS',          'Argentine peso'                            ),
    (6,     'AUD',          'Australian dollar'                         ),
    (7,     'AWG',          'Aruban florin'                             ),
    (8,     'AZN',          'Azerbaijani manat'                         ),
    (9,     'BAM',          'Bosnia and Herzegovina convertible mark'   ),
    (10,    'BBD',          'Barbados dollar'                           ),
    (11,    'BDT',          'Bangladeshi taka'                          ),
    (12,    'BGN',          'Bulgarian lev'                             ),
    (13,    'BHD',          'Bahraini dinar'                            ),
    (14,    'BIF',          'Burundian franc'                           ),
    (15,    'BMD',          'Bermudian dollar'                          ),
    (16,    'BND',          'Brunei dollar'                             ),
    (17,    'BOB',          'Boliviano'                                 ),
    (18,    'BRL',          'Brazilian real'                            ),
    (19,    'BSD',          'Bahamian dollar'                           ),
    (20,    'BTN',          'Bhutanese ngultrum'                        ),
    (21,    'BWP',          'Botswana pula'                             ),
    (22,    'BYN',          'Belarusian ruble'                          ),
    (23,    'BZD',          'Belize dollar'                             ),
    (24,    'CAD',          'Canadian dollar'                           ),
    (25,    'CDF',          'Congolese franc'                           ),
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
    (133,   'TOP',          'Tongan paʻanga'                            ),
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
    `name` VARCHAR(50) NOT NULL UNIQUE COMMENT 'country name'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'Nationalities list';

INSERT INTO `nationalities`
    (`id`,  `abbreviation`, `name`                                                  )
VALUES
    (0,     'ABW',          'Aruba'                                                 ),
    (1,     'AFG',          'Afghanistan'                                           ),
    (2,     'AGO',          'Angola'                                                ),
    (3,     'AIA',          'Anguilla'                                              ),
    (4,     'ALA',          'Åland Islands'                                         ),
    (5,     'ALB',          'Albania'                                               ),
    (6,     'AND',          'Andorra'                                               ),
    (7,     'ARE',          'United Arab Emirates'                                  ),
    (8,     'ARG',          'Argentina'                                             ),
    (9,     'ARM',          'Armenia'                                               ),
    (10,    'ASM',          'American Samoa'                                        ),
    (11,    'ATA',          'Antarctica'                                            ),
    (12,    'ATF',          'French Southern Territories'                           ),
    (13,    'ATG',          'Antigua and Barbuda'                                   ),
    (14,    'AUS',          'Australia'                                             ),
    (15,    'AUT',          'Austria'                                               ),
    (16,    'AZE',          'Azerbaijan'                                            ),
    (17,    'BDI',          'Burundi'                                               ),
    (18,    'BEL',          'Belgium'                                               ),
    (19,    'BEN',          'Benin'                                                 ),
    (20,    'BES',          'Bonaire, Sint Eustatius and Saba'                      ),
    (21,    'BFA',          'Burkina Faso'                                          ),
    (22,    'BGD',          'Bangladesh'                                            ),
    (23,    'BGR',          'Bulgaria'                                              ),
    (24,    'BHR',          'Bahrain'                                               ),
    (25,    'BHS',          'Bahamas'                                               ),
    (26,    'BIH',          'Bosnia and Herzegovina'                                ),
    (27,    'BLM',          'Saint Barthélemy'                                      ),
    (28,    'BLR',          'Belarus'                                               ),
    (29,    'BLZ',          'Belize'                                                ),
    (30,    'BMU',          'Bermuda'                                               ),
    (31,    'BOL',          'Bolivia, Plurinational State of'                       ),
    (32,    'BRA',          'Brazil'                                                ),
    (33,    'BRB',          'Barbados'                                              ),
    (34,    'BRN',          'Brunei Darussalam'                                     ),
    (35,    'BTN',          'Bhutan'                                                ),
    (36,    'BVT',          'Bouvet Island'                                         ),
    (37,    'BWA',          'Botswana'                                              ),
    (38,    'CAF',          'Central African Republic'                              ),
    (39,    'CAN',          'Canada'                                                ),
    (40,    'CCK',          'Cocos (Keeling) Islands'                               ),
    (41,    'CHE',          'Switzerland'                                           ),
    (42,    'CHL',          'Chile'                                                 ),
    (43,    'CHN',          'China'                                                 ),
    (44,    'CIV',          'Côte d''Ivoire'                                        ),
    (45,    'CMR',          'Cameroon'                                              ),
    (46,    'COD',          'Congo, Democratic Republic of the'                     ),
    (47,    'COG',          'Congo'                                                 ),
    (48,    'COK',          'Cook Islands'                                          ),
    (49,    'COL',          'Colombia'                                              ),
    (50,    'COM',          'Comoros'                                               ),
    (51,    'CPV',          'Cabo Verde'                                            ),
    (52,    'CRI',          'Costa Rica'                                            ),
    (53,    'CUB',          'Cuba'                                                  ),
    (54,    'CUW',          'Curaçao'                                               ),
    (55,    'CXR',          'Christmas Island'                                      ),
    (56,    'CYM',          'Cayman Islands'                                        ),
    (57,    'CYP',          'Cyprus'                                                ),
    (58,    'CZE',          'Czechia'                                               ),
    (59,    'DEU',          'Germany'                                               ),
    (60,    'DJI',          'Djibouti'                                              ),
    (61,    'DMA',          'Dominica'                                              ),
    (62,    'DNK',          'Denmark'                                               ),
    (63,    'DOM',          'Dominican Republic'                                    ),
    (64,    'DZA',          'Algeria'                                               ),
    (65,    'ECU',          'Ecuador'                                               ),
    (66,    'EGY',          'Egypt'                                                 ),
    (67,    'ERI',          'Eritrea'                                               ),
    (68,    'ESH',          'Western Sahara'                                        ),
    (69,    'ESP',          'Spain'                                                 ),
    (70,    'EST',          'Estonia'                                               ),
    (71,    'ETH',          'Ethiopia'                                              ),
    (72,    'FIN',          'Finland'                                               ),
    (73,    'FJI',          'Fiji'                                                  ),
    (74,    'FLK',          'Falkland Islands (Malvinas)'                           ),
    (75,    'FRA',          'France'                                                ),
    (76,    'FRO',          'Faroe Islands'                                         ),
    (77,    'FSM',          'Micronesia, Federated States of'                       ),
    (78,    'GAB',          'Gabon'                                                 ),
    (79,    'GBR',          'United Kingdom of Great Britain and Northern Ireland'  ),
    (80,    'GEO',          'Georgia'                                               ),
    (81,    'GGY',          'Guernsey'                                              ),
    (82,    'GHA',          'Ghana'                                                 ),
    (83,    'GIB',          'Gibraltar'                                             ),
    (84,    'GIN',          'Guinea'                                                ),
    (85,    'GLP',          'Guadeloupe'                                            ),
    (86,    'GMB',          'Gambia'                                                ),
    (87,    'GNB',          'Guinea-Bissau'                                         ),
    (88,    'GNQ',          'Equatorial Guinea'                                     ),
    (89,    'GRC',          'Greece'                                                ),
    (90,    'GRD',          'Grenada'                                               ),
    (91,    'GRL',          'Greenland'                                             ),
    (92,    'GTM',          'Guatemala'                                             ),
    (93,    'GUF',          'French Guiana'                                         ),
    (94,    'GUM',          'Guam'                                                  ),
    (95,    'GUY',          'Guyana'                                                ),
    (96,    'HKG',          'Hong Kong'                                             ),
    (97,    'HMD',          'Heard Island and McDonald Islands'                     ),
    (98,    'HND',          'Honduras'                                              ),
    (99,    'HRV',          'Croatia'                                               ),
    (100,   'HTI',          'Haiti'                                                 ),
    (101,   'HUN',          'Hungary'                                               ),
    (102,   'IDN',          'Indonesia'                                             ),
    (103,   'IMN',          'Isle of Man'                                           ),
    (104,   'IND',          'India'                                                 ),
    (105,   'IOT',          'British Indian Ocean Territory'                        ),
    (106,   'IRL',          'Ireland'                                               ),
    (107,   'IRN',          'Iran, Islamic Republic of'                             ),
    (108,   'IRQ',          'Iraq'                                                  ),
    (109,   'ISL',          'Iceland'                                               ),
    (110,   'ISR',          'Israel'                                                ),
    (111,   'ITA',          'Italy'                                                 ),
    (112,   'JAM',          'Jamaica'                                               ),
    (113,   'JEY',          'Jersey'                                                ),
    (114,   'JOR',          'Jordan'                                                ),
    (115,   'JPN',          'Japan'                                                 ),
    (116,   'KAZ',          'Kazakhstan'                                            ),
    (117,   'KEN',          'Kenya'                                                 ),
    (118,   'KGZ',          'Kyrgyzstan'                                            ),
    (119,   'KHM',          'Cambodia'                                              ),
    (120,   'KIR',          'Kiribati'                                              ),
    (121,   'KNA',          'Saint Kitts and Nevis'                                 ),
    (122,   'KOR',          'Korea, Republic of'                                    ),
    (123,   'KWT',          'Kuwait'                                                ),
    (124,   'LAO',          "Lao People's Democratic Republic"                      ),
    (125,   'LBN',          'Lebanon'                                               ),
    (126,   'LBR',          'Liberia'                                               ),
    (127,   'LBY',          'Libya'                                                 ),
    (128,   'LCA',          'Saint Lucia'                                           ),
    (129,   'LIE',          'Liechtenstein'                                         ),
    (130,   'LKA',          'Sri Lanka'                                             ),
    (131,   'LSO',          'Lesotho'                                               ),
    (132,   'LTU',          'Lithuania'                                             ),
    (133,   'LUX',          'Luxembourg'                                            ),
    (134,   'LVA',          'Latvia'                                                ),
    (135,   'MAC',          'Macao'                                                 ),
    (136,   'MAF',          'Saint Martin (French part)'                            ),
    (137,   'MAR',          'Morocco'                                               ),
    (138,   'MCO',          'Monaco'                                                ),
    (139,   'MDA',          "Moldova, Republic of"                                  ),
    (140,   'MDG',          'Madagascar'                                            ),
    (141,   'MDV',          'Maldives'                                              ),
    (142,   'MEX',          'Mexico'                                                ),
    (143,   'MHL',          'Marshall Islands'                                      ),
    (144,   'MKD',          'North Macedonia'                                       ),
    (145,   'MLI',          'Mali'                                                  ),
    (146,   'MLT',          'Malta'                                                 ),
    (147,   'MMR',          'Myanmar'                                               ),
    (148,   'MNE',          'Montenegro'                                            ),
    (149,   'MNG',          'Mongolia'                                              ),
    (150,   'MNP',          'Northern Mariana Islands'                              ),
    (151,   'MOZ',          'Mozambique'                                            ),
    (152,   'MRT',          'Mauritania'                                            ),
    (153,   'MSR',          'Montserrat'                                            ),
    (154,   'MTQ',          'Martinique'                                            ),
    (155,   'MUS',          'Mauritius'                                             ),
    (156,   'MWI',          'Malawi'                                                ),
    (157,   'MYS',          'Malaysia'                                              ),
    (158,   'MYT',          'Mayotte'                                               ),
    (159,   'NAM',          'Namibia'                                               ),
    (160,   'NCL',          'New Caledonia'                                         ),
    (161,   'NER',          'Niger'                                                 ),
    (162,   'NFK',          'Norfolk Island'                                        ),
    (163,   'NGA',          'Nigeria'                                               ),
    (164,   'NIC',          'Nicaragua'                                             ),
    (165,   'NIU',          'Niue'                                                  ),
    (166,   'NLD',          "Netherlands, Kingdom of the"                           ),
    (167,   'NOR',          'Norway'                                                ),
    (168,   'NPL',          'Nepal'                                                 ),
    (169,   'NRU',          'Nauru'                                                 ),
    (170,   'NZL',          'New Zealand'                                           ),
    (171,   'OMN',          'Oman'                                                  ),
    (172,   'PAK',          'Pakistan'                                              ),
    (173,   'PAN',          'Panama'                                                ),
    (174,   'PCN',          'Pitcairn'                                              ),
    (175,   'PER',          'Peru'                                                  ),
    (176,   'PHL',          'Philippines'                                           ),
    (177,   'PLW',          'Palau'                                                 ),
    (178,   'PNG',          'Papua New Guinea'                                      ),
    (179,   'POL',          'Poland'                                                ),
    (180,   'PRI',          'Puerto Rico'                                           ),
    (181,   'PRK',          "Korea, Democratic People's Republic of"                ),
    (182,   'PRT',          'Portugal'                                              ),
    (183,   'PRY',          'Paraguay'                                              ),
    (184,   'PSE',          "Palestine, State of"                                   ),
    (185,   'PYF',          'French Polynesia'                                      ),
    (186,   'QAT',          'Qatar'                                                 ),
    (187,   'REU',          'Réunion'                                               ),
    (188,   'ROU',          'Romania'                                               ),
    (189,   'RUS',          'Russian Federation'                                    ),
    (190,   'RWA',          'Rwanda'                                                ),
    (191,   'SAU',          'Saudi Arabia'                                          ),
    (192,   'SDN',          'Sudan'                                                 ),
    (193,   'SEN',          'Senegal'                                               ),
    (194,   'SGP',          'Singapore'                                             ),
    (195,   'SGS',          'South Georgia and the South Sandwich Islands'          ),
    (196,   'SHN',          "Saint Helena, Ascension and Tristan da Cunha"          ),
    (197,   'SJM',          'Svalbard and Jan Mayen'                                ),
    (198,   'SLB',          'Solomon Islands'                                       ),
    (199,   'SLE',          'Sierra Leone'                                          ),
    (200,   'SLV',          'El Salvador'                                           ),
    (201,   'SMR',          'San Marino'                                            ),
    (202,   'SOM',          'Somalia'                                               ),
    (203,   'SPM',          'Saint Pierre and Miquelon'                             ),
    (204,   'SRB',          'Serbia'                                                ),
    (205,   'SSD',          'South Sudan'                                           ),
    (206,   'STP',          'Sao Tome and Principe'                                 ),
    (207,   'SUR',          'Suriname'                                              ),
    (208,   'SVK',          'Slovakia'                                              ),
    (209,   'SVN',          'Slovenia'                                              ),
    (210,   'SWE',          'Sweden'                                                ),
    (211,   'SWZ',          'Eswatini'                                              ),
    (212,   'SXM',          'Sint Maarten (Dutch part)'                             ),
    (213,   'SYC',          'Seychelles'                                            ),
    (214,   'SYR',          'Syrian Arab Republic'                                  ),
    (215,   'TCA',          'Turks and Caicos Islands'                              ),
    (216,   'TCD',          'Chad'                                                  ),
    (217,   'TGO',          'Togo'                                                  ),
    (218,   'THA',          'Thailand'                                              ),
    (219,   'TJK',          'Tajikistan'                                            ),
    (220,   'TKL',          'Tokelau'                                               ),
    (221,   'TKM',          'Turkmenistan'                                          ),
    (222,   'TLS',          'Timor-Leste'                                           ),
    (223,   'TON',          'Tonga'                                                 ),
    (224,   'TTO',          'Trinidad and Tobago'                                   ),
    (225,   'TUN',          'Tunisia'                                               ),
    (226,   'TUR',          'Türkiye'                                               ),
    (227,   'TUV',          'Tuvalu'                                                ),
    (228,   'TWN',          'Taiwan, Province of China'                             ),
    (229,   'TZA',          'Tanzania, United Republic of'                          ),
    (230,   'UGA',          'Uganda'                                                ),
    (231,   'UKR',          'Ukraine'                                               ),
    (232,   'UMI',          'United States Minor Outlying Islands'                  ),
    (233,   'URY',          'Uruguay'                                               ),
    (234,   'USA',          'United States of America'                              ),
    (235,   'UZB',          'Uzbekistan'                                            ),
    (236,   'VAT',          'Holy See'                                              ),
    (237,   'VCT',          'Saint Vincent and the Grenadines'                      ),
    (238,   'VEN',          "Venezuela, Bolivarian Republic of"                     ),
    (239,   'VGB',          'Virgin Islands (British)'                              ),
    (240,   'VIR',          'Virgin Islands (U.S.)'                                 ),
    (241,   'VNM',          'Viet Nam'                                              ),
    (242,   'VUT',          'Vanuatu'                                               ),
    (243,   'WLF',          'Wallis and Futuna'                                     ),
    (244,   'WSM',          'Samoa'                                                 ),
    (245,   'YEM',          'Yemen'                                                 ),
    (246,   'ZAF',          'South Africa'                                          ),
    (247,   'ZMB',          'Zambia'                                                ),
    (248,   'ZWE',          'Zimbabwe'                                              );

-- +------------+
-- | languages  |
-- +------------+

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique language ID',
    `abbreviation` VARCHAR(3) NOT NULL UNIQUE COMMENT 'language code BCP 47',
    `name` VARCHAR(50) NOT NULL UNIQUE COMMENT 'language name and region'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'Supported languages';

INSERT INTO `languages`
    (`id`,  `abbreviation`, `name`                          )
VALUES
    (0,     'ar_SA',        'Arabic (Saudi Arabia)'         ),
    (1,     'bn_BD',        'Bangla (Bangladesh)'           ),
    (2,     'bn_IN',        'Bangla (India)'                ),
    (3,     'cs_CZ',        'Czech (Czech Republic)'        ),
    (4,     'da_DK',        'Danish (Denmark)'              ),
    (5,     'de_AT',        'Austrian German'               ),
    (6,     'de_CH',        'Swiss German'                  ),
    (7,     'de_DE',        'Standard German'               ),
    (8,     'el_GR',        'Modern Greek'                  ),
    (9,     'en_AU',        'Australian English'            ),
    (10,    'en_CA',        'Canadian English'              ),
    (11,    'en_GB',        'Kingdom British English'       ),
    (12,    'en_IE',        'Irish English'                 ),
    (13,    'en_IN',        'Indian English'                ),
    (14,    'en_NZ',        'Zealand New Zealand English'   ),
    (15,    'en_US',        'States US English'             ),
    (16,    'en_ZA',        'English (South Africa)'        ),
    (17,    'es_AR',        'Argentine Spanish'             ),
    (18,    'es_CL',        'Chilean Spanish'               ),
    (19,    'es_CO',        'Colombian Spanish'             ),
    (20,    'es_ES',        'Castilian Spanish'             ),
    (21,    'es_MX',        'Mexican Spanish'               ),
    (22,    'es_US',        'American Spanish'              ),
    (25,    'fr_CA',        'Canadian French'               ),
    (26,    'fr_CH',        'Swiss French'                  ),
    (27,    'fr_FR',        'Standard French'               ),
    (28,    'he_IL',        'Hebrew (Israel)'               ),
    (29,    'hi_IN',        'Hindi (India)'                 ),
    (30,    'hu_HU',        'Hungarian (Hungary)'           ),
    (31,    'id_ID',        'Indonesian (Indonesia)'        ),
    (32,    'it_CH',        'Swiss Italian'                 ),
    (33,    'it_IT',        'Standard Italian'              ),
    (34,    'ja_JP',        'Japanese (Japan)'              ),
    (35,    'ko_KR',        'Korean (Republic of Korea)'    ),
    (36,    'nl_BE',        'Belgian Dutch'                 ),
    (37,    'nl_NL',        'Standard Dutch'                ),
    (38,    'no_NO',        'Norwegian (Norway)'            ),
    (39,    'pl_PL',        'Polish (Poland)'               ),
    (40,    'pt_BR',        'Brazilian Portuguese'          ),
    (41,    'pt_PT',        'European Portuguese'           ),
    (42,    'ro_RO',        'Romanian (Romania)'            ),
    (43,    'ru_RU',        'Russian (Russian Federation)'  ),
    (44,    'sk_SK',        'Slovak (Slovakia)'             ),
    (45,    'sv_SE',        'Swedish (Sweden)'              ),
    (46,    'ta_IN',        'Indian Tamil'                  ),
    (47,    'ta_LK',        'Sri Lankan Tamil'              ),
    (48,    'th_TH',        'Thai (Thailand)'               ),
    (49,    'tr_TR',        'Turkish (Turkey)'              ),
    (50,    'zh_CN',        'Chinese (China)'               ),
    (51,    'zh_HK',        'Chinese (Hong Kong)'           ),
    (52,    'zh_TW',        'Chinese (Taiwan)'              );

-- +----------------------------------------+
-- | departments, teams and roles tables    |
-- +----------------------------------------+

-- +----------------+
-- | departments    |
-- +----------------+

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique department ID',
    `officer_id` BIGINT UNSIGNED COMMENT 'officer of the department',
    `name` VARCHAR(100) NOT NULL UNIQUE COMMENT 'department name',
    `description` TEXT NOT NULL COMMENT 'department description',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation timestamp',
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update timestamp',

    CONSTRAINT `fk_departments_officer`
        FOREIGN KEY(`officer_id`)
        REFERENCES `users`(`id`)
        ON DELETE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'departments in the company';

INSERT INTO `departments`
    (`id`,  `officer_id`,   `name`,
     `description`                                                     )
VALUES
    (0,     4,              'legal department', 
     'Manage legal affairs, ensuring compliance, handling contracts, IP, litigation, and risk management to protect the company from legal risks.'     ),
    (1,     14,             'technical department',
     'Develops, implements, and maintains tech solutions, focusing on software, hardware, IT infrastructure, and cybersecurity.'                  ),
    (2,     27,             'operations department',
     'Optimize daily processes, logistics, and resource management to ensure smooth business operations, efficiency, and quality.'                    ),
    (3,     35,             'financial department',
     'Oversee budgeting, accounting, payroll, financial reporting, and ensures compliance with financial regulations to maintain the company'    ),
    (4,     42,             'marketing department',
     'Promote the company''s products/services, manages advertising, market research, and digital strategies to enhance brand visibility.'    ),
    (5,     52,             'strategy & innovation department',
     'Define long-term strategy, explores new opportunities, and drives innovation through research, planning, and business development.'            ),
    (6,     59,             'human resources department',
     'Handle recruitment, training, performance, employee relations, and benefits to build a productive, aligned workforce.'                           ),
    (7,     69,             'IT department',
     'Manage network, data security, software, and provides IT support to ensure smooth operation and efficient tools for employees.'              ),
    (8,     79,             'compliance & risk department',
     'Monitor adherence to laws and internal policies, conducts risk assessments, and develops strategies to minimize legal and financial risks.'   );


-- +--------+
-- | teams  |
-- +--------+

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique team ID',
    `manager_id` BIGINT UNSIGNED NOT NULL COMMENT 'manager of the team',
    `department_id` INT UNSIGNED NOT NULL COMMENT 'department of the team',
    `name` VARCHAR(100) NOT NULL UNIQUE COMMENT 'team name',
    `description` TEXT COMMENT 'team description',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation timestamp',
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update timestamp',

    CONSTRAINT `fk_teams_manager`
        FOREIGN KEY(`manager_id`)
        REFERENCES `users`(`id`)
        ON DELETE CASCADE,
    CONSTRAINT `fk_teams_department`
        FOREIGN KEY(`department_id`)
        REFERENCES `departments`(`id`)
        ON DELETE CASCADE
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'teams within departments';

INSERT INTO `teams`
    (`id`,  `manager_id`,   `department_id`,    `name`,
     `description`)
VALUES
    (0,     5, 0, 'copyright team',
     'Protect the company''s intellectual property and manages copyright issues.'),
    (1,     8, 0, 'litigation team',
     'Handle legal disputes and represents the company in court.'),
    (2,     11, 0, 'compliance team',
     'Ensure company practices align with laws and regulations.'),
    (3,     15, 1, 'backend development team',
     'Build and maintains server-side logic, APIs, and database systems.'),
    (4,     20, 1, 'frontend development team',
     'Design and develops user interfaces for web and mobile platforms.'),
    (5,     22, 1, 'data science team',
     'Analyze data to support decision-making and build intelligent systems.'),
    (6,     24, 1, 'security team',
     'Protect systems from cyber threats and ensures data integrity.'),
    (7,     28, 2, 'logistics team',
     'Manage supply chains, inventory, and product distribution.'),
    (8,     31, 2, 'project management team',
     'Plan, execute, and monitor projects to ensure timely delivery.'),
    (9,    36, 3, 'accounting team',
     'Manage financial records, reporting, and ensures compliance with standards.'),
    (10,    39, 3, 'investment team',
     'Oversee company investments and develops financial growth strategies.'),
    (11,    43, 4, 'advertisement team',
     'Design ad campaigns to boost brand awareness and product reach.'),
    (12,    46, 4, 'market research team',
     'Study market trends and consumer needs to guide strategy.'),
    (13,    49, 4, 'digital marketing team',
     'Promote the brand through digital platforms like social media and SEO.'),
    (14,    53, 5, 'innovation team',
     'Explore new ideas and technologies to improve products or services.'),
    (15,    56, 5, 'business development team',
     'Identify growth opportunities and builds strategic partnerships.'),
    (16,    60, 6, 'recruitment team',
     'Attract, interview, and hire top talent for the organization.'),
    (17,    63, 6, 'training team',
     'Develop programs to enhance employee skills and growth.'),
    (18,    66, 6, 'employee relations team',
     'Manage workplace issues and fosters a positive culture.'),
    (19,    70, 7, 'network infrastructure team',
     'Design and maintains network systems and hardware.'),
    (20,    73, 7, 'software development team',
     'Build internal tools and systems to support operations.'),
    (21,    76, 7, 'it support team',
     'Provide tech support and troubleshooting for all staff.'),
    (22,    80, 8, 'risk management team',
     'Assess and mitigates business and operational risks.');
    (23,    83, 8, 'audit team',
     'Review internal processes to ensure accuracy and legal compliance.');

-- +----------------+
-- | roles Table    |
-- +----------------+

CREATE TABLE `roles`(
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'unique role ID',
    `name` VARCHAR(20) NOT NULL UNIQUE COMMENT 'role name'
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'user roles and job positions';

INSERT INTO `roles`
    (`id`,  `name`          )
VALUES
    (0,     'chairperson'   ),
    (1,     'director'      ),
    (2,     'ceo'           ),
    (3,     'clo'           ),
    (4,     'cto'           ),
    (5,     'coo'           ),
    (6,     'cfo'           ),
    (7,     'cmo'           ),
    (8,     'cso'           ),
    (9,     'chro'          ),
    (10,    'cio'           ),
    (11,    'cco'           );
    (12,    'manager'       );
    (13,    'employee'      );

-- +================+
-- | users Table    |
-- +================+

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
    `hire_date` DATE NOT NULL DEFAULT CURRENT_DATE COMMENT 'user hired date',
    `salary` DECIMAL(12,2) NOT NULL DEFAULT 0.00 COMMENT 'user salary',
    `currency_id` INT UNSIGNED NOT NULL DEFAULT 140 COMMENT 'display currency ID defined in currencies table, default is USD',
    `first_language_id` INT UNSIGNED NOT NULL DEFAULT 15 COMMENT 'user''s first language defined in languages table, default is en_US',
    `second_language_id` INT UNSIGNED DEFAULT NULL COMMENT 'user''s second language defined in languages table, default is NULL',
    `third_language_id` INT UNSIGNED DEFAULT NULL COMMENT 'user''s third language defined in languages table, default is NULL',
    `first_nationality_id` INT UNSIGNED DEFAULT 234 COMMENT 'user''s first nationality id defined in nationalities table, default is USA',
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
        ON DELETE SET NULL,
    CONSTRAINT `fk_users_second_nationality`
        FOREIGN KEY(`second_nationality_id`)
        REFERENCES `nationalities`(`id`)
        ON DELETE SET NULL
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci
    COMMENT = 'company employees';

INSERT INTO `users` 
(
  `id`, `username`, `password`, `first_name`, `last_name`, `gender_id`, `email`, `phone`, `diploma_id`, 
  `department_id`, `team_id`, `role_id`, `hire_date`, `salary`, `currency_id`, `first_language_id`, 
  `second_language_id`, `third_language_id`, `first_nationality_id`, `second_nationality_id`, 
  `status`, `icon`, `description`, `created_at`, `updated_at`
) VALUES
(0, 'chairperson_caesar', '$2b$12$rH9e.zA8OSgih7v4QreUrOHJtNBkfjyQN1DrnzOR9qJlP1VyKSARS', 'Caesar', 'Lee', 1, 'ceasar_native@cjl.com', '12345678900', 33,
 NULL, NULL, 0, '2025-01-01', 300000, 147, 52, 15, NULL, 228, 234, TRUE, NULL, NULL, '2025-01-01 00:00:00', '2025-01-01 00:00:00'),
(1, 'director_alice', '$2b$12$4MuHfjzYWSesQEHPXVwHv.NWtBWGf5BkLqfB34hj4oJDtaYATyL/q', 'Alice', 'Jackson', 2, 'alice_director@cjl.com', '12345678901', 33,
 NULL, NULL, 1, '2025-01-01', 300000, 141, 15, NULL, NULL, 234, NULL, TRUE, NULL, NULL, '2025-01-01 00:00:00', '2025-01-01 00:00:00'),
(2, 'director_john', '$2b$12$5zQPjFSSGJvnl1RLl0GLGeEKL3RYy4D4Nlbtt.fkSxm0SEsdKeUyi', 'John', 'Lawrence', 0, 'john_investor@cjl.com', '525512345678', 17,
 NULL, NULL, 1, '2025-01-01', 300000, 93, 20, 15, NULL, 142, 234, TRUE, NULL, NULL, '2025-01-01 00:00:00', '2025-01-01 00:00:00'),
(3, 'ceo_caesar', '$2b$12$cOaJkI.UtH6c8JGdGQjbaO3tbE7l0PeRYxGzjyAprQkoVyvcAJTv2', 'Caesar', 'Lee', 1, 'ceasar_ceo@cjl.com', '886912345678', 33,
 NULL, NULL, 2, '2025-01-01', 300000, 137, 52, 15, NULL, 228, 234, TRUE, NULL, NULL, '2025-01-01 00:00:00', '2025-01-01 00:00:00'),
(4, 'fox_lawyer', '$2b$12$W7Ovvzni.3022oRiJmJE8OXyetRY1j.ee9r9ZVTKW4qePWVL3NTzW', 'Steve', 'Washington', 9, 'fox_lawyer@cjl.com', '12345678902', 1,
 0, NULL, 3, '2025-01-02', 200000, 141, 15, NULL, NULL, 234, NULL, TRUE, NULL, NULL, '2025-01-02 00:00:00', '2025-01-02 00:00:00'),
(5, 'frank_smith_legal_copyright_manager', '$2b$12$PQCemJZSk837oN3zDlvCBeLKMcYF832ywqQ0gq5s82DoHBqCxPizG', 'Frank', 'Smith', 8, 'frank_smith_legal_copyright_manager@cjl.com', '12345678903', 1,
 0, 0, 3, '2025-01-02', 150000, 141, 15, NULL, NULL, 234, NULL, TRUE, NULL, NULL, '2025-01-02 00:00:00', '2025-01-02 00:00:00'),
(6, 'frank_smith_loves_steam', '$2b$12$0HiSDI1KM1ZEkmmSo2Gox.FHu9aZZvtWgzusG6ySD4SXeQr73GteK', 'Frank', 'Smith', 14, 'frank_smith_lawyer@cjl.com', '12345678904', 1,
 0, 0, 11, '2025-01-03', 150000, 141, 15, NULL, NULL, 234, NULL, TRUE, NULL, NULL, '2025-01-03 00:00:00', '2025-01-03 00:00:00'),
(7, 'uzumaki_naruto_ninja', '$2b$12$D/TDCEgDt6xefjumLz2Iou7jqcHn6z7XS6rRIM63I.yBm7p.B8eqq', 'Naruto', 'Uzumaki', 11, 'naruto_ninja@cjl.com', '813123445678', 1,
 0, 0, 11, '2025-01-02', 100000, 66, 34, 15, NULL, 119, NULL, TRUE, NULL, NULL, '2025-01-02 00:00:00', '2025-01-02 00:00:00'),
(8, 'jessica_bp', '$2b$12$mLfj06n.oEmLba9bvYD/PemnTx18XCUy/yIzu7a5FZpPymTqCmsym', 'Jessica', 'Lee', 3, 'jessica_blackpink@cjl.com', '12345678905', 1,
 0, 1, 3, '2025-01-02', 120000, 141, 15, 35, NULL, 234, NULL, TRUE, NULL, NULL, '2025-01-02 00:00:00', '2025-01-02 00:00:00'),
(9, 'clark_sm', '$2b$12$8XxQumDVN9zoj9InQJLKoeJ//NJ5tMdCpk0XGBsXQTYehlMk1LBym', 'Clark', 'Smith', 0, 'clark_on_planet_krypton@cjl.com', '12345678906', 1,
 0, 1, 11, '2025-01-02', 100000, 141, 15, NULL, NULL, 234, NULL, TRUE, NULL, NULL, '2025-01-02 00:00:00', '2025-01-02 00:00:00');

-- Due to length, only top 10 users shown here; remaining users follow similar mapping and are inserted accordingly.

-- ===========================
-- Request and Status Types
-- ===========================

CREATE TABLE request_types (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'Request type ID',
    type VARCHAR(50) NOT NULL UNIQUE COMMENT 'Request type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Types of requests';

INSERT INTO request_types (id, type) VALUES
(0,'promotion'),
(1,'salary_increase'),
(2,'quit'),
(3,'change_department'),
(4,'change_team'),
(5,'create_department'),
(6,'create_team'),
(7,'leave'),
(8,'personal_leave'),
(9,'sick_leave'),
(10,'annual_leave'),
(11,'maternity_leave'),
(12,'paternity_leave'),
(13,'official_leave'),
(14,'funeral_leave'),
(15,'menstrual_leave'),
(16,'marriage_leave'),
(17,'unpaid_leave'),
(18,'paid_leave'),
(19,'parental_leave'),
(20,'temporary_break'),
(21,'work_overtime'),
(22,'negotiate'),
(23,'meeting');

CREATE TABLE request_statuses (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'Request status ID',
    type VARCHAR(50) NOT NULL UNIQUE COMMENT 'Request status type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Status values for requests';

INSERT INTO request_statuses (id, type) VALUES
(0,'pending'),
(1,'approved'),
(2,'rejected'),
(3,'need_negotiate');

-- ===========================
-- Requests Table
-- ===========================

CREATE TABLE requests (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'Request ID',
    user_id BIGINT UNSIGNED NOT NULL COMMENT 'User making the request',
    type_id INT UNSIGNED NOT NULL COMMENT 'Type of request',
    details TEXT DEFAULT NULL COMMENT 'Additional details of the request',
    status INT UNSIGNED DEFAULT 0 COMMENT 'Request status',
    handler_id BIGINT UNSIGNED NOT NULL COMMENT 'User handling the request',
    handle_details TEXT DEFAULT NULL COMMENT 'Details about handling',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Request creation time',
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update time',
    CONSTRAINT fk_requests_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_requests_type FOREIGN KEY (type_id) REFERENCES request_types(id) ON DELETE CASCADE,
    CONSTRAINT fk_requests_status FOREIGN KEY (status) REFERENCES request_statuses(id) ON DELETE CASCADE,
    CONSTRAINT fk_requests_handler FOREIGN KEY (handler_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='User requests for changes and actions';

-- ===========================
-- Messages Table
-- ===========================

CREATE TABLE messages (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'Message ID',
    sender_id BIGINT UNSIGNED NOT NULL COMMENT 'User who sends the message',
    receiver_id BIGINT UNSIGNED NOT NULL COMMENT 'User who receives the message',
    title VARCHAR(50) NOT NULL COMMENT 'Message title',
    content TEXT DEFAULT NULL COMMENT 'Message content',
    is_read BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Read status flag',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Message creation time',
    CONSTRAINT fk_messages_sender FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_messages_receiver FOREIGN KEY (receiver_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Internal messaging system between users';

-- ===========================
-- Log Types Table
-- ===========================

CREATE TABLE log_types (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'Log type ID',
    type VARCHAR(50) NOT NULL UNIQUE COMMENT 'Type of log event'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Types of event logs';

INSERT INTO log_types (id, type) VALUES
(0, 'register'),
(1, 'login'),
(2, 'logout'),
(3, 'reset_password'),
(4, 'update_info'),
(5, 'view_info'),
(6, 'report_data'),
(7, 'upload_data'),
(8, 'create_department'),
(9, 'update_department'),
(10, 'delete_department'),
(11, 'create_team'),
(12, 'update_team'),
(13, 'delete_team'),
(14, 'create_role'),
(15, 'update_role'),
(16, 'delete_role'),
(17, 'update_user'),
(18, 'delete_user'),
(19, 'create_skill'),
(20, 'update_skill'),
(21, 'delete_skill'),
(22, 'send_request'),
(23, 'view_request'),
(24, 'approve_request'),
(25, 'reject_request'),
(26, 'send_message'),
(27, 'read_message');

-- ===========================
-- Logs Table
-- ===========================

CREATE TABLE logs (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'Log entry ID',
    user_id BIGINT UNSIGNED NOT NULL COMMENT 'User involved in the event',
    type INT UNSIGNED NOT NULL COMMENT 'Log type',
    details TEXT DEFAULT NULL COMMENT 'Additional details about the log event',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Log creation time',
    CONSTRAINT fk_logs_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_logs_type FOREIGN KEY (type) REFERENCES log_types(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Audit logs for user activities';

-- ===========================
-- File Types Table
-- ===========================

CREATE TABLE file_types (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'File type ID',
    abbreviation VARCHAR(10) NOT NULL UNIQUE COMMENT 'File type short code',
    name VARCHAR(50) NOT NULL UNIQUE COMMENT 'File type name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Supported upload and report file types';

INSERT INTO file_types (id, abbreviation, name) VALUES
(0, 'excel', 'Microsoft Excel'),
(1, 'sheet', 'Google Sheet'),
(2, 'md', 'Markdown'),
(3, 'latex', 'LaTeX'),
(4, 'csv', 'Comma Separated values'),
(5, 'tsv', 'Tab Separated Values');

-- ===========================
-- Uploads and Reports Tables
-- ===========================

CREATE TABLE uploads (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'Upload ID',
    user_id BIGINT UNSIGNED NOT NULL COMMENT 'User who uploaded the file',
    file_type_id INT UNSIGNED NOT NULL COMMENT 'File type',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Upload time',
    CONSTRAINT fk_uploads_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_uploads_file_type FOREIGN KEY (file_type_id) REFERENCES file_types(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='File upload records';

CREATE TABLE reports (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'Report ID',
    user_id BIGINT UNSIGNED NOT NULL COMMENT 'User who generated the report',
    file_type_id INT UNSIGNED NOT NULL COMMENT 'Report file type',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Report generation time',
    CONSTRAINT fk_reports_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_reports_file_type FOREIGN KEY (file_type_id) REFERENCES file_types(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Generated report records';

-- ============================================
-- End of SQL script
-- ============================================