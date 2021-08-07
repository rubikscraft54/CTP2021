package dongdaemun_study;

import java.util.StringTokenizer;

// https://programmers.co.kr/learn/courses/30/lessons/42888
public class sua_210807_2 {
	static StringTokenizer st = null;
	
	public static void main(String[] args) {
		String[] record = {"Enter uid1234 Muzi"
				,"Enter uid4567 Prodo"
				,"Leave uid1234"
				,"Enter uid1234 Prodo"
				,"Change uid4567 Ryan"};
		
		
		System.out.println(solution(record));
	}
	
	static String[] solution(String[] record) {
        String[] answer = {};
        
        for(int i=0; i<record.length; i++) {
        	st = new StringTokenizer(record[i], " ");
        	
        	int cnt_token = st.countTokens();
        	if(cnt_token==2) {
        		//String ann = st.nextToken().toString();
        		
        		if(st.hasMoreTokens()) {
	        		String ann = st.nextToken().toString();
	        		String uid = st.nextElement().toString();
	        		announce(ann, uid);
	        	}
	        	
        	}else if(cnt_token==3) {

        		if(st.hasMoreTokens()) {
	        		String ann = st.nextToken().toString();
	        		String uid = st.nextElement().toString();
	        		//String uname = st.nextElement().toString();
	        		announce(ann, uid);
	        	}
        		
        	}else {
        		System.out.println("error 1");
        	}
        	
        }
        
        return answer;
    }
	
	static String announce(String ann, String uid) {
		String msg = null;
		if(ann.equals("Enter")) {
			msg = uid+"´ÔÀÌ µé¾î¿Ô½À´Ï´Ù.";
		}else if(ann.equals("Leave")) {
			msg = uid+"´ÔÀÌ ³ª°¬½À´Ï´Ù.";
		}
		System.out.println(msg);
		return msg;
	}
}
