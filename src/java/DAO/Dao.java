package DAO;

import Connection.MyCon;
import Model.Enotes;
import Model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Dao {

    public int isCorrectLogin(String Email, String Password) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyCon.getConnection();
        String sql;
        sql = "select * from User where Email = ? AND Password = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, Email);
        ps.setString(2, Password);
        rs = ps.executeQuery();
        if (rs.next()) {
            if (rs.getString("Email").equalsIgnoreCase(Email) && rs.getString("Password").equals(Password)) {
                return rs.getInt("Userid");
            }
        }
        return 0;

    }

    public boolean addUser(User u) throws SQLException, IOException {
        String sql;
        Connection con = null;
        PreparedStatement ps = null;
        con = MyCon.getConnection();
        sql = "Insert into user values(?,  ?, ?, ? ,?, ?)";
        ps = con.prepareStatement(sql);
        ps.setInt(1, u.getUserID());
        ps.setString(2, u.getName());
        ps.setString(3, u.getEmail());
        ps.setString(4, u.getPassword());
        ps.setString(5, u.getMobile());
        ps.setString(6, u.getType());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public int getNextUserID() throws SQLException {
        String sql;
        int n = 10000;
        Connection con = null;
        PreparedStatement ps = null;
        con = MyCon.getConnection();
        sql = "Select max(UserID) from user";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            if (rs.getInt("max(UserID)") != 0) {
                n = rs.getInt("max(UserID)") + 1;
            }
        }
        con.close();
        return n;
    }

    public int getNextEnotesID() throws SQLException {
        String sql;
        int n = 100000;
        Connection con = null;
        PreparedStatement ps = null;
        con = MyCon.getConnection();
        sql = "Select max(enotesid) from enotes";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            if (rs.getInt("max(enotesid)") != 0) {
                n = rs.getInt("max(enotesid)") + 1;
            }
        }
        con.close();
        return n;
    }

    public User getUserByID(int UserID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyCon.getConnection();
        String sql;
        sql = "select * from User where UserId = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, UserID);
        rs = ps.executeQuery();
        User u = new User();
        if (rs.next()) {
            u.setUserID(rs.getInt("UserID"));
            u.setEmail(rs.getString("Email"));
            u.setMobile(rs.getString("Mobile"));
            u.setName(rs.getString("Name"));
            u.setType(rs.getString("Type"));
            return u;
        }
        return null;

    }

    public List<User> getAllUserByType(String Type) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyCon.getConnection();
        String sql;
        sql = "select * from user where Type = ? ";
        ps = con.prepareStatement(sql);
        ps.setString(1, Type);
        rs = ps.executeQuery();
        List<User> mylist = new ArrayList<User>();
        while (rs.next()) {
            User u = new User();
            u.setUserID(rs.getInt("UserID"));
            u.setEmail(rs.getString("Email"));
            u.setMobile(rs.getString("Mobile"));
            u.setName(rs.getString("Name"));
            u.setType(rs.getString("Type"));
            mylist.add(u);
            u = null;
        }
        return mylist;
    }

    public boolean changeInstitutionStatus(int UserID, String Status) throws SQLException {
        String sql;
        Connection con = null;
        PreparedStatement ps = null;
        con = MyCon.getConnection();
        sql = "update user set Type = ? where Userid = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, Status);
        ps.setInt(2, UserID);
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean addEnotes(Enotes e) throws SQLException, IOException {
        String sql;
        Connection con = null;
        PreparedStatement ps = null;
        con = MyCon.getConnection();
        sql = "Insert into enotes values(? , ? , ? , ?, ?, ?)";
        ps = con.prepareStatement(sql);
        ps.setInt(1, e.getEnotesid());
        ps.setInt(2, e.getUserid());
        ps.setBlob(3, e.getLogo().getInputStream());
        ps.setString(4, e.getName());
        ps.setString(5, e.getDescription());
        ps.setBlob(6, e.getDocument().getInputStream());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<Enotes> getAllEnotesByUserID(int UserID)throws SQLException
    {
       Connection con=null;
       ResultSet rs=null;
       PreparedStatement ps=null;
       con=MyCon.getConnection();
       String sql;
       sql="select * from enotes where UserID = ? order by  EnotesID  DESC ";
       ps=con.prepareStatement(sql);
       ps.setInt(1, UserID);
       rs=ps.executeQuery();
       List<Enotes> enotes = new ArrayList<Enotes>();
       while(rs.next())
       {        
                Enotes e = new Enotes();
                e.setUserid(rs.getInt("UserID"));
                e.setEnotesid(rs.getInt("enotesID"));
                e.setRLogo(rs.getBlob("Logo"));
                e.setName(rs.getString("Name"));
                e.setDescription(rs.getString("Description"));
                e.setRDocument(rs.getBlob("Document"));
                enotes.add(e);
                
       }    
       return enotes;
    }
    public Enotes getEnotesByEnotesID(int EnotesID)throws SQLException
    {
       Connection con=null;
       ResultSet rs=null;
       PreparedStatement ps=null;
       con=MyCon.getConnection();
       String sql;
       sql="select * from enotes where EnotesID = ?  ";
       ps=con.prepareStatement(sql);
       ps.setInt(1, EnotesID);
       rs=ps.executeQuery();
        Enotes e = new Enotes();
       while(rs.next())
       {        
                e.setUserid(rs.getInt("UserID"));
                e.setEnotesid(rs.getInt("enotesID"));
                e.setRLogo(rs.getBlob("Logo"));
                e.setName(rs.getString("Name"));
                e.setDescription(rs.getString("Description"));
                e.setRDocument(rs.getBlob("Document"));
                 return e;
                
       }    
       return null;
    }
    public boolean DeleteEnotes(int EnotesID) throws SQLException, IOException {
        String sql;
        Connection con = null;
        PreparedStatement ps = null;
        con = MyCon.getConnection();
        sql = "Delete from enotes where enotesid = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, EnotesID);
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean updateEnotes(Enotes e) throws SQLException {
        String sql;
        Connection con = null;
        PreparedStatement ps = null;
        con = MyCon.getConnection();
        sql = "update enotes set Name = ?, Description = ? where enotesid = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, e.getName());
        ps.setString(2, e.getDescription());
        ps.setInt(3, e.getEnotesid());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    public List<Enotes> getAllEnotes()throws SQLException
    {
       Connection con=null;
       ResultSet rs=null;
       PreparedStatement ps=null;
       con=MyCon.getConnection();
       String sql;
       sql="select * from enotes  order by  EnotesID  DESC ";
       ps=con.prepareStatement(sql);
       rs=ps.executeQuery();
       List<Enotes> enotes = new ArrayList<Enotes>();
       while(rs.next())
       {        
                Enotes e = new Enotes();
                e.setUserid(rs.getInt("UserID"));
                e.setEnotesid(rs.getInt("enotesID"));
                e.setRLogo(rs.getBlob("Logo"));
                e.setName(rs.getString("Name"));
                e.setDescription(rs.getString("Description"));
                e.setRDocument(rs.getBlob("Document"));
                enotes.add(e);
                
       }    
       return enotes;
    }
    
    public List<Enotes> getAllEnotesForSearch(String Serach)throws SQLException
    {
       Connection con=null;
       ResultSet rs=null;
       PreparedStatement ps=null;
       con=MyCon.getConnection();
       String sql;
       sql="select * from enotes where Name Like '%"+Serach+"%' ";
       ps=con.prepareStatement(sql);
//       ps.setString(1, Serach);
       rs=ps.executeQuery();
       List<Enotes> enotes = new ArrayList<Enotes>();
       while(rs.next())
       {        
                Enotes e = new Enotes();
                e.setUserid(rs.getInt("UserID"));
                e.setEnotesid(rs.getInt("enotesID"));
                e.setRLogo(rs.getBlob("Logo"));
                e.setName(rs.getString("Name"));
                e.setDescription(rs.getString("Description"));
                e.setRDocument(rs.getBlob("Document"));
                enotes.add(e);
                
       }    
       return enotes;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(new Dao().getNextUserID());
    }

}
