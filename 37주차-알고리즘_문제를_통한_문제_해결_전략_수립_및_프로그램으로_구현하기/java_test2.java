package test;
/**
1부터 10,000까지 8이라는 숫자가 총 몇번 나오는가?

8이 포함되어 있는 숫자의 갯수를 카운팅 하는 것이 아니라 8이라는 숫자를 모두 카운팅 해야 한다.
(※ 예를들어 8808은 3, 8888은 4로 카운팅 해야 함)
*/

public class java_test2 {
	static final int LIMIT = 10000;
	public static void main(String args[]) {
		test(LIMIT);
	}
	
	public static void test(int L) {
		int TOTAL = 0;
		for(int i = 1; i < L; i++) 
			for(char c : (String.valueOf(i)).toCharArray()) 
				if(c == '8') TOTAL++;
		System.out.println("TOTAL 8 COUNT IS : " + TOTAL);
	}
}
