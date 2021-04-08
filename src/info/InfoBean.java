package info;

public class InfoBean {
	private String name;
	private String id;

	public String getGender() {
		String g = "모름";
		char sex = id.charAt(7);
		if (sex == '1' || sex == '3')
			g = "남자";
		else if (sex == '2' || sex == '4')
			g = "여자";
		return g;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
