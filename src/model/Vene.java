package model;

public class Vene {
	int tunnus;
	String nimi, merkkimalli, pituus, leveys, hinta;
	public Vene() {
		super();
	}
	public Vene(int tunnus, String nimi, String merkkimalli, String pituus, String leveys, String hinta) {
		super();
		this.tunnus = tunnus;
		this.nimi = nimi;
		this.merkkimalli = merkkimalli;
		this.pituus = pituus;
		this.leveys = leveys;
		this.hinta = hinta;
	}
	public Vene(String nimi, String merkkimalli, String pituus, String leveys, String hinta) {
		super();
		this.nimi = nimi;
		this.merkkimalli = merkkimalli;
		this.pituus = pituus;
		this.leveys = leveys;
		this.hinta = hinta;
	}
	
	public int getTunnus() {
		return tunnus;
	}
	public void setTunnus(int tunnus) {
		this.tunnus = tunnus;
	}
	public String getNimi() {
		return nimi;
	}
	public void setNimi(String nimi) {
		this.nimi = nimi;
	}
	public String getMerkkimalli() {
		return merkkimalli;
	}
	public void setMerkkimalli(String merkkimalli) {
		this.merkkimalli = merkkimalli;
	}
	public String getPituus() {
		return pituus;
	}
	public void setPituus(String pituus) {
		this.pituus = pituus;
	}
	public String getLeveys() {
		return leveys;
	}
	public void setLeveys(String leveys) {
		this.leveys = leveys;
	}
	public String getHinta() {
		return hinta;
	}
	public void setHinta(String hinta) {
		this.hinta = hinta;
	}
	
	@Override
	public String toString() {
		return "Vene [tunnus=" + tunnus + ", nimi=" + nimi + ", merkkimalli=" + merkkimalli + ", pituus="
				+ pituus + ", leveys=" + leveys + ", hinta=" + hinta + "]";
	}
	
}
