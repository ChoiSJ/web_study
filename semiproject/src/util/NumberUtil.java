package util;

public class NumberUtil {
	//페이지 관련 유틸 str값은 선택한 페이지 넘버값 만약 선택한 값이 null일경우 defaultValue에 설정된 페이지 값으로 이동
	public static int StringToInt(String str, int defaultValue, int total){
		if(str == null){
			return defaultValue;
		}
		
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return defaultValue;
		}
		
	}
	public static int StringToInt(String str, int defaultValue) {
		if (str == null) {
			return defaultValue;
		}
		
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return defaultValue;
		}
		
	}
}
