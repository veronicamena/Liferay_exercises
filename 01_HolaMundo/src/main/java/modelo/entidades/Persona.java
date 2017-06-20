package modelo.entidades;

public class Persona {
private String nombre;
private int edad;
private String dni;



public String getNombre() {
	return nombre;
}
public void setNombre(String nombre) {
	this.nombre = nombre;
}
public int getEdad() {
	return edad;
}
public void setEdad(int edad) {
	this.edad = edad;
}
public String getDni() {
	return dni;
}
public void setDni(String dni) {
	this.dni = dni;
}



@Override
public String toString() {
	return "Persona [nombre=" + nombre + ", edad=" + edad + ", dni=" + dni + "]";
}




}
