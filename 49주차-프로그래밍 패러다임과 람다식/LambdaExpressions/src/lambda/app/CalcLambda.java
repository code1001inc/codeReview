package lambda.app;

/**
 * 두 숫자를 다룰 수 있는 계산기가 있다.
 * 두 숫자를 받아 더하기, 빼기, 곱하기, 나누기, 나머지값을 구할 수 있는 프로그램을 구현하라
 * 단, 람다식을 이용하여 개발하라.
 */

@FunctionalInterface
interface LambdaCalculater{
	public int cal(int a, int b);
}

public class CalcLambda{
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		LambdaCalculater addCal = (int num1, int num2) -> { return num1 + num2; };
		LambdaCalculater subCal = (int num1, int num2) -> { return num1 - num2; };
		LambdaCalculater mulCal = (int num1, int num2) -> { return num1 * num2; };
		LambdaCalculater divCal = (int num1, int num2) -> { return num1 / num2; };
		LambdaCalculater modCal = (int num1, int num2) -> { return num1 % num2; };
		
		System.out.println("두 수의 합은 : " + addCal.cal(5, 2));
		System.out.println("두 수의 차는 : " + subCal.cal(5, 2));
		System.out.println("두 수의 곱은 : " + mulCal.cal(5, 2));
		System.out.println("두 수의 몫은 : " + divCal.cal(5, 2));
		System.out.println("두 수의 남은 : " + modCal.cal(5, 2));
		
		// 람다식 축약 1단계
		addCal = (num1, num2) -> { return num1 + num2; };      
		subCal = (num1, num2) -> { return num1 - num2; };      
		mulCal = (num1, num2) -> { return num1 * num2; };      
		divCal = (num1, num2) -> { return num1 / num2; };      
		modCal = (num1, num2) -> { return num1 % num2; };
		
		// 람다식 축약 2단계		
		addCal = (num1, num2) -> num1 + num2;      
		subCal = (num1, num2) -> num1 - num2;      
		mulCal = (num1, num2) -> num1 * num2;      
		divCal = (num1, num2) -> num1 / num2;
		modCal = (num1, num2) -> num1 % num2;		
	}
}

