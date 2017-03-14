package vo;

public class Artist {
	
	private String name;
	private String company;
	private int age;
	
	public Artist(String name, String company, int age) {
		super();
		this.name = name;
		this.company = company;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}
