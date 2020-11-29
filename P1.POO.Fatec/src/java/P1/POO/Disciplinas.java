package P1.POO;
import java.util.ArrayList;
import java.sql.*;
import web.DbListener;

public class Disciplinas {
    private String nome;
    private String ementa;
    private int ciclo;
    private float nota;
    
    public static ArrayList<Disciplinas> getList() throws Exception{
        ArrayList<Disciplinas> list = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        Exception methodException = null;
        try{
            con = DbListener.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM disciplinas");
            while(rs.next()){
                list.add(new Disciplinas(
                    rs.getString("nome"),
                    rs.getString("ementa"),
                    rs.getInt("ciclo"),
                    rs.getFloat("nota")
                    ));
            }
            
            
        }catch(Exception ex){
            methodException =  ex;
        }finally{
           try{rs.close();}catch(Exception ex2){}
           try{stmt.close();}catch(Exception ex2){}
           try{con.close();}catch(Exception ex2){}
        }
        if(methodException!= null) throw methodException;
        return list;
    }
    
    public static void Insert(String nome, String ementa, int ciclo, float nota) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        
        Exception methodException = null;
        try{
            con = DbListener.getConnection();
            stmt = con.prepareStatement("INSERT INTO disciplinas(nome, ementa, ciclo, nota) VALUES(?,?,?,?)");
            stmt.setString(1, nome);
            stmt.setString(2, ementa);
            stmt.setInt(3, ciclo);
            stmt.setFloat(4, nota);
            stmt.execute();

        }catch(Exception ex){
            methodException =  ex;
        }finally{
           try{stmt.close();}catch(Exception ex2){}
           try{con.close();}catch(Exception ex2){}
        }
        if(methodException!= null) throw methodException;
    }
    
    public static void Update(String nomeAntigo, String nome, String ementa, int ciclo, float nota) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        
        Exception methodException = null;
        try{
            con = DbListener.getConnection();
            stmt = con.prepareStatement("UPDATE disciplinas SET nome = ?, ementa = ?, ciclo = ?, nota = ? WHERE nome = ?");
            stmt.setString(1, nome);
            stmt.setString(2, ementa);
            stmt.setInt(3, ciclo);
            stmt.setFloat(4, nota);
            stmt.setString(5, nomeAntigo);
            stmt.execute();

        }catch(Exception ex){
            methodException =  ex;
        }finally{
           try{stmt.close();}catch(Exception ex2){}
           try{con.close();}catch(Exception ex2){}
        }
        if(methodException!= null) throw methodException;
    }
    
    public static void Delete(String nome) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        
        Exception methodException = null;
        try{
            con = DbListener.getConnection();
            stmt = con.prepareStatement("DELETE FROM disciplinas WHERE nome = ?");
            stmt.setString(1, nome);
            stmt.execute();

        }catch(Exception ex){
            methodException =  ex;
        }finally{
           try{stmt.close();}catch(Exception ex2){}
           try{con.close();}catch(Exception ex2){}
        }
        if(methodException!= null) throw methodException;
    }

    public Disciplinas(String nome, String ementa, int ciclo, float nota) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
    }

    public float getNota() {
        return nota;
    }

    public void setNota(float nota) {
        this.nota = nota;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmenta() {
        return ementa;
    }

    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    public int getCiclo() {
        return ciclo;
    }

    public void setCiclo(int ciclo) {
        this.ciclo = ciclo;
    }
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS disciplinas("
                + "nome VARCHAR(50) PRIMARY KEY,"
                + "ementa VARCHAR(300) NOT NULL,"
                + "ciclo NUMBER(2) NOT NULL,"
                + "nota NUMBER(2,2) NOT NULL"
                + ")";
    }
    
}
