package lambda.app;

import java.util.Scanner;
import java.util.function.Predicate;

import com.sun.org.apache.bcel.internal.generic.Type;

/**
 * 행운번호 매칭 프로그램
 */

@FunctionalInterface
interface LambdaLuckyNum{
	public boolean myMatch(int a);
}

public class LuckyNum {
	
	final static int todayLuckyNum = 10;
	
	public static Boolean isLuckyNum(int num1) {
		Boolean result = false;
		
		if(num1 == todayLuckyNum) {
			result = true;
		}
		return result;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("행 운 번 호 를 입 력 하 세 요.");
		Scanner userInpuf = new Scanner(System.in);
		int inputNum = userInpuf.nextInt();
		
		System.out.print("→→→→→행운번호 추첨 중(A)→→→→→ ");
		// 행운번호 추천 방법1(메서드)		
		if(isLuckyNum(inputNum)) {
			System.out.println("축하합니다. 행운번호에 당첨되셨습니다.");
		}else {
			System.out.println("아쉽습니다. 다음 기회를 노리세요.");
		}

		System.out.println();
		

		System.out.print("→→→→→행운번호 추첨 중(B)→→→→→ ");
		// 행운번호 추천 방법2(함수형 인터페이스와 람다식 사용)		
		LambdaLuckyNum isLuckyNum2 = (x) -> { return x==todayLuckyNum; }; /*{ if(x==10) return true; else return false; };*/
		if (isLuckyNum2.myMatch(inputNum)) {
			System.out.println("축하합니다. 행운번호에 당첨되셨습니다.");
		}else {
			System.out.println("아쉽습니다. 다음 기회를 노리세요.");
		}
		
		System.out.println();

		System.out.print("→→→→→행운번호 추천 중(C)→→→→→ ");
		// 행운번호 추첨 방법3(java.util.function의 Predicate 인터페이스 사용)		
		Predicate<Integer> isLuckyNum3 = s -> s==todayLuckyNum;
		
		if(isLuckyNum3.test(10)) {
			System.out.println("축하합니다. 행운번호에 당첨되셨습니다.");
		}else {
			System.out.println("아쉽습니다. 다음 기회를 노리세요.");
		}
		
//		Predicate<?> isLuckyNum66 = (Integer s) -> Integer.parseInt(s.toString()) == todayLuckyNum;
//		isLuckyNum66.test(new Integer(1));
		
	}

}
