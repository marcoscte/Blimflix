package mx.resources.java;

public class Serie {
	private int id;
	private String titulo;
	private int anio;
	private String pais;
	private String desc;
	
	public Serie(int id, String titulo) {
		this.id = id;
		this.titulo = titulo;
	}
	public Serie() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public int getAnio() {
		return anio;
	}
	public void setAnio(int anio) {
		this.anio = anio;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	@Override
	public String toString() {
		return "Serie: "+ titulo+" id: "+id;
	}
	
	
}
