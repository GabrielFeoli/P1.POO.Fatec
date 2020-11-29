package P1.POO;
import java.util.ArrayList;

public class Disciplinas {
    private String nome;
    private String ementa;
    private int ciclo;
    private float nota;
    private ArrayList<Disciplinas> disciplinas = new ArrayList<>();

    public Disciplinas(String nome, String ementa, int ciclo) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
    }

    public int getCiclo() {
        return ciclo;
    }

    public void setCiclo(int ciclo) {
        this.ciclo = ciclo;
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

    public float getNota() {
        return nota;
    }

    public void setNota(float nota) {
        this.nota = nota;
    }

    public ArrayList<Disciplinas> getList() {
        return disciplinas;
    }

    public void setList(ArrayList<Disciplinas> list) {
        disciplinas = list;
    }
    
    public void addList(Disciplinas ds){
        disciplinas.add(ds);
    }
    
}
