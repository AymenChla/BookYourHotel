package entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="PRIX")
public class Prix {
    
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idPrix;
    private Double prix;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateDebut;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateFin;
    private Double tauxReduction;
    
    @ManyToOne
    @JoinColumn(name="ID_CHAMBRE")
    private Chambre chambre;
            
    public Prix() {
    }

    public Prix(Double prix, Date dateDebut, Date dateFin, Double tauxReduction) {
        this.prix = prix;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.tauxReduction = tauxReduction;
    }
    
    public Prix(Prix prix) {
        this.prix = prix.getPrix();
        this.dateDebut = prix.getDateDebut();
        this.dateFin = prix.getDateFin();
        this.tauxReduction = prix.getTauxReduction();
    }
    
    public Long getIdPrix() {
		return idPrix;
	}

	public void setIdPrix(Long idPrix) {
		this.idPrix = idPrix;
	}

	public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public Double getTauxReduction() {
        return tauxReduction;
    }

    public void setTauxReduction(Double tauxReduction) {
        this.tauxReduction = tauxReduction;
    }

    public Chambre getChambre() {
        return chambre;
    }

    public void setChambre(Chambre chambre) {
        this.chambre = chambre;
    }
    
    //supprime doublons des hotels
    static public List<Prix> supprimerDoublonsHotel(List<Prix> offres)
    {
    	List<Long> instances = new ArrayList<Long>();
    	Iterator<Prix> i = offres.iterator();
    	Prix offre;
    	while(i.hasNext())
    	{
    		offre = i.next();
    		if(instances.contains(offre.getChambre().getHotel().getIdHotel()))
			{
				i.remove();
			}
    		else{
    			instances.add(offre.getChambre().getHotel().getIdHotel());
    		}
    	   
    	}
    	return offres;
    }
    
  //supprime doublons des types chambres
    static public List<Prix> supprimerDoublonsChambreCategorie(List<Prix> prix)
    {

    	List<Integer> instances = new ArrayList<Integer>();
    	Iterator<Prix> i = prix.iterator();
    	Prix iprix;
    	while(i.hasNext())
    	{
    		iprix = i.next();
    		if(instances.contains(iprix.getChambre().getType()))
			{
				i.remove();
			}
    		else{

    			instances.add(iprix.getChambre().getType());
    		}
    	   
    	}
    	return prix;
    }

}
