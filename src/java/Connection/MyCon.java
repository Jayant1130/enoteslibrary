
package Connection;
import java.sql.*;
public class MyCon 
{
    static Connection con=null;
    static
    {
        try 
        {
             Class.forName("com.mysql.jdbc.Driver");
 //            System.out.println("Driver load...........");
        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }  
    }
    
    public static Connection getConnection()
    {
        try {
      //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/enoteslibrary", "root", "1234");
      con = DriverManager.getConnection("jdbc:mysql://ec2-54-145-224-156.compute-1.amazonaws.com:5432/d79f45qc1h6cd6", "ddyiqtntayudun", "6e1497c7d9f8f7a4186a064c701e23c14bffb688bc13c9d64d03d2d13fd1dc4e");
          //   System.out.println("Data base Conneted.........");
          } 
        catch (SQLException e) 
        {
            System.out.println(e);
        } 
        return con;
    }
}
