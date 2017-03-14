package util;

public class ChangeStr {
	public static String changeName(String name) {
		String[] cnamess = new String[name.length()];
		for(int i=0; i<name.length(); i++){
			cnamess[i] = name.substring(i, i+1);
		}
		if(name.length() > 2){
			String cname = "";
			cname += cnamess[0];
			for(int i=1; i<name.length()-1; i++){
				cnamess[i] ="*";
				cname += cnamess[i];
			}
			cname += cnamess[name.length()-1];
			return cname;
		} else {
			return name;
		}	
	}
}
