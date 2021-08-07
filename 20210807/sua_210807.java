import java.util.StringTokenizer;

//*****************************************************
// https://programmers.co.kr/learn/courses/30/lessons/82612
class sua_210807 {

	static int price = 3;
	static int money = 20;
	static int count = 4;
	
	public static void main(String[] args) {
		System.out.println(solution(price, money, count));
	}
	
	public static long solution(int price, int money, int count) {
		long answer = -1;
	    long total = 0;
	    
	    System.out.println("start");
	    
	    for ( int N=1; N<count; N++ ){
	       total = total + total_sum(price, N);
	       System.out.println("total "+N+" = "+total);
	       
	       if(money > total) {
	    	   answer = total - money;
	    	   System.out.println("answer = "+answer);
	       }else{
	    	   answer=0;
	       }
	    }

	    return answer;
	}

	static int total_sum(int price, int N){
	    int cnt_price = 0;
		cnt_price = price * N;
		System.out.println("cnt_price = " +cnt_price);
	    return cnt_price;
	}
}
//조건 미스1: money int > long
//조건 미스2: 금액이 모자라지 않을 경우는 0출력
//알고리즘: 등차수열 이용

//*****************************************************
//https://programmers.co.kr/learn/courses/30/lessons/42888
//import java.util.StringTokenizer;
class sua_210807_2 {
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
			msg = uid+"님이 들어왔습니다.";
		}else if(ann.equals("Leave")) {
			msg = uid+"님이 나갔습니다.";
		}
		System.out.println(msg);
		return msg;
	}
}
//조건 미스1: 분기를 토큰 갯수로 나누지 말고 uid에서 다음 토큰 여부로 확인할 것
//조건 미스2: 그 뒤 효율적인 방법으로는 맵을 사용

//*****************************************************
//https://programmers.co.kr/learn/courses/30/lessons/77484
class sua_210807_33 {
	static int[] lottos = {44, 1, 0, 0, 31, 25};
	static int[] win_nums = {31, 10, 45, 1, 6, 19};
	/*
	[44, 1, 0, 0, 31, 25]	[31, 10, 45, 1, 6, 19]	[3, 5]
	[0, 0, 0, 0, 0, 0]	[38, 19, 20, 40, 15, 25]	[1, 6]
	[45, 4, 35, 20, 3, 9]	[20, 9, 3, 45, 4, 35]	[1, 1]
	*/
	
	public static void main(String[] args) {
		System.out.println(solution(lottos, win_nums));
	}
	
	static public int[] solution(int[] lottos, int[] win_nums) {
     int[] answer = {};
     
     int max_cnt = 0;
     int min_cnt = 0;
     
     for(int i=0; i<6; i++) {
     	for(int j=0; j<6; j++) {
     		if(lottos[i]==win_nums[j]) {
     			min_cnt++;
     		}
     	}
     	//max_count() 구현 예정
     }
     return answer;
 }
	int max_count() {
		return 0;
	}
}