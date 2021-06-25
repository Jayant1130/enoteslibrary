package Model;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import javax.servlet.http.Part;

public class User {
    int UserID;
    String Name, Email, Password, Mobile, Type;

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    
    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    
    
    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getMobile() {
        return Mobile;
    }

    public void setMobile(String Mobile) {
        this.Mobile = Mobile;
    }
    
    

}
