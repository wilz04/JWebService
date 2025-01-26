import java.sql.*;

public class MyConnection {
  
  private String id;
  private String pwd;
  protected Connection me;
  
  public MyConnection() throws Exception {
    init("root", "poligon");
    open("localhost", "cuc");
  }
  
  public void init(String id, String pwd) {
    this.id = id;
    this.pwd = pwd;
    me = null;
  }
  
  public void open(String url, String base) throws Exception {
    Class.forName("com.mysql.jdbc.Driver");
    me = DriverManager.getConnection("jdbc:mysql://" + url + "/" + base, id, pwd);
  }
  
  public boolean execute(String sql) throws Exception {
    PreparedStatement query = me.prepareStatement(sql);
    return query.execute();
  }
  
  public ResultSet executeQuery(String sql) throws Exception {
    PreparedStatement query = me.prepareStatement(sql);
    return query.executeQuery();
  }
  /*
   public int executeUpdate(String sql) throws Exception {
   PreparedStatement query = me.prepareStatement(sql);
   return query.executeUpdate();
   }
   */
  public void close() throws Exception {
    me.close();
  }
  
}
