package com.heeeun.boardsite.board;
import java.util.List;


public class CaculatePage {
	public static ResultBean pageInfo(	int page,		//현재 페이지 번호
										int countPage,	// 한 화면에 출력될 게시글수
										int pageList,	// 페이지네이션 개수 < 1 2 3 4 5 >
										int totalCount) {//전체 게시물수(보드DB에 저장된 튜플의수)
		ResultBean resultBean = new ResultBean();
		//초기값
		int totalPage = 1;    				// 전체페이지수(페이지네이션의 가장 마지막 번호)
		int startPage = 1;        		// 시작페이지 번호
		int endPage = 1;         			// 한 화면(그룹)에서 끝페이지 번호
		int selectPageNo = 1;      			// 선택된 페이지 번호 (인자로 들어온 page와 같은값)
		int previousPage = 1;  	// 이전 그룹의 시작페이지 번호
		int nextPage = 1;       // 다음 그룹의 시작페이지
		int groupNo = 0;           			// 페이지별 그룹넘버
		
		//DB 성능향상
		int startRow = 0;
		int endRow=0;
		
		//1. 전체 페이지 수 계산(totalPage)
		totalPage = totalCount / countPage;
		if(totalCount%countPage >0) {
		//만약 총개수가 25개이고 한 화면에 출력될 페이지수가 10개라면 3개의 토탈 페이지가 필요
			totalPage++; 
		}
		if(totalPage < page) {
			page = totalPage;
		}
		// 2.한 화면(그룹) 에서 보여지는 그룹
		selectPageNo=page;
		groupNo = (selectPageNo-1)/pageList;
		//그룹넘버 = (현재페이지-1)/페이지네이션 개수
		// 만일 pageList 를 5 으로 설정하였을 경우
		//page가 3이면 (3-1)/5=0.4->정수형이므로 소수점 버림
		//page가 6이면 (6-1)/5=1
		//page가 15이면 (15-1)/5=2.8->정수형이므로 소수점 버림
		/* 
		       1  2  3  4   5 ▶ --> 0번 그룹
		  	◀  6  7  8  9  10 ▶ --> 1번 그룹
		  	◀ 11 12 13 14  15 ▶ --> 2번 그룹
		 	이제 이 그룹 번호로 시작과 끝 번호를 찾는다.*/
		// 3.한 화면(그룹) 에서 시작페이지와 끝페이지 (ex) 0번 그룹의 경우 start=1, end=5)
		startPage = groupNo*pageList+1; // 그룹번호*페이지네이션개수+1
		endPage = groupNo*pageList+pageList;//그룹번호*페이지네이션개수+페이지네이션개수
		if (startPage > totalPage) {startPage = startPage - pageList + 1;}
		if(endPage>totalPage) {endPage=totalPage;}
		// 4.이전 화면그룹의 시작페이지와 끝페이지(◀, ▶ 클릭할때 이동할 페이지)
		if(page > 1) {
			previousPage = page - 1;
		}
		if(page < totalCount) {
			nextPage = page + 1;
		}
		// 5. 보여줘여할 게시물 테이블 데이타의 시작번호,끝번호(DB성능 향상용)
		// ex)countpage가 10일경우 0번그룹->1~10번의 게시물을 select 1번그룹 ->11~20번 게시물 select
		if (selectPageNo == 1 && selectPageNo == totalCount){// 1페이지인경우..
			startRow=1;
			endRow = totalCount;
		}else if (selectPageNo < totalCount){
			startRow=countPage*selectPageNo-countPage + 1;
			endRow = countPage*selectPageNo-countPage + countPage;
		}else if ( selectPageNo == totalCount){ // 끝페이지인경우..
			startRow=countPage * selectPageNo - countPage + 1;
			endRow = totalCount;
		}
		// 페이징처리에 필요한 정보를 ListResultBean에 세팅
		resultBean.setTotalPage(totalPage);
		resultBean.setStartPage(startPage);
		resultBean.setEndPage(endPage);
		resultBean.setSelectPageNo(selectPageNo);
		resultBean.setPreviousPage(previousPage);
		resultBean.setNextPage(nextPage);
		resultBean.setGroupNo(groupNo);
		
		resultBean.setShowPrevious(isShowPreviousIcon(selectPageNo));
		resultBean.setShowNext(isShowNextIcon(selectPageNo, totalPage));
		//resultBean.setShowPrevious(isShowPreviousIcon(selectPageNo));
		//resultBean.setShowNext(isShowNextIcon(selectPageNo, totalPage));
		resultBean.setShowFirst(isShowFirstIcon(groupNo, totalPage));
		resultBean.setShowLast(isShowLastIcon(endPage, totalPage));
		
		resultBean.setStartRow(startRow);
		resultBean.setEndRow(endRow);
		
		return resultBean;
	}
	
	// 페이지에 [이전페이지] 출력여부를 판단하는 메소드(현제 페이지가 1보다 크면 보여줌)
		 
		public static boolean isShowPreviousIcon(int selectPageNo){
			boolean isShow = false;	
			if (selectPageNo > 1) isShow = true;
			return isShow;

		  }
	    
		  // 페이지에 [다음페이지] 출력여부를 판단하는 메소드(현재페이지가 마지막 페이지보다 작으면 보여줌)
		
		public static boolean isShowNextIcon(int selectPageNo,int totalPage){
			  boolean isShow = false;
			  if (selectPageNo < totalPage) isShow = true;
			  return isShow;
		  }	  
		// 페이지에 [이전 그룹] 출력여부를 판단하는 메소드
		  public  static boolean isShowPreviousMoreIcon(int groupNo,int totalPage) {
			  boolean isShow = false;
			  int modula = 0;//이 모듈a는 totalPage가 0값일때 분모는 0이 될수없 는 에러를 보정하기 위한값으로 보임
			  modula = groupNo % totalPage;
			  if (modula !=0 ) modula = 1;		  
			  if ((groupNo / totalPage + modula) >0) {
				  isShow =true;
			  }	  
			  return isShow;
		  }
		  

		  // 페이지에 [다음 그룹] 출력여부를 판단하는 메소드
		  public  static boolean isShowNextMoreIcon(int endPage,int totalPage) {
			  if (endPage < totalPage) 
					return true;
				else 
					return false;
		  }
		  
//		 페이지에 [처음으로] 아이콘 출력여부를 판단하는 메소드
		  public  static boolean isShowFirstIcon(int groupNo,int totalPage){
				int modula = 0;
				modula = groupNo % totalPage;
				if (modula!=0) modula = 1;
				if ((groupNo / totalPage + modula) > 0) 
					return true;
				else 
					return false;
				  
		  }  

		  // 페이지에 [마지막으로] 아이콘 출력여부를 판단하는 메소드
		  public  static boolean isShowLastIcon(int endPage,int totalPage) {
				if (endPage < totalPage)
					return true;
				else 
					return false;
		  } 
		  
		  
	
	
	
}

