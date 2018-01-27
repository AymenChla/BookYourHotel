
package entities;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="HOTELS")
public class Hotel{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long idHotel;
    private String nom_hotel;
    private Integer nbEtoiles;
    private String adresse_hotel;
    private Integer piscine;
    private boolean restaurant;
    private boolean parking;
    private boolean wifi;
    private String description;
    private String image;
    private String numCarteBancaire;
    
    private boolean paiement;
    private int annulation;
   
    @OneToMany(mappedBy="hotel",fetch=FetchType.LAZY)
    private Collection<Gerant> gerants;
    @OneToMany(mappedBy="hotel",fetch=FetchType.LAZY)
    private Collection<Rating> ratings;
    @OneToMany(mappedBy="hotel",fetch=FetchType.LAZY)
    private Collection<Commentaire> commentaires;
    @OneToMany(mappedBy="hotel",fetch=FetchType.LAZY)
    private Collection<Chambre> chambres;

    public Hotel() {
    }

    public Hotel(Long idHotel, String nom_hotel, Integer nbEtoiles,
			String adresse_hotel, Integer piscine, boolean restaurant,
			boolean parking, boolean wifi, String description, String image,
			String numCarteBancaire, boolean paiement, int annulation) {
		
		this.idHotel = idHotel;
		this.nom_hotel = nom_hotel;
		this.nbEtoiles = nbEtoiles;
		this.adresse_hotel = adresse_hotel;
		this.piscine = piscine;
		this.restaurant = restaurant;
		this.parking = parking;
		this.wifi = wifi;
		this.description = description;
		this.image = image;
		this.numCarteBancaire = numCarteBancaire;
		this.paiement = paiement;
		this.annulation = annulation;
	}

    public Long getIdHotel() {
        return idHotel;
    }

	public void setIdHotel(Long idHotel) {
        this.idHotel = idHotel;
    }

    public String getNom_hotel() {
        return nom_hotel;
    }

    public void setNom_hotel(String nom_hotel) {
        this.nom_hotel = nom_hotel;
    }

    public Integer getNbEtoiles() {
        return nbEtoiles;
    }

    public void setNbEtoiles(Integer nbEtoiles) {
        this.nbEtoiles = nbEtoiles;
    }

    public String getAdresse_hotel() {
        return adresse_hotel;
    }

    public void setAdresse_hotel(String adresse) {
        this.adresse_hotel = adresse;
    }

    public Integer getPiscine() {
        return piscine;
    }

    public void setPiscine(Integer piscine) {
        this.piscine = piscine;
    }

    public boolean isRestaurant() {
        return restaurant;
    }

    public void setRestaurant(boolean restaurant) {
        this.restaurant = restaurant;
    }

    public boolean isParking() {
        return parking;
    }

    public void setParking(boolean parking) {
        this.parking = parking;
    }

    public boolean isWifi() {
        return wifi;
    }

    public void setWifi(boolean wifi) {
        this.wifi = wifi;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImages(String image) {
        this.image = image;
    }

    public String getNumCarteBancaire() {
        return numCarteBancaire;
    }

    public void setNumCarteBancaire(String numCarteBancaire) {
        this.numCarteBancaire = numCarteBancaire;
    }

    public Collection<Gerant> getGerants() {
        return gerants;
    }

    public void setGerants(Collection<Gerant> gerants) {
        this.gerants = gerants;
    }

    public Collection<Rating> getRatings() {
        return ratings;
    }

    public void setRatings(Collection<Rating> ratings) {
        this.ratings = ratings;
    }

    public Collection<Commentaire> getCommentaires() {
        return commentaires;
    }

    public void setCommentaires(Collection<Commentaire> commentaires) {
        this.commentaires = commentaires;
    }

    public Collection<Chambre> getChambres() {
        return chambres;
    }

    public void setChambres(Collection<Chambre> chambres) {
        this.chambres = chambres;
    }

	public boolean isPaiement() {
		return paiement;
	}

	public void setPaiement(boolean paiement) {
		this.paiement = paiement;
	}

	public int getAnnulation() {
		return annulation;
	}

	public void setAnnulation(int annulation) {
		this.annulation = annulation;
	}
    
    
}
