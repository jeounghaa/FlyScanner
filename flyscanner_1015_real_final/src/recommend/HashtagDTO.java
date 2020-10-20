package recommend;

public class HashtagDTO {
	private String hID;
	private String ctID;
	private String food;
	private String nature;
	private String activity;
	private String history;
	private String themepark;
	private String hotel;
	private String spa;
	private String shopping;
	private String exhibition;
	private String sports;
	private String festival;
	private String religion;
	private String citytour;
	private String prices;
	private String island;
	private String continent;
	
	public HashtagDTO() {
		super();
	}

	public HashtagDTO(String hID, String ctID, String food, String nature, String activity, String history,
			String themepark, String hotel, String spa, String shopping, String exhibition, String sports,
			String festival, String religion, String citytour, String prices, String island, String continent) {
		super();
		this.hID = hID;
		this.ctID = ctID;
		this.food = food;
		this.nature = nature;
		this.activity = activity;
		this.history = history;
		this.themepark = themepark;
		this.hotel = hotel;
		this.spa = spa;
		this.shopping = shopping;
		this.exhibition = exhibition;
		this.sports = sports;
		this.festival = festival;
		this.religion = religion;
		this.citytour = citytour;
		this.prices = prices;
		this.island = island;
		this.continent = continent;
	}

	public String gethID() {
		return hID;
	}

	public void sethID(String hID) {
		this.hID = hID;
	}

	public String getCtID() {
		return ctID;
	}

	public void setCtID(String ctID) {
		this.ctID = ctID;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public String getNature() {
		return nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		this.activity = activity;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}

	public String getThemepark() {
		return themepark;
	}

	public void setThemepark(String themepark) {
		this.themepark = themepark;
	}

	public String getHotel() {
		return hotel;
	}

	public void setHotel(String hotel) {
		this.hotel = hotel;
	}

	public String getSpa() {
		return spa;
	}

	public void setSpa(String spa) {
		this.spa = spa;
	}

	public String getShopping() {
		return shopping;
	}

	public void setShopping(String shopping) {
		this.shopping = shopping;
	}

	public String getExhibition() {
		return exhibition;
	}

	public void setExhibition(String exhibition) {
		this.exhibition = exhibition;
	}

	public String getSports() {
		return sports;
	}

	public void setSports(String sports) {
		this.sports = sports;
	}

	public String getFestival() {
		return festival;
	}

	public void setFestival(String festival) {
		this.festival = festival;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getCitytour() {
		return citytour;
	}

	public void setCitytour(String citytour) {
		this.citytour = citytour;
	}

	public String getPrices() {
		return prices;
	}

	public void setPrices(String prices) {
		this.prices = prices;
	}

	public String getIsland() {
		return island;
	}

	public void setIsland(String island) {
		this.island = island;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	@Override
	public String toString() {
		return "HashtagDTO [hID=" + hID + ", ctID=" + ctID + ", food=" + food + ", nature=" + nature + ", activity="
				+ activity + ", history=" + history + ", themepark=" + themepark + ", hotel=" + hotel + ", spa=" + spa
				+ ", shopping=" + shopping + ", exhibition=" + exhibition + ", sports=" + sports + ", festival="
				+ festival + ", religion=" + religion + ", citytour=" + citytour + ", prices=" + prices + ", island="
				+ island + ", continent=" + continent + "]";
	}	
}

