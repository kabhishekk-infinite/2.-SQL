using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Rental_Data
{
    class Program
    {
        public static SqlConnection con;
        public static SqlCommand cmd;
        public static SqlDataReader dr;

        static void Main(string[] args)
        {
            CreateTables();
            InsertData();
            SelectData();
            Console.Read();

            Console.ReadKey();
        }

        private static SqlConnection getConnection()
        {
            con = new SqlConnection("data source = ICS-LT-JMDM473\\SQLEXPRESS; initial catalog = RentalData; integrated security = true;");
            con.Open();
            return con;
        }

        public static void CreateTables()
        {
            con = getConnection();

            string createClientTable = "CREATE TABLE Client (ClientNo VARCHAR(10) PRIMARY KEY, cName VARCHAR(50));";
            string createOwnerTable = "CREATE TABLE Owner (OwnerNo VARCHAR(10) PRIMARY KEY, oName VARCHAR(50));";
            string createRentalTable = @"CREATE TABLE Rental (
                ClientNo VARCHAR(10), 
                propertyNo VARCHAR(10), 
                rentStart DATE, 
                pAddress VARCHAR(100), 
                rentFinish DATE, 
                rent DECIMAL(10, 2), 
                ownerNo VARCHAR(10), 
                PRIMARY KEY (ClientNo, propertyNo, rentStart),
                FOREIGN KEY (ClientNo) REFERENCES Client(ClientNo),
                FOREIGN KEY (ownerNo) REFERENCES Owner(OwnerNo));";

            ExecuteNonQuery(createClientTable);
            ExecuteNonQuery(createOwnerTable);
            ExecuteNonQuery(createRentalTable);

            Console.WriteLine("Tables created successfully.");
        }

        public static void InsertData()
        {
            con = getConnection();

            // Insert data into Client table
            InsertIntoClient("CR76", "John Kay");
            InsertIntoClient("CR56", "Aline Stewart");

            // Insert data into Owner table
            InsertIntoOwner("C040", "Tina Murphy");
            InsertIntoOwner("C093", "Tony Shaw");

            // Insert data into Rental table
            InsertIntoRental("CR76", "PG4", "2000-07-01", "6 Lawrence St, Glasgow", "2001-08-31", 250, "C040");
            InsertIntoRental("CR76", "PG16", "2002-09-01", "5 Novar Dr, Glasgow", "2002-09-01", 350, "C093");
            InsertIntoRental("CR76", "PG4", "1999-09-01", "6 Lawrence St, Glasgow", "2000-06-01", 100, "C040");
            InsertIntoRental("CR56", "PG36", "2002-08-01", "3 Manor Rd, Glasgow", "2001-12-01", 250, "C093");
            InsertIntoRental("CR56", "PG16", "2002-11-01", "5 Novar Dr, Glasgow", "2002-11-01", 350, "C093");

            Console.WriteLine("Data inserted successfully.");
        }

        private static void InsertIntoClient(string clientNo, string cName)
        {
            cmd = new SqlCommand("INSERT INTO Client VALUES (@clientNo, @cName)", con);
            cmd.Parameters.AddWithValue("@clientNo", clientNo);
            cmd.Parameters.AddWithValue("@cName", cName);
            cmd.ExecuteNonQuery();
        }

        private static void InsertIntoOwner(string ownerNo, string oName)
        {
            cmd = new SqlCommand("INSERT INTO Owner VALUES (@ownerNo, @oName)", con);
            cmd.Parameters.AddWithValue("@ownerNo", ownerNo);
            cmd.Parameters.AddWithValue("@oName", oName);
            cmd.ExecuteNonQuery();
        }

        private static void InsertIntoRental(string clientNo, string propertyNo, string rentStart, string pAddress, string rentFinish, decimal rent, string ownerNo)
        {
            cmd = new SqlCommand("INSERT INTO Rental VALUES (@clientNo, @propertyNo, @rentStart, @pAddress, @rentFinish, @rent, @ownerNo)", con);
            cmd.Parameters.AddWithValue("@clientNo", clientNo);
            cmd.Parameters.AddWithValue("@propertyNo", propertyNo);
            cmd.Parameters.AddWithValue("@rentStart", rentStart);
            cmd.Parameters.AddWithValue("@pAddress", pAddress);
            cmd.Parameters.AddWithValue("@rentFinish", rentFinish);
            cmd.Parameters.AddWithValue("@rent", rent);
            cmd.Parameters.AddWithValue("@ownerNo", ownerNo);
            cmd.ExecuteNonQuery();
        }

        public static void SelectData()
        {
            con = getConnection();

            string[] tables = { "Client", "Owner", "Rental" };

            foreach (var table in tables)
            {
                Console.WriteLine($"Data from {table} table:");
                cmd = new SqlCommand($"SELECT * FROM {table}", con);
                dr = cmd.ExecuteReader();

                for (int i = 0; i < dr.FieldCount; i++)
                {
                    Console.Write(dr.GetName(i) + "\t");
                }
                Console.WriteLine();

                while (dr.Read())
                {
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        Console.Write(dr[i] + "\t");
                    }
                    Console.WriteLine();
                }

                dr.Close();
                Console.WriteLine();
            }
        }

        private static void ExecuteNonQuery(string query)
        {
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
        }
    }
}
