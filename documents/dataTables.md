# database data tables

## departments & teams

| department                            | department ID | team                          | team ID   |
| :-----------------------------------: | :-----------: | :---------------------------: | :-------: |
| `Legal Department`                    | `1`           | `Copyright Team`              | `1`       |
|                                       |               | `Litigation Team`             | `2`       |
|                                       |               | `Compliance Team`             | `3`       |
| `Technical Department`                | `2`           | `Backend Development Team`    | `4`       |
|                                       |               | `Frontend Development Team`   | `5`       |
|                                       |               | `Data Science Team`           | `6`       |
|                                       |               | `Security Team`               | `7`       |
| `Operations Department`               | `3`           | `Logistics Team`              | `8`       |
|                                       |               | `Project Management Team`     | `9`       |
| `Financial Department`                | `4`           | `Accounting Team`             | `10`      |
|                                       |               | `Investment Team`             | `11`      |
| `Marketing Department`                | `5`           | `Advertisement Team`          | `12`      |
|                                       |               | `Market Research Team`        | `13`      |
|                                       |               | `Digital Marketing Team`      | `14`      |
| `Strategy & Innovation Department`    | `6`           | `Innovation Team`             | `15`      |
|                                       |               | `Business Development Team`   | `16`      |
| `Human Resources Department`          | `7`           | `Recruitment Team`            | `17`      |
|                                       |               | `Training Team`               | `18`      |
|                                       |               | `Employee Relations Team`     | `19`      |
| `IT Department`                       | `8`           | `Network Infrastructure Team` | `20`      |
|                                       |               | `Software Development Team`   | `21`      |
|                                       |               | `IT Support Team`             | `22`      |
| `Compliance & Risk Department`        | `9`           | `Risk Management Team`        | `23`      |
|                                       |               | `Audit Team`                  | `24`      |

## diplomas

| stage                 | diploma                                   | diploma ID    |
| :-------------------: | :---------------------------------------: | :-----------: |
| `under bachelor`      | `Under High School`                       | `1`           |
|                       | `High School`                             | `2`           |
|                       | `Associate of Arts`                       | `3`           |
|                       | `Associate of Science`                    | `4`           |
|                       | `Associate of Applied Science`            | `5`           |
| `bachelor`            | `Bachelor of Arts`                        | `6`           |
|                       | `Bachelor of Science`                     | `7`           |
|                       | `Bachelor of Fine Arts`                   | `8`           |
|                       | `Bachelor of Business Administration`     | `9`           |
|                       | `Bachelor of Science in Business Admin`   | `10`          |
|                       | `Bachelor of Engineering`                 | `11`          |
|                       | `Bachelor of Science in Nursing`          | `12`          |
|                       | `Bachelor of Education`                   | `13`          |
|                       | `Bachelor of Architecture`                | `14`          |
|                       | `Bachelor of Music`                       | `15`          |
| `master`              | `Master of Arts`                          | `16`          |
|                       | `Master of Science`                       | `17`          |
|                       | `Master of Business Administration`       | `18`          |
|                       | `Master of Fine Arts`                     | `19`          |
|                       | `Master of Education`                     | `20`          |
|                       | `Master of Social`                        | `21`          |
|                       | `Master of Public Administration`         | `22`          |
|                       | `Master of Public Health`                 | `23`          |
|                       | `Master of Science in Nursing`            | `24`          |
|                       | `Master of Engineering`                   | `25`          |
| `professional degree` | `Juris Doctor`                            | `26`          |
|                       | `Doctor of Medicine`                      | `27`          |
|                       | `Doctor of Osteopathic Medicine`          | `28`          |
|                       | `Doctor of Veterinary Medicine`           | `29`          |
|                       | `Doctor of Dental Surgery`                | `30`          |
|                       | `Doctor of Medicine in Dentistry`         | `31`          |
|                       | `Doctor of Pharmacy`                      | `32`          |
|                       | `Doctor of Physical Therapy`              | `33`          |
| `doctor`              | `Doctor of Philosophy`                    | `34`          |
|                       | `Doctor of Education`                     | `35`          |
|                       | `Doctor of Psychology`                    | `36`          |
|                       | `Doctor of Science`                       | `37`          |
|                       | `Doctor of Theology`                      | `38`          |

## users

| user ID   | username                              | password                                  | department - team                     | position      | status    |
| :-------: | :-----------------------------------: | :---------------------------------------: | :-----------------------------------: | :-----------: | :-------: |
| `1`       | `chairperson_caesar`                  | `CaesarIsAChairperson@0`                  | board - chairperson                   | chairperson   | `true`    |
| `2`       | `director_alice`                      | `AliceCobuildTheCompany@1`                | board - director                      | director      | `true`    |
| `3`       | `director_john`                       | `JohnInvestTheCompany@2`                  | board - director                      | director      | `true`    |
| `4`       | `ceo_caesar`                          | `CaesarIsCEO!00`                          | NULL - NULL                           | CEO           | `true`    |
| `5`       | `fox_lawyer`                          | `SteveLikesMinecraft#2009`                | legal - NULL                          | CLO           | `true`    |
| `6`       | `frank_smith_legal_copyright_manager` | `frankHaveToBeALawyer!~_~!233`            | legal - copyright                     | manager       | `true`    |
| `7`       | `frank_smith_loves_steam`             | `frankWannaPlaySteamF!O@R#E$V%E^R&000`    | legal - copyright                     | employee      | `true`    |
| `8`       | `uzumaki_naruto_ninja`                | `narutoUzumakiLovesUzumakiNaruto(520)`    | legal - copyright                     | employee      | `true`    |
| `9`       | `jessica_bp`                          | `jessica@Blink#2023`                      | legal - litigation                    | manager       | `true`    |
| `10`       | `clark_sm`                           | `Clark~superman~2025`                     | legal - litigation                    | employee      | `true`    |
| `11`       | `bernard`                            | `MarvelBetterDC!!!Until2018!!!`           | legal - litigation                    | employee      | `false`   |
| `12`       | `jennie`                             | `Gidle#3@kr`                              | legal - compliance                    | manager       | `false`   |
| `13`       | `lily_neverland`                     | `lily_likes_IDLE#2022`                    | legal - compliance                    | employee      | `true`    |
| `14`       | `la_lisa`                            | `lisa@Lalisa#000`                         | legal - compliance                    | employee      | `true`    |
| `15`       | `cto_caesar`                         | `CaesarIsCTO!000`                         | technical - NULL                      | CFO           | `true`    |
| `16`       | `peter_park_spiderman`               | `peterIs@!spiderman!@22`                  | technical - backend development       | employee      | `true`    |
| `17`       | `harry_potter`                       | `paterDefeatVoldmort!Y2K`                 | technical - backend development       | employee      | `true`    |
| `18`       | `elon_musk`                          | `finalAnswerIs:42`                        | technical - backend development      | manager       | `false`    |
| `19`       | `mark_zuckerberg`| `metaLlamaSucks#2025`| technical - frontend development      | manager      | `false` |
| `20`| `spongebob`| `SpongeBob@1999`| technical - frontend development| manager| `true`|
| `21`| ``| ``| technical - frontend development| manager| `false`|
| `22`| ``| ``| technical - frontend development| manager| `false`|
| `23`| ``| ``| technical - frontend development| manager| `false`|
| `24`| ``| ``| technical - frontend development| manager| `false`|
| `25`| ``| ``| technical - frontend development| manager| `false`|
| `26`| ``| ``| technical - frontend development| manager| `false`|
| `27`| ``| ``| technical - frontend development| manager| `false`|
| `28`| ``| ``| technical - frontend development| manager| `false`|
| `29`| ``| ``| technical - frontend development| manager| `false`|
| `30`| ``| ``| technical - frontend development| manager| `false`|
        -- password: 
        '', '$2b$12$/P5ixX4p3fH6oesB6giDu.SJSs2erYYq8ElxkHq/wesSCKwfqvK06',
        'spongebob', 'brown', 0, 'spongebob@cjl.com', '+12345678916', '002 Tech St, LA', 7,
        2, 5, '2025-01-03', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: OptimusPrime@2025
        'autobot_optimus_prime', '$2b$12$zhk3ybxteG2LcfLH2XdwZejU5cLpTTp/xCBXEsp/pMwyGYfLNoaca',
        'optimus', 'prime', 3, 'autobot_optimus_prime@cjl.com', '+12345678917', '001 Autobot St, SF', 17,
        2, 6, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        FALSE, 'manager'
    ),
    (
        -- password: Bumblebee@2025
        'autobot_bumblebee', '$2b$12$C.ByZmrL.1MayU5gnraTUODWNsIyV1hr/YSuhSUxkwhFTPAOtFL5G',
        'bumblebee', 'jones', 3, 'autobot_bumblebee@cjl.com', '+12345678918', '002 Autobot St, SF', 7,
        2, 6, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Ratchet@2025
        'autobot_ratchet', '$2b$12$KQuY1Fv7UrXYqgwrEIrhVOiMoE0n1C/ZtL.joXMcvy3Cofu3GqbsO',
        'ratchet', 'miller', 3, 'autobot_ratchet@cjl.com', '+12345678919', '003 Autobot St, SF', 7,
        2, 6, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Megatron@2025
        'deception_megatron', '$2b$12$bEzpxRNzCCug0p9by6t.VuZNEG8IczDBK7pUjZYuCljX5rsuqDWjW',
        'megatron', 'martinez', 3, 'deception_megatron@cjl.com', '+12345678920', '001 Deception St, SF', 16,
        2, 7, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Starscream@2025
        'deception_starscream', '$2b$12$PmaIjp16SUlr.21ugVK.neAQhnfN/jnsJmgYQdL4kgdhlrv5vUL2O',
        'starscream', 'anderson', 3, 'deception_anderson@cjl.com', '+12345678921', '002 Deception St, SF', 6,
        2, 7, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Shockwave@2025
        'deception_shockwave', '$2b$12$JFlYOizqyK0AMkmJMXKCiOpNeCIkpsU2TeCK3fVMHDEXQvPZQLw4C',
        'shockwave', 'moore', 3, 'deception_shockwave@cjl.com', '+12345678922', '003 Deception St, SF', 6,
        2, 7, '2025-01-04', 250000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        FALSE, 'employee'
    ),

    -- operating department

    (
        -- password:  ProfessorX@2025
        'x_men_professor_x_coo', '$2b$12$sL7hSJB7TTM51jkVbFEpUuMG13C3W22Ds8eH4vEacAsJmovwP6vEu',
        'charles', 'xavier', 0, 'charlesxavier@cjl.com', '+12345678923', '001 Xmen St, SF', 18, 
        3, NULL, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'coo'
    ),
    (
        -- password: ProfessorX@2025
        'professor_x_manager', '$2b$12$N5ew.Yyo4Gpw7hsRsCslKuHc3pk369PF01SmoAwvaSjPL7AmVXRme',
        'charles', 'xavier', 0, 'professorx@cjl.com', '+4915112345679', '001 Xmen St, SF', 18,
        3, NULL, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Mystique@2025
        'mystique', '$2b$12$skiqizoOc3Frh/cbcy2ybOEyKRG1kTOrLMfVN6fKCZLmKc5/z//VS',
        'raven', 'Darkhölme', 1, 'mystique@cjl.com', '+12345678924', '002 Xmen St, SF', 2,
        3, 8, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Wolverine@2025
        'wolverine', '$2b$12$88U68dszOcF31SHPKWh6yOCVu1/DP4a4KR69WjVjxqLklR3eedhke',
        'james', 'howlett', 0, 'wolverine@cjl.com', '+12345678925', '003 Xmen St, SF', 16,
        3, 8, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Phoenix@2025
        'phoenix', '$2b$12$4DQjsUV25xHZtubHM0n9UuWF1pMV7vuxgyV3pryddVkyaYZPr40By',
        'jean', 'grey', 1, 'phoenix@cjl.com', '+12345678926', '004 Xmen St, SF', 6,
        3, 9, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Beast@2025
        'beast', '$2b$12$/FCCfP6nNOMB/E1TqqC/MO.u/BsOEa4X8JmwscdLtWJTKOZPAHj6S',
        'henry', 'mccoy', 0, 'beast@cjl.com', '+12345678927', '005 Xmen St, SF', 6,
        3, 9, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Magneto@2025
        'magneto', '$2b$12$.W6jSVcW/ARvhiiK5xe//ecYRCSkqY4paxVMPKwdsKz5IeznKI7Ma',
        'max', 'eisenhardt', 0, 'magneto@cjl.com', '+12345678928', '006 Xmen St, SF', 6,
        3, 9, '2025-01-04', 200000.00, 'usd', 'en-us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),

    -- financial department

    (
        -- password: AliceCobuildTheCompany@1
        'alice_cfo', '$2b$12$rstVqLCdNFPus8WmJj3A1uy/pxtqzu/4Gjv3oxieQ.EjcHdxTfLUS',
        'alice', 'jackson', 1, 'alice_cfo@cjl.com', '+12345678929', '002 Main St, LA', 34,
        4, NULL, '2025-01-01', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        FALSE, 'cfo'
    ),
    (
        -- password: CaptainAmerica@2025
        'captain_america', '$2b$12$DmQOzmjRhno3ZAprWK5yZerxI4hQOO974nRpsrhc0ySc.Wv4Y4IVi',
        'steve', 'rogers', 0, 'captain_america@cjl.com', '+12345678930', '001 Marvel St, LA', 2,
        4, NULL, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'cfo'
    ),
    (
        -- password: IronMan@2025
        'iron_man', '$2b$12$BGegCT6ysZYs2c4aH.xyEeSeM2c9H9esxsMsd8Qh.Jeb4Vk883GwC',
        'tony', 'stack', 0, 'iron_man@cjl.com', '+12345678931', '002 Marvel St, LA', 17,
        4, 10, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Thor@2025
        'thor', '$2b$12$w6Tzk5.CpXA959WTQGJRnuoomI1rbbR61I7.7gs4527vkOVf8dLra',
        'thor', 'thor', 0, 'thor@cjl.com', '+12345678932', '003 Marvel St, LA', 1,
        4, 10, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: BlackWidow@2025
        'black_widow', '$2b$12$H6ffT4i/kwZEO3SOKajfFeW4fK6C4FpxrxbilZ.luGv0M2GM1Oodm',
        'natasha', 'romanoff', 1, 'black_widow@cjl.com', '+12345678933', '004 Marvel St, LA', 1,
        4, 10, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: YelenaBelova@2025
        'yelena_belova', '$2b$12$M3/nwYA5lVjbuOcNNDW9COqzFh1glUyWgPLxbbdRk4w3rtC871j0y',
        'yelena', 'belova', 1, 'yelena_belova@cjl.com', '+12345678934', '005 Marvel St, LA', 1,
        4, 11, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: BuckyBarnes@2025
        'bucky_barnes', '$2b$12$JxXVlyYMKOM3NHlR7EOIWOrBHdfuTgOq372nVc6FH8xg3QVuR5ld6',
        'bucky', 'barnes', 0, 'bucky_barnes@cjl.com', '+12345678935', '006 Marvel St, LA', 7,
        4, 11, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Hulk@2025
        'hulk', '$2b$12$.icyPyFDdjhiDNMqhsaHquoBCbKUFd9BO6tfS/uxflEWGqWAAo80S',
        'bruce', 'banner', 0, 'bruce_banner@cjl.com', '+12345678936', '007 Marvel St, LA', 34,
        4, 11, '2025-01-04', 250000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),

    -- marketing department

    (
        -- password: Wanda@2025
        'wanda_maximoff', '$2b$12$djxysZ5Dj96xQIklP0.ccOO5rT3nKawTESMY9OrU02K9CPt73wYie',
        'wanda', 'maximoff', 1, 'wanda_maximoff@cjl.com', '+12345678937', '008 Marvel St, LA', 6,
        5, NULL, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'cmo'
    ),
    (
        -- password: Vision@2025
        'vision', '$2b$12$yvLfx/7nAkIkYOAnqQiE5O8WpOHYH77oHLd/.f8CFnu1n7USK8/1q',
        'vision', 'vision', 3, 'vision@cjl.com', '+12345678938', '009 Marvel St, LA', 7,
        5, 12, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: Falcon@2025
        'falcon', '$2b$12$ZAtvCEnVNZIuN/6J9zlg4OcjFW0bU6wBkZgntJym7q1R9s.HNUjXq',
        'sam', 'wilson', 0, 'falcon@cjl.com', '+12345678939', '010 Marvel St, LA', 11,
        5, 12, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: SpiderMan@2025
        'spider_man', '$2b$12$FlqdmEz5fFhBK4jRYedpKuYVEaqnON9IT4hGkOmpGQmdBZUYuLqlG',
        'peter', 'parker', 0, 'spider_man@cjl.com', '+12345678940', '011 Marvel St, LA', 1,
        5, 12, '2025-01-04', 3000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'intern'
    ),
    (
        -- password: BlackPanther@2025
        'black_panther', '$2b$12$WW/EhXPVQf2deDwdOKemfudJFBaecc21rS2Yq4K9TnnXn/rv5QVYu',
        't', 'challa', 0, 'black_panther@cjl.com', '+12345678941', '012 Marvel St, LA', 6,
        5, 13, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: IAmGroot@2025
        'groot', '$2b$12$bHKL1aRBaqiCcekOEvVJbuccgsMJbgdscYYCbRpzeKmZWumRHEGwS',
        'groot', 'groot', 3, 'i_am_groot@cjl.com', '+12345678942', '013 Marvel St, LA', 1,
        5, 13, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Rocket@2025
        'rocket', '$2b$12$XyqascqmOton9w2pFIjFi.ZXlLUwvLGM1E4JyP1KMCoica7WeGism',
        'rocket', 'rocket', 0, 'rocket@cjl.com', '+12345678943', '014 Marvel St, LA', 1,
        5, 13, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Gamora@2025
        'gamora', '$2b$12$bdUQOSyLx0mY2KKKAoi8jek.3Wju5STQaPGldcL8cfEaOZQT4nfaa',
        'gamora', 'gamora', 1, 'rocket@cjl.com', '+12345678944', '015 Marvel St, LA', 6,
        5, 14, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'manager'
    ),
    (
        -- password: StarLord@2025
        'star_lord', '$2b$12$f1DcZutEQgIWKEjXSIF0SeASLVx9tQ/EeR2m8T4pBG4ZZchj45EOq',
        'peter', 'quill', 0, 'star_lord@cjl.com', '+12345678945', '016 Marvel St, LA', 7,
        5, 14, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    ),
    (
        -- password: Thanos@2025
        'thanos', '$2b$12$QGWvkxBywUeODe3tApL9GeqNr2Z.Qdq1Y9naJwJmHPsEHW66lOjEO',
        'thanos', 'thanos', 0, 'thanos@cjl.com', '+12345678946', '017 Marvel St, LA', 6,
        5, 14, '2025-01-04', 300000.00, 'usd', 'en_us', NULL, NULL, 'usa', NULL,
        TRUE, 'employee'
    )

    -- strategy & innovation department

    (
        -- password: ErenYeager@2025
        'eren_yeager', '$2b$12$tvd93mqLhAbYl6c20VxtIOGNjjSQYrq/S8MdfEIVCsyNaKimReBDO',
        'eren', 'yeager', 0, 'eren_yeager@cjl.com', '+12345678947', '001 Attack on Titan St, LA', 7,
        6, NULL, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'cso'
    ),
    (
        -- password: MikasaAckerman@2025
        'mikasa_ackerman', '$2b$12$cFrajuXW1DFcZrfKx/K3yOczl/cPgN5cxzKqrJ3MeArJAOwNawJZ6',
        'mikasa', 'ackerman', 1, 'mikasa_ackerman@cjl.com', '+12345678948', '002 Attack on Titan St, LA', 6,
        6, 15, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: ArminArlert@2025
        'armin_arlert', '$2b$12$8vnkqZS460GDsOlW0IGy.eJrXZsZVNGRR2Hiu5l3AQEjSssInRhNq',
        'armin', 'arlert', 0, 'armin_arlert@cjl.com', '+12345678949', '003 Attack on Titan St, LA', 7,
        6, 15, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: ReinerBraun@2025
        'reiner_braun', '$2b$12$4z7IAroEZe8EMXVVF2nJR.9lFFWtAXIfQ60nTmD3ysHEc8r8Au.AC',
        'reiner', 'braun', 0, 'reiner_braun@cjl.com', '+12345678950', '004 Attack on Titan St, LA', 7,
        6, 15, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: BertholdtHoover@2025
        'berthold_hoover', '$2b$12$iF9nkzYAlrn0Fk3YEojnA.aCkcYY/r7l4iTCJ8b7MN3h33oU8pVGW',
        'berthold', 'hoover', 0, 'berthold_hoover@cjl.com', '+12345678951', '005 Attack on Titan St, LA', 7,
        6, 16, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: AnnieLeonhart@2025
        'annie_leonhart', '$2b$12$mHmJR4oBHp9nc8dH3PGFkOvsjvtJW/1wAXazedkRLdRQHIw7BxTTq',
        'annie', 'leonhart', 0, 'annie_leonhart@cjl.com', '+12345678952', '006 Attack on Titan St, LA', 7,
        6, 16, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: ConnieSpringer@2025
        'connie_springer', '$2b$12$YpyA7pzsySdTvXbB41ISWea2R6dRIt93685P9BVhad4cKKPQ4C7Am',
        'connie', 'springer', 0, 'connie_springer@cjl.com', '+12345678953', '007 Attack on Titan St, LA', 13,
        6, 16, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),

    -- human resources department

    (
        -- password: SashaBlouse@2025
        'sasha_blouse', '$2b$12$TQahxBJVM0kxukjn/JJpDOZa3tTWwjD9.iWuDp2jX37C7vS1il9Zm',
        'sasha', 'blouse', 1, 'sasha_blouse@cjl.com', '+12345678954', '008 Attack on Titan St, LA', 6,
        7, NULL, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'chro'
    ),
    (
        -- password: HistoriaReiss@2025
        'historia_reiss', '$2b$12$s2liH34KmvxaSWK3czu35.anBqGF3/.N2y4Amn9pdDh5cTFJP0Rdq',
        'historia', 'reiss', 1, 'historia_reiss@cjl.com', '+12345678955', '009 Attack on Titan St, LA', 6,
        7, 17, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: ChristaLenz@2025
        'christa_lenz', '$2b$12$gtT4RoAUTpFxbFDfpKcgeekRFifNvHIxInD9klvLT4fhJrl0h75U2',
        'christa', 'lenz', 1, 'christa_lenz@cjl.com', '+12345678956', '010 Attack on Titan St, LA', 6,
        7, 17, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: ymir@2025
        'ymir', '$2b$12$seYW7zIf6LzLMpkpipRuoe3erlh0gwYNCt9FpVSQ9psnRTYtSqo0K',
        'ymir', 'ymir', 1, 'ymir@cjl.com', '+12345678957', '011 Attack on Titan St, LA', 6,
        7, 17, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: FlochForster@2025
        'floch_forster', '$2b$12$hSh1TxbH4IEco5fqpIfEgOguEzlgV5nSv5S4XCmc9ZhRprZtOTyvK',
        'floch', 'forster', 0, 'floch_forster@cjl.com', '+12345678958', '012 Attack on Titan St, LA', 6,
        7, 18, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: ErwinSmith@2025
        'erwin_smith', '$2b$12$RnClpE1SecGPpL2YJDXNp.DANFAo9GC8BJl.9Ru3hpwbLpIDpliE6',
        'erwin', 'smith', 0, 'erwin_smith@cjl.com', '+12345678959', '013 Attack on Titan St, LA', 6,
        7, 18, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: LeviAckerman@2025
        'levi_ackerman', '$2b$12$GkaAdrtAx3iZVnv8quCZVOm9HP88GH9sPY9SMmoWGtxNtx696zgyW',
        'levi', 'ackerman', 0, 'levi_ackerman@cjl.com', '+12345678960', '014 Attack on Titan St, LA', 6,
        7, 18, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: HangeZoe@2025
        'hange_zoe', '$2b$12$2xNALeW4zlfOsWJm8XVr4eIwJn7ZKsttY9oiaZRctsPkWIlqXu09m',
        'hange', 'zoe', 1, 'hange_zoe@cjl.com', '+12345678961', '015 Attack on Titan St, LA', 6,
        7, 19, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: MarloFredenburg@2025
        'marlo_fredenburg', '$2b$12$8BbdwiVNiOR/5iEB/9VLi.aOZ.cPVzmzRf.641SPJ98GER.XpedO.',
        'marlo', 'fredenburg', 0, 'marlo_fredenburg@cjl.com', '+12345678962', '016 Attack on Titan St, LA', 6,
        7, 19, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: HitchDreyse@2025
        'hitch_dreyse', '$2b$12$q0XGYaR4EzFxiZfVIGnSR.QKUNltsgs4OyyvgxkSMRHAcXLcGsVu2',
        'hitch', 'dreyse', 1, 'hitch_dreyse@cjl.com', '+12345678963', '017 Attack on Titan St, LA', 6,
        7, 19, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),

    -- IT department

    (
        -- password: YmirFritz@2025
        'ymir_fritz', '$2b$12$Y5pmyXuClJAsU32X4k8S7.ZM73K1.VhyvY1m7nWuc4IWUSW0yEDYG',
        'ymir', 'fritz', 1, 'ymir_fritz@cjl.com', '+12345678964', '018 Attack on Titan St, LA', 6,
        8, NULL, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'cio'
    ),
    (
        -- password: MariaFritz@2025
        'maria_fritz', '$2b$12$kpjmFJnuN4xXGibmJBLAPuJBlOxZpg2TStAythCI1pxWsF7wyQ7f.',
        'maria', 'fritz', 1, 'maria_fritz@cjl.com', '+12345678965', '019 Attack on Titan St, LA', 6,
        8, 20, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: RoseFritz@2025
        'rose_fritz', '$2b$12$0yD4dgYep9U8SokGElPUx.7EGYrj2ozrmpQI.8bcrlwxxB3/ziDiq',
        'rose', 'fritz', 1, 'rose_fritz@cjl.com', '+12345678966', '020 Attack on Titan St, LA', 6,
        8, 20, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: SinaFritz@2025
        'sina_fritz', '$2b$12$6.wsks4VCm/MiGrwtMhKqunvid7r97UsojXIoGTcMiFneYq0lLHGy',
        'sina', 'fritz', 1, 'sina_fritz@cjl.com', '+12345678967', '021 Attack on Titan St, LA', 6,
        8, 20, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: GrishaYeager@2025
        'grisha_yeager', '$2b$12$RDOtgJkTsO2K7F.EQbOOOumP6Oyu8agCFMBdsrVtkjzIf0duQmjjO',
        'grisha', 'yeager', 0, 'grisha_yeager@cjl.com', '+12345678968', '022 Attack on Titan St, LA', 6,
        8, 21, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: CarlaYeager@2025
        'carla_yeager', '$2b$12$IWPCYgfbc1KapNhbjhxshu2qWcgf4PuAneYVZoqGGc6oxVTEZq7Rq',
        'carla', 'yeager', 1, 'carla_yeager@cjl.com', '+12345678969', '023 Attack on Titan St, LA', 6,
        8, 21, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: ZekaYeager@2025
        'zeka_yeager', '$2b$12$N36Da0ZZah3y9lR6XbCCJOzFVe9oLh/.iaKshCP76gkxvFFRinch2',
        'zeka', 'yeager', 0, 'zeka_yeager@cjl.com', '+12345678970', '024 Attack on Titan St, LA', 6,
        8, 21, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: PieckFinger@2025
        'pieck_finger', '$2b$12$xIPB3YMuXOTM/xyUlZlmCuguM4MA4uzqKduRkLWNGHFyymNJUP7zS',
        'pieck', 'finger', 1, 'pieck_finger@cjl.com', '+12345678971', '025 Attack on Titan St, LA', 6,
        8, 22, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: GabiBraun@2025
        'gabi_braun', '$2b$12$oQ.Epx0NPCx78Oisz0J1aeIH1ItgsDF9BlQl1XTnvGwteDlenHK0.',
        'gabi', 'braun', 1, 'gabi_braun@cjl.com', '+12345678972', '026 Attack on Titan St, LA', 6,
        8, 22, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: FalcoGrice@2025
        'falco_grice', '$2b$12$JQ80rdF0pkgxGNa1B4zEs.rCQu.RBCXFqo3/TIKoNsF6YHtuMk1yK',
        'falco', 'grice', 1, 'falco_frice@cjl.com', '+12345678973', '027 Attack on Titan St, LA', 6,
        8, 22, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),

    -- compliance & risk department

    (
        -- password: Yelena@2025
        'yelena_aot', '$2b$12$3hCFM3B3PESvFz4bB9tfeOzh4dpLCtGtuIFkenLo2yNskbApMQRw2',
        'yelena', 'yelena', 1, 'yelena_aot@cjl.com', '+12345678974', '028 Attack on Titan St, LA', 6,
        9, NULL, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'cco'
    ),
    (
        -- password: Onyankopon@2025
        'onyankopon', '$2b$12$DkKMwp8gH5iW/QhkY.5h5.MiMycLrWD1JXnhNU6kB9stGDQh7Zzam',
        'onyankopon', 'onyankopon', 0, 'onyankopon@cjl.com', '+12345678975', '029 Attack on Titan St, LA', 6,
        9, 23, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: JessicaJones@2025
        'jessica_jones', '$2b$12$E9P.MMCVc7b8SiXgsGt6sO2x.N.hUNjGpVrPdlTiqbgJ2//WVWpLG',
        'jessica', 'jones', 1, 'jessica_jones@cjl.com', '+12345678976', '001 Jessica Jones St, LA', 6,
        9, 23, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: LukeCage@2025
        'luke_cage', '$2b$12$vfpyLsZ6HYLp.fLU08nCW.gEphmooo1G5Ince9dVIGMD.KdoVRECy',
        'luke', 'cage', 0, 'luke_cage@cjl.com', '+12345678977', '002 Jessica Jones St, LA', 6,
        9, 23, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password: PatriciaWalker@2025
        'patricia_walker', '$2b$12$zutR4zvqXUAufL2CFfrw0eOLyawT3Q1p3DEFjrNb6M1Xv5UGaytt.',
        'patricia', 'walker', 1, 'patricia_walker@cjl.com', '+12345678978', '003 Jessica Jones St, LA', 6,
        9, 24, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'manager'
    ),
    (
        -- password: Daredevil@2025
        'daredevil', '$2b$12$r3eDonEmKdx7oPIy7QBeJ.hdKB/2xQvCZpTyaSQF8Q/thMWEJlFdq',
        'matt', 'murdock', 0, 'daredevil@cjl.com', '+12345678979', '001 Defenders St, LA', 6,
        9, 24, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    ),
    (
        -- password:  IronFist@2025
        'iron_fist', '$2b$12$lzOdeIzrsaKt1xI9u7/jMOZF95u1D5NVrTEo/NrVos6T2jpYzbsiu',
        'danny', 'rand', 1, 'iron_fist@cjl.com', '+12345678980', '002 Defenders St, LA', 6,
        9, 24, '2025-01-05', 300000.00, 'usd', 'en_us', 'ja_jp', NULL, 'usa', 'jpn',
        TRUE, 'employee'
    );