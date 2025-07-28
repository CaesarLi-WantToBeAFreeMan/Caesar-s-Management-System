# database data tables

## reference tables

### genders

* define gender choices

#### column settings

| settings          | `id`              | `name`         |
| :---------------: | :---------------: | :------------: |
| `type`            | `INT`             | `VARCHAR(50)`  |
| `UNSIGNED`        | ✅               | -              |
| `AUTO_INCREMENT`  | ✅               | -              |
| `PRIMARY KEY`     | ✅               | -              |
| `NOT NULL`        | ✅               | ✅            |
| `UNIQUE`          | ✅               | ✅            |
| `DEFAULT`         | -                 | -             |
| `COMMENT`         | unique gender ID  | gender name   |
| `INDEX`           | ❌               | ❌            |
| `FOREIGN KEY`     | ❌               | ❌            |

#### rows

| id    | name          |
| :---: | :-----------: |
| 0     | male          |
| 1     | demiboy       |
| 2	    | female        |
| 3	    | demigirl      |
| 4	    | two-spirit    |
| 5	    | cisgender     |
| 6	    | trnasgender   |
| 7	    | non-binary    |
| 8	    | genderqueer   |
| 9	    | genderfluid   |
| 10	| agender       |
| 11	| intersex      |
| 12	| androgynous   |
| 13	| third gender  |
| 14	| bigender      |
| 15	| trigender     |
| 16    | polygender    |

### diplomas

* define diploma choices

#### column settings

| settings          | `id`              | `abbreviation`        | `name`            |
| :---------------: | :---------------: | :-------------------: | :---------------: |
| `type`            | `INT`             | `VARCHAR(10)`         | `VARCHAR(50)`     |
| `UNSIGNED`        | ✅               | -                     | -                 |
| `AUTO_INCREMENT`  | ✅               | -                     | -                 |
| `PRIMARY KEY`     | ✅               | -                     | -                 |
| `NOT NULL`        | ✅               | ✅                    | ✅               |
| `UNIQUE`          | ✅               | ✅                    | ✅               |
| `DEFAULT`         | -                 | -                     | -                 |
| `COMMENT`         | unique diploma ID | diploma abbreviation  | full diploma name |
| `INDEX`           | ❌               | ❌                    | ❌               |
| `FOREIGN KEY`     | ❌               | ❌                    | ❌               |

#### rows

| id    | abbreviation  | name                                              |
| :---: | :-----------: | :-----------------------------------------------: |
| 0     | UHS           | under high school                                 |
| 1	    | HS	        | high school                                       |
| 2	    | AA	        | Associate of Arts                                 |
| 3	    | AS	        | Associate of Science                              |
| 4	    | AAS	        | Associate of Applied Science                      |
| 5	    | BA	        | Bachelor of Arts                                  |
| 6	    | BS	        | Bachelor of Science                               |
| 7	    | BFA	        | Bachelor of Fine Arts                             |
| 8	    | BBA	        | Bachelor of Business Administration               |
| 9	    | BSBA	        | Bachelor of Science in Business Administration    |
| 10    | BEng	        | Bachelor of Engineering                           |
| 11	| BSN	        | Bachelor of Science in Nursing                    |
| 12	| BEd	        | Bachelor of Education                             |
| 13	| BArch	        | Bachelor of Architecture                          |
| 14	| BMus	        | Bachelor of Music                                 |
| 15	| MA	        | Master of Arts                                    |
| 16	| MS	        | Master of Science                                 |
| 17	| MBA	        | Master of Business Administration                 |
| 18	| MFA	        | Master of Fine Arts                               |
| 19	| MEd	        | Master of Education                               |
| 20	| MSW	        | Master of Social Work                             |
| 21	| MPA	        | Master of Public Administration                   |
| 22	| MPH	        | Master of Public Health                           |
| 23	| MSN	        | Master of Science in Nursing                      |
| 24	| MEng	        | Master of Engineering                             |
| 25	| JD	        | Juris Doctor                                      |
| 26	| MD	        | Doctor of Medicine                                |
| 27	| DO	        | Doctor of Osteopathic Medicine                    |
| 28	| DVM	        | Doctor of Veterinary Medicine                     |
| 29	| DDS	        | Doctor of Dental Surgery                          |
| 30	| DMD	        | Doctor of Medicine in Dentistry                   |
| 31	| PharmD        | Doctor of Pharmacy                                |
| 32	| DPT	        | Doctor of Physical Therapy                        |
| 33	| PhD	        | Doctor of Philosophy                              |
| 34	| EdD	        | Doctor of Education                               |
| 35	| PsyD	        | Doctor of Psychology                              |
| 36	| DS	        | Doctor of Science                                 |
| 37	| ThD	        | Doctor of Theology                                |

### currencies

#### column settings


| settings          | `id`              | `abbreviation`        | `name`            |
| :---------------: | :---------------: | :-------------------: | :---------------: |
| `type`            | `INT`             | `VARCHAR(3)`          | `VARCHAR(50)`     |
| `UNSIGNED`        | ✅               | -                     | -                 |
| `AUTO_INCREMENT`  | ✅               | -                     | -                 |
| `PRIMARY KEY`     | ✅               | -                     | -                 |
| `NOT NULL`        | ✅               | ✅                    | ✅               |
| `UNIQUE`          | ✅               | ✅                    | ✅               |
| `DEFAULT`         | -                 | -                     | -                 |
| `COMMENT`         | unique currency ID | currency code ISO 4217  | currency full name |
| `INDEX`           | ❌               | ❌                    | ❌               |
| `FOREIGN KEY`     | ❌               | ❌                    | ❌               |

#### rows

| id    | name          |
| :---: | :-----------: |

### diplomas

#### column settings

| settings          | `id`              | `name`         |
| :---------------: | :---------------: | :------------: |
| `type`            | `INT`             | `VARCHAR(50)`  |
| `UNSIGNED`        | ✅               | -              |
| `AUTO_INCREMENT`  | ✅               | -              |
| `PRIMARY KEY`     | ✅               | -              |
| `NOT NULL`        | ✅               | ✅            |
| `UNIQUE`          | ✅               | ✅            |
| `DEFAULT`         | -                 | -             |
| `COMMENT`         | unique gender ID  | gender name   |
| `INDEX`           | ❌               | ❌            |
| `FOREIGN KEY`     | ❌               | ❌            |

#### rows

| id    | name          |
| :---: | :-----------: |
