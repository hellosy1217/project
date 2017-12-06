package com.web.blueballoon.util;

import org.springframework.stereotype.Service;

@Service
public class CategoryInput {

	public String configState(int state) {
		String[] stateChoice = { "서울특별시", "강원도", "경기도", "경상도", "전라도", "제주도", "충청도" };
		/*String[] seoulCity = { "강남구", "종로구", "마포구", "중구", "용산구", };
		String[] kangwonCity = {"평창시", "춘천시", "강릉시", "횡성시" ,"양양시"};
		String[] kyunggiCity = {"용인시", "파주시", "의정부시", "수원특별시", "인천광역시" };
		String[] kyungsangCity = { "부산광역시", "거제시", "통영시", "남해시", "대구광역시", "울산광역시" };
		String[] jeonraCity = { "광주광역시", "순천시", "여수시", "전주시", "남원시"};
		String[] jejuCity = { "제주시", "서귀포시" };
		String[] chungchungCity = { "대전광역시","보령시", "천안시", "청주시" };*/
		String select = null;
		
		switch(state){
			case 0://서울
				select = stateChoice[0];
				break;
			case 1://강원
				select = stateChoice[1];
				break;
			case 2://경기
				select = stateChoice[2];
				break;
			case 3://경상
				select = stateChoice[3];
				break;
			case 4://전라
				select = stateChoice[4];
				break;
			case 5://제주
				select = stateChoice[5];
				break;
			case 6://충청
				select = stateChoice[6];
				break;
			}
		return select;
	}
	
	public int decodeState(String state) {
		String[] stateChoice = { "서울특별시", "강원도", "경기도", "경상도", "전라도", "제주도", "충청도" };
		for(int i = 0; i < stateChoice.length; i ++) {
			if(stateChoice[i].equals(state)) {
				return i;
			}
		}
		return -1;
	}
}
