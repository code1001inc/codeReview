package lambda.app;

/**
 * 고정된 숫자를 다룰 수 있는 계산기가 있다.
 * exec 메서드를 사용하여 고정된 숫자의 더하기, 빼기, 곱하기, 나누기값을 구하라
 */

interface FixedCalc {
	public int cal(int a, int b);
}

public class CalcLambda2 {
	// 람다식 문법 (매개변수 목록)->{실행문}
	public static void exec(FixedCalc fixCal) {
		int k = 12;
		int m = 4;
		int value = fixCal.cal(k, m);
		System.out.println(value);
	}

	public static void main(String[] args) {
		exec( new FixedCalc() {
			public int cal(int a, int b) {
				// TODO Auto-generated method stub
				return a+b;
			}
		});
		
		exec((i, j) -> {
			return i + j;
		});
		exec((i, j) -> {
			return i - j;
		});	
		exec((i, j) -> {
			return i * j;
		});
		exec((i, j) -> {
			return i / j;
		});		
	}
}