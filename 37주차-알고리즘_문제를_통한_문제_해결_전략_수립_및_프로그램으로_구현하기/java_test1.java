package test;
/**
10~1000까지 각 숫자 분해하여 곱하기의 전체 합 구하기
예로, 10~15까지의 각 숫자 분해하여 곱하기의 전체 합은 다음과 같다.

10 = 1 * 0 = 0
11 = 1 * 1 = 1
12 = 1 * 2 = 2
13 = 1 * 3 = 3
14 = 1 * 4 = 4
15 = 1 * 5 = 5

그러므로, 이 경우의 답은 0+1+2+3+4+5 = 15
*/
public class java_test1 {
	static final int START = 10;
	static final int END = 1000;
	static int SUM = 0;
	public static void main(String args[]) {
		test(START, END);
	}
	
	public static void test(int S, int E) {
		for(int i = S; i <= E;i++) {
			int TEMP = 0;
			char[] C = (""+i).toCharArray();
			for(int c = 0, len = C.length; c < len; c++) {
				if(c == 0) TEMP = Character.getNumericValue(C[c]);
				else TEMP *= Character.getNumericValue(C[c]);
			}
			SUM += TEMP;
		}
		System.out.println("SUM : " + SUM);
	}
}
