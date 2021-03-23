package lambda.app;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Compare {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> list = Arrays.asList("abc", "aaa", "bbb", "ddd", "aaa");
		
		// 기존방식
		Collections.sort(list, new Comparator<String>() {
			public int compare(String s1, String s2) {
		    	return s2.compareTo(s1);
		    }
		});
		
		// 람다식
		Collections.sort(list, (s1, s2) -> s2.compareTo(s1));
	}

}
