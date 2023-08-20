package Model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class Professor {
	private int Codigo;
	private String Nome;
	private String Titulacao;
	
	@Override
	public String toString() {
		return Nome;
	}	
}