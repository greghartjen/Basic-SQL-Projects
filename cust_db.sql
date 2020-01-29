CREATE TABLE tbl_persons (
		persons_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		persons_fname VARCHAR(50) NOT NULL,
		persons_lname VARCHAR(50) NOT NULL,
	);

CREATE TABLE tbl_contact (
		contact_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		contact_phone VARCHAR(50) NOT NULL,
		contact_address VARCHAR(50) NOT NULL,
		persons_id INT NOT NULL CONSTRAINT fk_persons_id FOREIGN KEY REFERENCES tbl_persons(persons_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

INSERT INTO tbl_persons
		(persons_fname, persons_lname)
		VALUES
		('greg', 'hart'),
		('beth', 'ann'),
		('cindy', 'lou'),
		('joe', 'green')
	;

INSERT INTO tbl_contact
		(contact_phone, contact_address, persons_id)
		VALUES
		('531-254-8679', '435 Wallaby Ln', 1),
		('531-545-9876', '5678 Sunset Dr', 2),
		('531-454-8432', '234 Mountain Pass Rd', 3),
		('531-231-9321', '8973 Country Club Dr', 4)
	;

SELECT persons_fname, persons_lname, contact_phone, contact_address 
FROM tbl_persons, tbl_contact  
WHERE tbl_persons.persons_id = tbl_contact.persons_id