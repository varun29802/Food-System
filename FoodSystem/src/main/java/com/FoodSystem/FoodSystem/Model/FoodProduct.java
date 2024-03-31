package com.FoodSystem.FoodSystem.Model;

import jakarta.persistence.*;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class FoodProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pid;

    private String pname;
    private int pprice;
    private String pdesc;
    private String pimagepath;

    @Transient
    private transient MultipartFile image;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getPprice() {
        return pprice;
    }

    public void setPprice(int pprice) {
        this.pprice = pprice;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public String getPimagepath() {
        return pimagepath;
    }

    public void setPimagepath(String pimagepath) {
        this.pimagepath = pimagepath;
    }

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

	public FoodProduct(int pid, String pname, int pprice, String pdesc, String pimagepath, MultipartFile image) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.pdesc = pdesc;
		this.pimagepath = pimagepath;
		this.image = image;
	}

	public FoodProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "FoodProduct [pid=" + pid + ", pname=" + pname + ", pprice=" + pprice + ", pdesc=" + pdesc
				+ ", pimagepath=" + pimagepath + "]";
	}
    
}
