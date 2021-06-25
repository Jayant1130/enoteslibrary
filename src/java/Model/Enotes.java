package Model;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import javax.servlet.http.Part;

public class Enotes {

    int enotesid, userid;
    Part Logo;
    byte[] RLogo;
    String Name, Description;
    Part Document;
    byte[] SDocument;
    byte[] RDocument;

    public int getEnotesid() {
        return enotesid;
    }

    public void setEnotesid(int enotesid) {
        this.enotesid = enotesid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public Part getLogo() {
        return Logo;
    }

    public void setLogo(Part Logo) {
        this.Logo = Logo;
    }

    public String getRLogo() {
        String t = Base64.getEncoder().encodeToString(RLogo);
        return "data:image/jpg;base64," + t;
    }

    public void setRLogo(Blob blob) throws SQLException {
        this.RLogo = blob.getBytes(1, (int) blob.length());
    }

    public Part getDocument() {
        return Document;
    }

    public void setDocument(Part Document) {
        this.Document = Document;
    }

    public String getRDocument() {
        String t = Base64.getEncoder().encodeToString(RDocument);
//        return "data:application/octet-stream;charset=utf-16le;base64," + t;
        return "data:application/pdf;base64," + t;
    }

    public void setRDocument(Blob blob) throws SQLException {

        this.RDocument = blob.getBytes(1, (int) blob.length());
    }
    public void setSDocument(Part part) throws SQLException, IOException {

        this.SDocument = Files.readAllBytes((Path) part);
    }

}
