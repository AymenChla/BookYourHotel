package entities;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="CHAMBRES")
public class Chambre{
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long idChambre;
    private Integer numero;
    private Integer taille;
    private Integer type;
    private Boolean climatisation;
    private String photo;
    private String description;
    @ManyToOne
    @JoinColumn(name="ID_HOTEL")
    private Hotel hotel;
    
    @OneToMany(mappedBy="chambre",fetch=FetchType.LAZY)
    private Collection<Reservation> reservations;
    @OneToMany(mappedBy="chambre",fetch=FetchType.LAZY)
    private Collection<Prix> prix;
    

    public Chambre() {
    }

    public Chambre(Integer numero, Integer taille, Integer type, Boolean climatisation, String photo, String description) {
        this.numero = numero;
        this.taille = taille;
        this.type = type;
        this.climatisation = climatisation;
        this.photo = photo;
        this.description = description;
    }

    public Chambre(Chambre chambre) {
		this.taille = chambre.getTaille();
		this.type = chambre.getType();
		this.climatisation = chambre.getClimatisation();
		this.description = chambre.getDescription();
		this.hotel = chambre.getHotel();
	}

	public Integer getNumero() {
        return numero;
    }
    
    public Long getIdChambre() {
		return idChambre;
	}

	public void setIdChambre(Long idChambre) {
		this.idChambre = idChambre;
	}

	public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public Integer getTaille() {
        return taille;
    }

    public void setTaille(Integer taille) {
        this.taille = taille;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Boolean getClimatisation() {
        return climatisation;
    }

    public void setClimatisation(Boolean climatisation) {
        this.climatisation = climatisation;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Collection<Reservation> getReservations() {
        return reservations;
    }

    public void setReservations(Collection<Reservation> reservations) {
        this.reservations = reservations;
    }

    public Collection<Prix> getPrix() {
        return prix;
    }

    public void setPrix(Collection<Prix> prix) {
        this.prix = prix;
    }

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	public String getCategorie()
	{
		String categorie="";
		switch (this.type) {
		case 1:
			categorie =  "Simple";
			break;
		
		case 2:
			categorie =   "Double";
			break;
		
		case 3:
			categorie =   "Triple";
			break;
					
		case 4:
			categorie =   "Familiale";
			break;
		default:
			break;
		}
		
		return categorie;
	}

    
}
