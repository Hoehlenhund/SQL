-- TEIL 1
select *

/* * = Alle Atribute mit allen Zeilen, Collumn ID
 Auch möglich mit , seperiert die Klassennamen rausschreiben

Welche Tabelle */

from employees;

-- Ab 2 Anweisungen ist ein ; nötig
-- Nur zweites selekt einfach courser zu dem Punkt legen oder markieren
select last_name, FIRST_NAME
from employees;

-- TEIL 2
-- 2.1
select DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
from DEPARTMENTS;

-- 2.2
select employee_id, LAST_NAME, JOB_ID, hire_date AS Anfangsdatum
from EMPLOYEES;

-- 2.3
select job_id
from EMPLOYEES;

-- 2.4
select employee_id AS "Personalnummer #", LAST_NAME AS "Angestellter", JOB_ID AS "Tätigkeit", hire_date AS "Anfangsdatum"
from EMPLOYEES;

/* 2.5 Schreiben Sie eine Abfrage, die für alle Angestellten den Namen, die Tätigkeit und das Gehalt
enthält. Konkatenieren Sie dabei die Attribute, jeweils getrennt durch ein Komma und ein
Leerzeichen. Geben Sie der Spalte die Überschrift Angestellte Tätigkeit Gehalt.*/
select LAST_NAME || ', ' || job_id || ', '|| salary AS "Angstellte, Tätigkeit, Gehalt"
from employees;

-- 3
/* 3.1 Schreiben Sie eine Abfrage, die für den Angestellten mit der Personalnummer 176 den Nachnamen
und die Abteilungsnummer ausgibt. */

select last_name, department_id
from Employees
WHERE employee_id = 176;

/* 3.2 Schreiben Sie eine Abfrage, die alle Angestellten ausgibt, deren Gehalt nicht zwischen 5000 $ und
12000 $ liegt. */
select last_name, salary
from employees
where  salary NOT BETWEEN 5000 AND 12000;

-- 3.3
select last_name, job_id, hire_date
from employees
where last_name = 'Matos' OR last_name = 'Taylor';

/* 3.4 Geben Sie für alle Angestellten in den Abteilungen 20 und 50 den Nachnamen und die
Abteilungsnummer aus. Sortieren Sie die Ausgabe in der aufsteigenden Reihenfolge des
Nachnamens. */

select last_name, department_id
from employees
where department_id = 20 OR department_id = 50
ORDER BY last_name ASC;

/* 3.5 Schreiben Sie eine Abfrage, die alle Angestellten der Abteilungen 20 und 50 ausgibt, die zwischen
5000 $ und 12000 $ verdienen. Geben Sie den beiden Spalten Nachname und Gehalt die
Aliasnamen Angestellter und Monatliches Gehalt. */
select last_name AS "Angestellter", salary AS "Monatliches Gehalt"
from employees
WHERE department_id = 20 AND salary BETWEEN 5000 AND 12000 OR department_id = 50 AND salary BETWEEN 5000 AND 12000;

/* 3.6 Schreiben Sie eine Abfrage, die den Nachnamen und die Tätigkeit aller Angestellten ausgibt, die
keinen Vorgesetzten haben.*/

select last_name, job_id
from employees
where manager_id IS NULL;

/* 3.7 Schreiben Sie eine Abfrage, die für alle Angestellten, die eine Provision bekommen, den
Nachnamen, das Gehalt und die Provision ausgibt. Sortieren Sie die ausgegebenen Daten dabei
absteigend nach Gehalt und Provision.
Verwenden Sie die für die Angabe der Sortierung die numerische Position der Spalten. */
select last_name, salary, commission_pct
from employees
where commission_pct IS NOT NULL
ORDER BY salary DESC;

/* 3.8 Geben Sie alle Angestellten aus, deren Nachname an der dritten Position ein 'a' oder an einer
beliebigen Position ein 'e' enthalten. */
select last_name
from employees
where lower(last_name) like '__a%' or lower(last_name) like '%e%'; 

/* 3.9 Geben Sie den Nachnamen, die Tätigkeit und das Gehalt aller Angestellten aus, deren Tätigkeit
'Sales Representative' oder 'Stock Clerk' ist und deren Gehalt nicht 2500 $, 3500 $ oder 7000 $
beträgt. */
select last_name, job_id, salary
from employees
where lower(job_id) LIKE 'sa_rep' OR lower(job_id) LIKE 'st_clerk' AND (salary NOT IN (2500, 3500, 7000));

/*3.10 Geben Sie den Nachnamen, das Gehalt und die Provision aller Angestellten aus, die eine Provision
von 20% erhalten. Vergeben Sie für die drei Spalten die Aliasnamen Angestellter, Monatliches
Gehalt und Provision. */
select last_name AS "Angestellter", salary AS "Monatliches Gehalt", commission_pct AS "Provision"
from employees
where commission_pct LIKE 0.2;


/*4. 1 Schreiben Sie eine Abfrage, um das aktuelle Systemdatum anzuzeigen, geben Sie der Spalte die
Überschrift 'Datum'. (Bitte beachten Sie, dass es sich bei der Ausgabe um das Systemdatum der
Datenbank handelt, nicht das Ihres Rechners, von dem aus die Abfrage ausgeführt wird.)*/
SELECT to_char(SYSDATE, 'dd.mm.yyyy')
from dual;
/*dual = Default Datentabelle - 1 Zeile 1 Spalte ohne Inhalt
/* ddd/yyyy = Nr. des Tages im Kalenderjahr


/*Aufgabe 4.2
Schreiben Sie eine Abfrage, die für jeden Angestellten die Attribute Personalnummer, Nachname,
Gehalt und das um 15,5% erhöhte Gehalt (als ganze Zahl) ausgibt. Geben Sie der letzten Spalte
den Aliasnamen Neues Gehalt nach Erhöhung*/
select job_id AS "Personalnummer", last_name AS "Nachname", salary, ROUND((salary * 0.155)+salary) AS "Neues Gehalt nach Erhöhung"
from employees;


/*Aufgabe 4.3
Erweitern Sie Ihre Abfrage aus Aufgabe 4.2 um eine Spalte mit der Überschrift Erhöhung. Diese
Spalte enthält die Differenz zwischen dem Gehalt vor und nach der Erhöhung.*/
select job_id AS "Personalnummer", last_name AS "Nachname", salary, ROUND((salary * 0.155)+salary) AS "Neues Gehalt nach Erhöhung",
ROUND(salary * 0.155) AS "Erhöhung"
from employees;


/*Aufgabe 4.4
Schreiben Sie eine Abfrage, die für alle Angestellten, deren Nachname mit 'J', 'A' oder 'M' beginnt,
die folgenden Werte ausgibt: Nachname mit dem ersten Buchstaben großgeschrieben, Länge
(Anzahl der Zeichen) des Nachnamens.
Geben Sie jeder Spalte eine aussagekräftige Bezeichnung und sortieren Sie die Ausgabe nach dem
Nachnamen.*/
select last_name, LENGTH(last_name)
from employees
where (last_name) like '%J%' or (last_name) like '%A%' or (last_name) like '%M%'; 


/*Aufgabe 4.5
Schreiben Sie eine Abfrage, die für alle Angestellten in der Abteilung 90 die Dauer ihrer
Beschäftigung ausgibt. Geben Sie jeweils den Nachnamen, die Anzahl der Monate und die Anzahl
der gearbeiteten Wochen zwischen heute und dem Anstellungsdatum aus. Vergeben Sie für die drei
Spalten folgende Aliasnamen:
• Angestellter
• Gearbeitete Monate - Die Ausgabe der Monate soll in ganzen Monaten erfolgen, gerundet
jeweils auf die nächste ganze Anzahl von Monaten.
• Beschäftigungsdauer - Die Ausgabe der Wochen soll in ganzen Wochen erfolgen,
abgeschnitten auf die jeweils vollständig gearbeitete Woche.
Die Ausgabe ist nach der Dauer der Anstellung zu sortieren, so dass der dienstälteste Angestellte
zuerst ausgegeben wird.*/
select last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS "Gearbeitete Monate", ROUND((SYSDATE - hire_date)/7) AS "Beschäftigungsdauer"
from employees
where department_ID = 90; 


/*Aufgabe 4.6
Schreiben Sie eine Abfrage, die für alle Angestellten den Namen und das Gehalt ausgibt.
Formatieren Sie die Ausgabe des Gehalts so, dass immer 15 Zeichen ausgegeben werden, wobei
die freien Stellen mit dem '€'-Zeichen aufzufüllen sind. Diese Spalte soll den Aliasnamen Gehalt
erhalten.*/
select last_name, LPAD(salary, 15, '€') AS "Gehalt"
from employees;

/*Aufgabe 4.7 TESTATAUFGABE
Schreiben Sie eine Abfrage, die für alle Angestellten die ersten 8 Zeichen des Nachnamens ausgibt.
Hängen Sie hinter dem Nachnamen eine gewisse Anzahl von '*' an, wobei pro 1000 $ Gehalt ein '*'
stehen soll. Geben Sie der Spalte die Überschrift Angestellte_und_Ihr_Gehalt und sortieren Sie
die Ausgabe absteigend nach dem Gehalt.*/
/* Decode, Case */
select RPAD(last_name, 8, ' ') || LPAD(salary, 15, (CASE(salary %1000 !=0, '*')ELSE('_')) AS "Angestellte_und_Ihr_Gehalt"
from employees
ORDER BY salary DESC;

/* Tabulator?       Rechnen? */

select RPAD(SUBSTR(last_name, 1, 8), 10, ' ') || LPAD('*', salary/1000, '*') AS "Angestellte_und_Ihr_Gehalt"
from employees
ORDER BY salary DESC;


/*Kapitel 5 Konvertierungsfunktionen und bedingte Ausdrücke

Aufgabe 5.1
Schreiben Sie eine Abfrage. Die Ergebnisspalte soll die Überschrift Wunschgehalt erhalten. Für
jeden Angestellten geben Sie folgendes aus:
Nachname hat ein monatliches Gehalt von Gehalt, möchte aber das Dreifache: 3*Gehalt */

SELECT last_name    || ' hat ein monatliches Gehalt von'
                    || TO_CHAR(salary, '$99G999D99') 
                    || ', möchte aber das Dreifache:' 
                    || TO_CHAR(salary*3, '$99G999D99') AS "Wunschgehalt"
FROM employees;


/*Aufgabe 5.2
Geben Sie für jeden Angestellten den Nachnamen, das Anstellungsdatum und das Datum für die
Wiedervorlage seiner Gehaltseingruppierung aus. Bei diesem Datum handelt es sich um den ersten
Montag sechs Monate nach Arbeitsbeginn. Die Spalte soll folgendermaßen formatiert werden:
Montag, der 1. Oktober 2018

Die letzte Spalte soll die Überschrift Wiedervorlage erhalten.*/

SELECT last_name, hire_date, TO_CHAR(ADD_Months(NEXT_DAY(hire_date, 1),6), 'fm"Montag, der" dd. Month yyyy') AS "WIEDERVORLAGE"
FROM employees;

/*
Aufgabe 5.3
Schreiben Sie eine Abfrage, die für jeden Angestellten den Nachnamen, das Anstellungsdatum und
den Wochentag seines Arbeitsbeginns ausgibt. Vergeben Sie für diese Spalte den Aliasnamen
Wochentag. Sortieren Sie die Ausgabe so, dass der erste Wochentag Montag ist. */

SELECT last_name, hire_date, TO_CHAR(hire_date, 'DAY')
FROM employees;

/*Aufgabe 5.4 TESTATAUFGABE
Geben Sie für jeden Angestellten den Nachnamen und die Provision aus. Erhält ein Angestellter
keine Provision soll für ihn in der zweiten Spalte Keine Provision angezeigt werden. Als Überschrift
vergeben Sie die Bezeichnung Höhe der Provision.*/

SELECT last_name, NVL2(TO_CHAR(commission_pct), TO_CHAR(commission_pct), 'keine Provision') AS "Höhe der Provision"
from employees;

/*Aufgabe 5.5
Schreiben Sie eine Abfrage, die für alle Angestellten die Tätigkeit und die Gehaltsgruppe ausgibt.
Vergeben Sie für die zwei Spalten entsprechende Aliasnamen.
Für die Eingruppierung gilt folgende Regel:
Tätigkeit Gehaltsgrupppe
AD_PRES A
ST_MAN B
IT_PROG C
SA_REP D
ST_CLERK E
Allen anderen 0*/

SELECT job_id,                               CASE job_id WHEN 'AD_PRES'     THEN 'A' 
                                                         WHEN 'ST_MAN'      THEN 'B' 
                                                         WHEN 'IT_PROG'     THEN 'C'
                                                         WHEN 'SA_REP'      THEN 'D'
                                                         WHEN 'ST_CLERK'    THEN 'E' ELSE '0'
                                                    END
                                                    AS "GRADE"
from employees;


/*Kapitel 6 Zusammenfassen von Daten durch die Verwendung von Gruppen-Funktionen*/
/*Aufgabe 6.1
Schreiben Sie eine Abfrage, die das höchste Gehalt, das geringste Gehalt, die Summe der Gehälter
und den Durchschnittslohn aller Angestellten ausgibt. Die Ausgabe der ermittelten Werte soll auf die
nächste ganze Zahl gerundet werden. Für die Spalten in Ihrer Ausgabe vergeben Sie bitte
entsprechende Bezeichnungen.*/

SELECT MAX(salary) AS "Höchste", MIN(salary) AS "Geringste", SUM(salary) AS "Summe", AVG(salary) AS "Durchschnitt"
FROM employees;


/* AUFGABE 6.7 */
/*Schreiben Sie eine Abfrage, die zum einen die Gesamtzahl der Angestellten ausgibt. Zum anderen 
soll für die Kalenderjahre 1995, 1996, 1997 und 1998 jeweils die Anzahl der Angestellten aus-
gegeben werden, die in diesen Jahren eingestellt wurden. Geben Sie den 5 Spalten aussagekräfite Überschriften */

SELECT COUNT(employee_id) AS "TOTAL",
COUNT((CASE WHEN TO_CHAR(hire_date, 'YYYY') ='1995' THEN '1' END)) AS "1995",
count((CASE WHEN TO_CHAR(hire_date, 'YYYY') ='1996' THEN '3' END)) AS "1996",
COUNT((CASE WHEN TO_CHAR(hire_date, 'YYYY') ='1997' THEN '1' END)) AS "1997",
COUNT((CASE WHEN TO_CHAR(hire_date, 'YYYY') ='1998' THEN '1' END)) AS "1998"
FROM employees;



/* Aufgabe 6.8 
Schreiben Sie eine Abfrage, die für jede Berufsgruppe deren Bezeichnung, sowie, in Abhängigkeit von der Abteilung,
die Summe der Gehälter und das Gesamtgehalt über alle Angestellte ausgibt. Für die Ausgaben sollen die Abteilungen
20, 50, 80 und 90 berücksichtigt werden. Die Spalten der Überschriften sollen aussagekräftige Bezeichnungen erhalten. */
SELECT  job_id AS "Beruf", last_name,
        SUM(decode(department_id,20,salary, 0)) AS "Abt. 20",
        SUM(decode(department_id,50,salary, 0)) AS "Abt. 50",
        SUM(decode(department_id,80,salary, 0)) AS "Abt. 80",
        SUM(decode(department_id,90,salary, 0)) AS "Abt. 90",
        SUM(salary) AS "Total"
FROM employees
GROUP BY job_id, last_name;


/*Aufgabe 7.8
Erstellen Sie eine Liste aller Angestellten, die bereits vor Ihrem Vorgesetzten beschäftigt waren. Zu jedem der gefundenen
Angestellten sind der Nachname, das Anfangsdatum, der Name des Managers sowie dessen Einstellungsdatum auszugeben. */
SELECT e.last_name AS "Nachname", e.hire_date AS "Anfangsdatum", m.last_name AS "Manager", m.hire_date AS "Anfangsdatum Manager"
FROM employees e
JOIN employees m
/*Verknüpfungsverbindung, wo sich die zwei Tabellen überschneiden*/
ON m.employee_id = e.manager_id
WHERE e.hire_date < m.hire_date;


/*Aufgabe 8.7 
Schreiben Sie eine Abfrage, die alle Angestellten ausgibt, die nach dem Angestellten mit dem
Namen 'Davies' eingestellt wurden. Anzugeben sind der Nachname und das Datum des
Arbeitsbeginns. Lösen Sie die Aufgabe einmal unter Verwendung eines JOINs und einmal mit einer
Unterabfrage.*/
SELECT e.last_name, e.hire_date
FROM employees e
JOIN employees d
--ON (e.hire_date > decode(d.last_name,'Davies',d.hire_date));
ON (d.last_name='Davies')
where (e.hire_date > d.hire_date);
;

/*Subqueries*/
SELECT last_name, hire_date
FROM employees
WHERE hire_date >   (SELECT hire_date
                    FROM employees
                    WHERE last_name = 'Davies');

/*Aufgabe 8.10
Ermitteln Sie unter allen Angestellten die, die keine Vorgesetztenfunktion ausüben. 

a. Lösen Sie die Aufgabe unter Verwendung des NOT EXISTS-Operators.
Alle Angestellten die keine manager_id haben! --> Nope, ManagerID heißt nur, dass sie einen vorgesetzten haben
*/

SELECT outer.last_name
FROM employees outer
WHERE NOT EXISTS   (SELECT 'x'
                    FROM EMPLOYEES inner
                    WHERE inner.manager_id = outer.employee_id)

ORDER BY last_name;


/*b*/

SELECT last_name
FROM employees
WHERE employee_id NOT IN (  SELECT nvl(manager_id,0)
                            FROM employees
                            WHERE manager_id IS NOT NULL
                            );


/* Aufgabe 9.3 */

SELECT job_id, department_id
FROM employees
WHERE department_id = 10 OR department_id = 50 OR department_id = 20
ORDER BY (CASE department_id
    WHEN 10 THEN 1
    WHEN 50 THEN 2
    WHEN 20 THEN 3
    END ) ASC;
    
    /* UNION sortiert automatisch, reihefolge der attribute */

        SELECT distinct job_id, department_id FROM employees
        WHERE department_id = 10
        UNION ALL
        
        SELECT distinct job_id, department_id  FROM employees
        WHERE department_id = 50
        UNION ALL
        
        SELECT distinct job_id, department_id  FROM employees
        WHERE department_id = 20;
/* MINUS und INTERSECT - mengenoperation , number .. number , usw.*/

/* Aufgabe 10.18 */
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES ('4', 'Newman', 'Chad', 'cnewman', '750');

UPDATE my_employee
SET last_name = 'Drexler', userid = 'bdrexler'
WHERE id = 3;

UPDATE my_employee
SET salary = '1000'
WHERE salary < 900;

DELETE FROM my_employee
WHERE last_name = 'Dancs';

/* SAVEPOINT Name: abc; */
COMMIT;

ROLLBACK;

DELETE FROM my_employee;

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES ('5', 'Ropeburn', 'Audry', 'aropebur', '1550');

SELECT * FROM my_employee;


/*12.5*/
CREATE OR REPLACE VIEW DEPT50
AS SELECT employee_id AS "EMPNO", last_name AS "EMPLOYEE", department_id AS "DEPTNO"
FROM employees
WHERE department_id = 50
WITH CHECK OPTION;

SELECT *
FROM DEPT50;

DROP VIEW DEPT50;