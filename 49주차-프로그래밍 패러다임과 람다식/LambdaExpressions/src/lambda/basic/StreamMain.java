package lambda.basic;

import java.util.Arrays;
import java.util.stream.Stream;

public class StreamMain {
	public static void main(String[] args) {
		String[] arr = new String[]{"넷", "둘", "셋", "하나"};
		
		// 배열에서 스트림 생성
		Stream<String> stream1 = Arrays.stream(arr);
		stream1.forEach(e -> System.out.print(e + " "));
		System.out.println();
		
		// 배열의 특정 부분만을 이용한 스트림 생성
		Stream<String> stream2 = Arrays.stream(arr, 1, 3);
		stream2.forEach(e -> System.out.print(e + " "));		

	}	
	
}
