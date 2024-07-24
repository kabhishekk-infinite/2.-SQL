using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Employeemanagement
{
    class Program
     {
            static void Main(string[] args)
            {
                string connectionString = "Server=ICS-LT-JMDM473\\SQLEXPRESS;Database=Employeemanagement;Integrated Security=True;";

                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        //Execute the stored procedure from here--
                        SqlCommand cmd = new SqlCommand("AddEmployee", connection);
                        cmd.CommandType = CommandType.StoredProcedure;

                        //Here is Parameters for the stored procedure
                        cmd.Parameters.AddWithValue("@EmpName", "Abhishek Kumar");
                        cmd.Parameters.AddWithValue("@Empsal", 30000);
                        cmd.Parameters.AddWithValue("@Emptype", 'F');

                        //Get the generated Empno
                        SqlParameter empnoParam = new SqlParameter("@Empno", SqlDbType.Int);
                        empnoParam.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(empnoParam);

                        //Execute
                        cmd.ExecuteNonQuery();

                        //Retrieve the generated Empno
                        int empno = Convert.ToInt32(empnoParam.Value);
                        Console.WriteLine($"Employee added with Empno: {empno}");

                        //Display all employee rows (optional)
                        DisplayEmployeeDetails(connection);

                        connection.Close();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error: {ex.Message}");
                }

                Console.WriteLine("Press any key to exit...");
                Console.ReadKey();
            }

            static void DisplayEmployeeDetails(SqlConnection connection)
            {
                string query = "SELECT Empno, EmpName, Empsal, Emptype FROM Employee_Details";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        Console.WriteLine("Employee Details:");
                        Console.WriteLine("------------------");

                        while (reader.Read())
                        {
                            int empno = reader.GetInt32(0);
                            string empName = reader.GetString(1);
                            decimal empsal = reader.GetDecimal(2);
                            char emptype = reader.GetChar(3);

                            Console.WriteLine($"Empno: {empno}, EmpName: {empName}, Empsal: {empsal}, Emptype: {emptype}");
                        }
                    }
                }
            }
     }
}


