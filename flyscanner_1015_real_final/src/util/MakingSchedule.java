package util;

import java.io.FileWriter;
import java.util.Random;

public class MakingSchedule {

	public static void main(String[] args) {
		making();
	}

	// departTime, arriveTime, airline, price, departCtID, arriveCtID
	// ('2020-10-01 09:00:00', '2020-10-01 13:00:00', 6, 550000, 10, 20)

	// departTime: 2020-10-15 hh:00:00
	// arriveTime: 2020-10-15 hh:00:00
	// yyyy-MM-dd
	// 0 <= hh <= 18

	// departTime: 2020-10-15 17:00:00
	// arriveTime: 2020-10-15 22:00:00

	// 항공사: 6, 7, 8, 9

	// price: 300,000~700,000

	static public void making() {
		Random r = new Random();
		
		int day = 0;
		
		// departTime, arriveTime
		int hour = 0;

		// airline
		int[] airlineList = {6, 7, 8, 9};
		int airline = 0;

		// price
		int price = 0;

		// departCtID, arriveCtID
		int departCtID = 10;
		int[] arriveList = {20, 30, 40, 50};
		int arriveCtID = 0;

		for (int i = 0; i < 16; i++) {
			day = 15 + i; // 일단 30일까지 해보자
			hour = r.nextInt(18);
			String departTime = "2020-10-" + day + " " + hour + ":00:00";
			String arriveTime = "2020-10-" + day + " " + (hour+5) + ":00:00";
			if (i > 4) {
			}
			else {
				airline = airlineList[i];
				
			}
			
		}

//		try {
//			FileWriter file = new FileWriter("schedule.txt");
//			file.write("");
//			
//			file.close();
//		} catch (Exception e) {
//		}
	}

}
