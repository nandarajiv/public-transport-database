
# Public Transport Database

#### Anuhya Nallapati, Nanda Rajiv, Arghya Roy


## 

- `README.md`
- MySQL file `dumdum.mysql`, with a pre-populated database
- Python code `code.py`, with 16 different queries
- Phase 3 file containing the relational model `phase3.pdf`
- Screen-recorded video `demo.mp4`, demonstrating one query of each type - insert, update and delete (selected 14 to demonstrate, of a total of 16 queries designed) <br/> <br/>

## Steps:
1. (optional) On one terminal, launch MySQL on the system as `mysql -u root -p` and enter username and password. <br/>
2. On a new terminal, run the Python script as `python3 code.py`. <br/>
3. Enter MySQL username and password. <br/>
4. Press any key to continue. <br/>
5. Choose from the displayed list of queries. and enter the corresponding number to perform the query.
6. Exit with Query #17. <br/> <br/> 

## Queries: 
### 1. Hire a new driver
Requires inputs of the new driver's -
- Aadhar Card Number
- First Name 
- Middle Name
- Last Name
- Service Start Date 
- Age
- Gender
- Driver's License ID Number <br/>

Inserts the new driver into the database with the above details. <br/>
The tables modified are DRIVER and DRIVER_ALT.
<br/> <br/>

### 2. Sell a new ticket

Requires inputs of -
- Seat Number
- Mode of Transport
- Vehicle Registration Number
- Start Point Station
- End Point Station
- Current Time
- Price
- Conductor's Aadhar
- Passenger's Aadhar

Inserts the new ticket into the database with the above details. <br/> The table modified is TICKET.
<br/> <br/>
### 3. Add a new luggage item

Requires inputs of - 

- Passenger's Aadhar
- Conductor's Aadhar
- Vehicle's Registered State
- Vehicle's Registered Zone
- Vehicle's Registration Number
- Colour of the Luggage
- Shape of the Luggage
- Size of the Luggage

Inserts the new item of luggage into the database with the above details. <br/>
The table modified is LUGGAGE.
<br/> <br/>

### 4. Update preference of transport mode of a passenger

Requires inputs of -

- Passenger's Aadhar Card Number
- New preference for mode of transport

Updates the passenger's preference in the database as per the above details. <br/>
The table modified is PASS_PREF.
<br/> <br/>

### 5. Update the admin officer to whom a certain complaint is assigned

Requires inputs of -

- Complaint ID
- Aadhar Number of the new assigned admin officer

Updates the assigned admin officer of the complaint in the database as per the above details. <br/>
The table modifed is COMPLAINT.
<br/> <br/>

### 6. Fire a service staff member

Requires input of 

- Fired Service Staff member

Removes the corresponding complaint from database as per above details. <br/> 
The tables SERVICE_STAFF and SS_VEHICLE_TYPE.
<br/> <br/>

### 7. Remove a complaint

Requires input of - 

- Complaint ID

Removes the corresponding complaint from the database as per the details above. <br/>
The table modified is COMPLAINT.
<br/> <br/>

### 8. Find all drivers from a certain mode of transport

Requires input of -

- Mode of transport

Displays the drivers who drive a vehicle of that specific mode of transport. <br/>
The table from which this data is selected is DRIVER.
<br/> <br/>

### 9. Find all conductors getting paid by a certain admin officer

Requires input of -

- First Name
- Middle Name
- Last Name <br/>
of the admin officer.

Displays all conductors whose salary that admin officer is handling. <br/>
The tables from which this data is selected are CONDUCTOR and ADMIN_OFFICER.
<br/> <br/>

### 10. Display all passengers who are senior citizens (above 60 years old)

Displays all passengers who are over 60 years of age. <br/>
The tables from which this data is selected is PASSENGER.
<br/> <br/>

### 11. Display all vehicles with more than a certain number of seats for people with disabilities

Requires input of the minimum required number of seats for individuals with disabilities. Displays all vehicles that have greater than that number. <br/>
The table from which this data is selected is VEHICLE.
<br/> <br/>

### 12. Display all vehicles capable of speeding up more than 80 km/h

Displays all such vehicles whose maximum speed is greated than 80 km/ph. <br/>
The table from which this data is selected is VEHICLE.
<br/> <br/>

### 13. Who is the most experiences service staff member?

Displays the service staff member with the most experience by time, as per their service start date. <br/>
The table from which this data is selected is SERVICE_STAFF.
<br/> <br/>

### 14. Average price of a ticket

Displays the average price of a ticket. <br/>
The table from which this data is obtained is TICKET.
<br/> <br/>

### 15. Search driver based on License ID and display their name and Aadhar number

Requires input of -

- License ID Number of the driver

Displays the driver with the above license number. 
THe table from which this data is selected is DRIVER and DRIVER_ALT.
<br/> <br/>

### 16. Get complainant and assigned admin officer 

Requires input of -

- Complaint ID Number

Displays the name of complainant, and the name of the assigned admin officer.<br/>
The tables from which this data is selected is COMPLAINT and ADMIN_OFFICER.
<br/> <br/>

### 17. Logout

Bye :)
