import subprocess as sp
import pymysql
import pymysql.cursors


def insertLuggage():
    try:
        # Takes luggage details as input
        row = {}
        print("Enter new luggage's details: ")
        row["P_Aadhar"] = int(input("Passenger's Aadhar: "))
        row["C_Aadhar"] = int(input("Conductor's Aadhar: "))
        row["V_State"] = input("Vehicle's Registered State: ")
        row["V_Zone"] = input("Vehicle's Registered Zone: ")
        row["V_RegNo"] = int(input("Vehicle's 4-digit Registration No: "))
        row["Colour"] = input("Colour of luggage: ")
        row["Shape"] = input("Shape of luggage: ")
        row["Size"] = input("Size of luggage (Small/Medium/Large): ")

        query = "INSERT INTO LUGGAGE(P_Aadhar, C_Aadhar, V_State, V_Zone, V_RegNo, Colour, Shape, Size) VALUES('%d', '%d', '%s', '%s', '%d', '%s', '%s', '%s')" % (
            row["P_Aadhar"], row["C_Aadhar"], row["V_State"], row["V_Zone"], row["V_RegNo"], row["Colour"], row["Shape"], row["Size"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return


def insertTicket():
    try:
        # Takes ticket details as input
        row = {}
        print("Enter new ticket's details: ")
        row["Seat_Number"] = int(input("Seat Number: "))
        row["Mode_of_Transport"] = input("Mode of Transport: ")
        row["Vehicle_Registration_Number"] = int(
            input("Vehicle Registration Number: "))
        row["Start_Point_Station"] = input("Start Point Station: ")
        row["End_Point_Station"] = input("End Point Station: ")
        row["Time"] = input("Current time: ")
        row["Price"] = int(input("Price: "))
        row["C_Aadhar"] = int(input("Conductor's Aadhar: "))
        row["P_Aadhar"] = int(input("Passenger's Aadhar: "))

        query = "INSERT INTO TICKET(Seat_Number, Mode_of_Transport, Vehicle_Registration_Number, Start_Point_Station, End_Point_Station, Time, Price, C_Aadhar, P_Aadhar) VALUES('%d', '%s', '%d', '%s', '%s', '%s', '%d', '%d', '%d')" % (
            row["Seat_Number"], row["Mode_of_Transport"], row["Vehicle_Registration_Number"], row["Start_Point_Station"], row["End_Point_Station"], row["Time"], row["Price"], row["C_Aadhar"], row["P_Aadhar"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return


def insertDriver():
    try:
        # Takes driver details as input
        row = {}
        print("Enter new driver's details: ")
        row["Aadhar_Card_Number"] = int(input("Aadhar Card Number: "))
        row["First_Name"] = input("First Name: ")
        row["Middle_Name"] = input("Middle Name: ")
        row["Last_Name"] = input("Last Name: ")
        row["Service_Start_Date"] = input("Service Start Date: ")
        row["Age"] = int(input("Age: "))
        row["Gender"] = input("Gender: ")
        row["Drivers_License_ID_Number"] = int(
            input("Driver's License ID Number: "))
        row["Rep_Admin_Aadhar"] = int(
            input("Aadhar Number of Admin Officer to report to: "))
        row["Sal_Admin_Aadhar"] = int(
            input("Aadhar Number of Admin Officer responsible for Salary: "))

        query1 = "INSERT INTO DRIVER_ALT(Aadhar_Card_Number, First_Name, Middle_Name, Last_Name, Service_Start_Date, Age, Gender) VALUES('%d', '%s', '%s', '%s', '%s', '%d', '%c')" % (
            row["Aadhar_Card_Number"], row["First_Name"], row["Middle_Name"], row["Last_Name"], row["Service_Start_Date"], row["Age"], row["Gender"])
        query2 = "INSERT INTO DRIVER(Aadhar_Card_Number, Drivers_License_ID_Number, Rep_Admin_Aadhar, Sal_Admin_Aadhar) VALUES('%d', '%d', '%d', '%d')" % (
            row["Aadhar_Card_Number"], row["Drivers_License_ID_Number"], row["Rep_Admin_Aadhar"], row["Sal_Admin_Aadhar"])

        print(query1)
        print(query2)
        cur.execute(query1)
        cur.execute(query2)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return


def updatePassPref():
    try:
        # Takes updated MOT preference details as input
        row = {}
        row["P_Aadhar"] = int(
            input("Enter the Aadhar Number of the passenger: "))
        row["MOT_Pref"] = input(
            "Enter the updated preference of mode of transport: ")

        query = "UPDATE PASS_PREF SET P_Aadhar='%d',MOT_Pref='%s' WHERE P_Aadhar='%d'" % (
            row["P_Aadhar"], row["MOT_Pref"], row["P_Aadhar"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Database Updated")

    except Exception as e:
        con.rollback()
        print("Failed to update database")
        print(">>>>>>>>>>>>>", e)

    return


def updateCompAdmin():
    try:
        row = {}
        row["Complaint_ID"] = int(
            input("Enter the Complaint ID: "))
        row["Assigned_Admin_Officer_Aadhar_Number"] = int(input(
            "Enter the Aadhar number of the updated admin officer: "))

        query = "UPDATE COMPLAINT SET Assigned_Admin_Officer_Aadhar_Number='%d' WHERE Complaint_ID='%d'" % (
            row["Assigned_Admin_Officer_Aadhar_Number"], row["Complaint_ID"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Database Updated")

    except Exception as e:
        con.rollback()
        print("Failed to update database")
        print(">>>>>>>>>>>>>", e)

    return


def deleteSS():
    try:
        row = {}
        row["Aadhar_Card_Number"] = int(
            input("Aadhar Card Number: "))

        query = "DELETE FROM SERVICE_STAFF WHERE Aadhar_Card_Number='%d'" % (
            row["Aadhar_Card_Number"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Database Updated")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return


def deleteComplaint():
    try:
        row = {}
        row["Complaint_ID"] = int(
            input("Complaint ID: "))

        query = "DELETE FROM COMPLAINT WHERE Complaint_ID='%d'" % (
            row["Complaint_ID"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Database Updated")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return


def findDriver_MOT():
    try:
        # Takes ticket details as input
        row = {}
        row["MOT"] = input("Mode of Transport: ")

        query = "SELECT DRIVER_ALT.First_Name, DRIVER_ALT.Middle_Name, DRIVER_ALT.Last_Name FROM DRIVER, DRIVER_ALT, DRIVES WHERE DRIVES.MOT_mode='%s' AND DRIVES.D_ID=DRIVER.Drivers_LicensE_ID_Number AND DRIVER.Aadhar_Card_Number=DRIVER_ALT.Aadhar_Card_Number" % (
            row["MOT"])

        print(query)
        cur.execute(query)
        con.commit()

        output = cur.fetchall()
        for x in output:
            print(x)

        print("Retrieved From Database")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


def ConductorPaid_AdminOfficer():
    try:
        # Takes ticket details as input
        row = {}
        print("Enter the name of the Admin Officer: ")
        row["First_Name"] = input("First Name: ")
        row["Middle_Name"] = input("Middle Name: ")
        row["Last_Name"] = input("Last Name: ")

        query = "SELECT CONDUCTOR.First_Name, CONDUCTOR.Middle_Name,CONDUCTOR.Last_Name FROM ADMIN_OFFICER, CONDUCTOR WHERE ADMIN_OFFICER.First_Name='%s' AND ADMIN_OFFICER.Middle_Name='%s' AND ADMIN_OFFICER.Last_Name='%s' AND CONDUCTOR.Sal_Admin_Aadhar=ADMIN_OFFICER.Aadhar_Card_Number" % (
            row["First_Name"], row["Middle_Name"], row["Last_Name"])

        print(query)
        cur.execute(query)
        con.commit()

        output = cur.fetchall()
        for x in output:
            print(x)

        print("Retrieved From Database")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


# 10. Display all passengers who are Senior Citizens(older than 60 years old)
def Passengers_Old():
    try:

        query = "SELECT PASSENGER.First_Name,PASSENGER.Middle_Name,PASSENGER.Last_Name FROM PASSENGER WHERE PASSENGER.Age>=60"

        print(query)
        cur.execute(query)
        con.commit()

        output = cur.fetchall()
        for x in output:
            print(x)

        print("Retrieved From Database")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


# 11.Display all vehicles with more than a certain seats for people with disabilities
def Vehicles_Disabilities():
    try:
        row = {}
        row["count"] = int(input(
            "Enter number of seats for people with disabilities: "))
        query = "SELECT VEHICLE.State, VEHICLE.Zone, VEHICLE.Vehicle_Registration FROM VEHICLE WHERE VEHICLE.Number_of_seats_for_people_with_disabilities>='%d'" % (
            row["count"])

        print(query)
        cur.execute(query)
        con.commit()

        output = cur.fetchall()
        for x in output:
            print(x)

        print("Retrieved From Database")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


# 12. Display all vehicles capable of speeding up more than 80 km/hr.
def Passengers_Old():
    try:
        query = "SELECT VEHICLE.State, VEHICLE.Zone, VEHICLE.Vehicle_Registration FROM VEHICLE WHERE VEHICLE.Max_Speed>=80"

        print(query)
        cur.execute(query)
        con.commit()

        output = cur.fetchall()
        for x in output:
            print(x)

        print("Retrieved From Database")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


# 13. Who is the most experienced service staff member? How much experience?
def ServiceStaff_Experience():
    try:

        query = "SELECT First_Name, Middle_Name, Last_Name FROM SERVICE_STAFF ORDER BY Service_Start_Date ASC LIMIT 1"

        print(query)
        cur.execute(query)
        con.commit()

        output = cur.fetchall()
        for x in output:
            print(x)

        print("Retrieved From Database")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


# 14. Average price of a TICKET
def TicketPrice_Average():
    try:

        query = "SELECT AVG(Price) FROM TICKET"

        print(query)
        cur.execute(query)
        con.commit()

        output = cur.fetchall()
        for x in output:
            print(x)

        print("Retrieved From Database")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


# 15. Search driver based on License ID number and display name and Aadhar number.
def Driver_Data():
    try:

        row = {}
        row["D_ID"] = int(input("License ID Number: "))

        query = "SELECT DRIVER_ALT.First_Name, DRIVER_ALT.Middle_Name,DRIVER_ALT.Last_Name,DRIVER_ALT.Aadhar_Card_Number FROM DRIVER_ALT, DRIVER WHERE DRIVER_ALT.Aadhar_Card_Number=DRIVER.Aadhar_Card_Number AND DRIVER.Drivers_License_ID_Number='%d'" % (
            row["D_ID"])

        print(query)
        cur.execute(query)
        con.commit()

        output = cur.fetchall()
        for x in output:
            print(x)

        print("Retrieved From Database")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


# 16. Search for complaint based on Complaint ID and display names of Complainant and Assigned Admin Officer
def Complaint_Data():
    try:

        row = {}
        row["C_ID"] = int(input("Complaint ID Number: "))

        query = "SELECT COMPLAINT.First_Name AS Complainant_First_Name, COMPLAINT.Middle_Name AS Complainant_Middle_Name, COMPLAINT.Last_Name AS Complainant_Last_Name, ADMIN_OFFICER.First_Name AS Admin_Officer_First_Name,ADMIN_OFFICER.Middle_Name AS Admin_Officer_Middle_Name,ADMIN_OFFICER.Last_Name AS Admin_Officer_Last_Name FROM COMPLAINT, ADMIN_OFFICER WHERE COMPLAINT.Assigned_Admin_Officer_Aadhar_Number=ADMIN_OFFICER.Aadhar_Card_Number AND COMPLAINT.Complaint_ID='%d'" % (row[
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               "C_ID"])

        print(query)
        cur.execute(query)
        con.commit()

        output = cur.fetchall()
        for x in output:
            print(x)

        print("Retrieved From Database")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from database")
        print(">>>>>>>>>>>>>", e)

    return


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        insertDriver()
    elif(ch == 2):
        insertTicket()
    elif(ch == 3):
        insertLuggage()
    elif(ch == 4):
        updatePassPref()
    elif(ch == 5):
        updateCompAdmin()
    elif(ch == 6):
        deleteSS()
    elif(ch == 7):
        deleteComplaint()
    elif(ch == 8):
        findDriver_MOT()
    elif(ch == 9):
        ConductorPaid_AdminOfficer()
    elif(ch == 10):
        Passengers_Old()
    elif(ch == 11):
        Vehicles_Disabilities()
    elif(ch == 12):
        Passengers_Old()
    elif(ch == 13):
        ServiceStaff_Experience()
    elif(ch == 14):
        TicketPrice_Average()
    elif(ch == 15):
        Driver_Data()
    elif(ch == 16):
        Complaint_Data()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)

    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="root",
                              password="#ccBc1101ye",
                              db='plswork',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)

                print("1. Hire a new driver")
                print("2. Sell a new ticket")
                print("3. Add a new luggage item")
                print("4. Update preference of transport mode of a passenger")
                print(
                    "5. Update the admin officer to whom a certain complaint is assigned")
                print("6. Fire a service staff member.")
                print("7. Remove a complaint.")
                print("8. Find all drivers from a certain mode of transport")
                print("9. Find all conductors getting paid by a certain admin officer")
                print(
                    "10. Display all passengers who are Senior Citizens (older than 60 years old)")
                print(
                    "11. Display all vehicles with more than a certain seats for people with disabilities")
                print(
                    "12. Display all vehicles capable of speeding up more than 80 km/hr.")
                print(
                    "13. Who is the most experienced service staff member?")
                print("14. Average price of a ticket.")
                print(
                    "15. Search driver based on License ID number and display name and Aadhar number.")
                print(
                    "16. Search for complaint based on Complaint ID and display names of Complainant and Assigned Admin Officer")
                print("17. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 17:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
