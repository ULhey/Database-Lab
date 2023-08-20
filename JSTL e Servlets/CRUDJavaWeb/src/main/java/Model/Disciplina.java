package Model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter


public class Disciplina {
	private int Codigo;
	private String Nome;
	private Professor professor;
	
	@Override
	public String toString() {
		return Codigo + " - " + Nome + " - " + professor;
	}	
}
