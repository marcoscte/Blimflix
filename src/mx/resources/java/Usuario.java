package mx.resources.java;
import java.util.Date;

public class Usuario {

	private int id;
	  private String email;
	  private String nombre;
	  private String apellido;
	  private String contrasenia;
	  private int tipo;
	  private Date ultimaConexion;

	public Usuario(int id, String email, String nombre, String apellido, String contrasenia, int tipo){
	  this.id = id;
	  this.email = email;
	  this.nombre = nombre;
	  this.apellido = apellido;
	  this.contrasenia = contrasenia;
	  this. tipo = tipo;
	}

	public Usuario(){

	}

	public Usuario (Usuario u){
	  id = u.id;
	  email = u.email;
	  nombre = u.nombre;
	  apellido = u.apellido;
	  contrasenia = u.contrasenia;
	  tipo = u.tipo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public Date getUltimaConexion() {
		return ultimaConexion;
	}

	public void setUltimaConexion(Date ultimaConexion) {
		this.ultimaConexion = ultimaConexion;
	}

	@Override
	public String toString() {
		return "Usuario [id=" + id + ", email=" + email + ", nombre=" + nombre + ", apellido=" + apellido
				+ ", contrasenia=" + contrasenia + ", tipo=" + tipo + ", ultimaConexion=" + ultimaConexion + "]";
	}



}