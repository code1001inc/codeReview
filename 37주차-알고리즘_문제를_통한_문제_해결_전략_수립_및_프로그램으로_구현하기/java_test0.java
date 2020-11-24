package test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
주어진 문자열(공백 없이 쉼표로 구분되어 있음)을 가지고 아래 문제에 대한 프로그램을 작성하세요.

이유덕,이재영,권종표,이재영,박민호,강상희,이재영,김지완,최승혁,이성연,박영서,박민호,전경헌,송정환,김재성,이유덕,전경헌

김씨와 이씨는 각각 몇 명 인가요?
"이재영"이란 이름이 몇 번 반복되나요?
중복을 제거한 이름을 출력하세요.
중복을 제거한 이름을 오름차순으로 정렬하여 출력하세요.
*/
public class java_test0 {
	static final String[] NAMES = {"이유덕","이재영","권종표","이재영","박민호","강상희","이재영","김지완","최승혁","이성연","박영서","박민호","전경헌","송정환","김재성","이유덕","전경헌"};
	public static void main(String args[]) {
		String reg1 = "김.*", reg2 = "이.*";
		int KCount = 0, LCount = 0;
		KCount = getMatchCount(reg1);
		LCount = getMatchCount(reg2);
		System.out.println("[1] 김씨 : " + KCount +" 명, 이씨 : " + LCount + " 명");
		
		String reg3 = "이재영";
		int LCount2 = getMatchCount(reg3);
		System.out.println("[2] 이재영 : " + LCount2 + " 명");
		
		ArrayList<String> dn = deleteDuplicationNames();
		System.out.print("[3] ");
		for(String name : dn) 
			System.out.print(name+"  ");
		System.out.println();
		
		Collections.sort(dn);
		System.out.print("[4] ");
		for(String name : dn) 
			System.out.print(name+"  ");
		System.out.println();
	}
	
	public static int getMatchCount(String regex) {
		int result = 0;
		Pattern p = Pattern.compile(regex);
		for(String name : NAMES) {
			Matcher m = p.matcher(name);
			if(m.matches()) result++;
		}
		return result;
	}
	
	public static ArrayList<String> deleteDuplicationNames() {
		HashMap<String, Integer> dn = new HashMap<String, Integer>();
		for(String name : NAMES) 
			dn.put(name, 0);
		return new ArrayList<String>(dn.keySet());
	}
}
