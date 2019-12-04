package service.supervisor.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.board.face.BoardDao;
import dao.board.face.BoardFileDao;
import dao.board.impl.BoardDaoImpl;
import dao.board.impl.BoardFileDaoImpl;
import dao.place.face.PlaceDao;
import dao.place.impl.PlaceDaoImpl;
import dao.supervisor.face.SupervisorDao;
import dao.supervisor.impl.SupervisorDaoImpl;
import dto.board.Board;
import dto.board.BoardFile;
import dto.board.Report;
import dto.login.Member;
import dto.place.PlaceDto;
import dto.place.PlaceFile;
import dto.supervisor.Supervisor;
import service.place.face.PlaceService;
import service.place.impl.PlaceServiceImpl;
import service.supervisor.face.SupervisorService;
import util.Paging;

public class SupervisorServiceImpl implements SupervisorService{
	
	//SupervisorDao 객체
	private SupervisorDao supervisordao = new SupervisorDaoImpl();
	private BoardDao boardDao = new BoardDaoImpl();


	@Override
	public Supervisor getLoginMember(HttpServletRequest req) {
		Supervisor supervisor = new Supervisor();

		supervisor.setSuper_id(req.getParameter("supervisor_id"));
		supervisor.setSuper_pw(req.getParameter("supervisor_pw"));

		return supervisor;
	}

	@Override
	public boolean login(Supervisor supervisor) {
		if( supervisordao.selectCntMemberByUseridAndUserpw(supervisor) >= 1 ) {
			//로그인 성공
			return true;

		} else {
			//로그인 실패
			return false;
			
		}
	}

	@Override
	public Supervisor getMemberByUserid(Supervisor supervisor) {
		return supervisordao.selectMemberByUserid(supervisor);
	}

	@Override
	public List<Member> getuserList(Paging paging) {
		return supervisordao.getUserList(paging);
	}

	@Override
	public void DeleteUser(HttpServletRequest req) {
		String[] params= req.getParameterValues("check");

		Member member = new Member();

		for(String param : params) {
			System.out.println(param);

			member.setUser_number(Integer.parseInt(param));

			supervisordao.memberdelete(member);

		}
				
	}

	@Override
	public Paging memberListgetPaging(HttpServletRequest req) {
		// 요청파라미터 curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0;
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
//		System.out.println("curPage: "+curPage);

		// Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
		int totalCount = supervisordao.memberselectCntAll(req);
		System.out.println("totalcount:" + totalCount);
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		if(req.getParameter("search")!=null&&!"".equals(req.getParameter("search"))) {
			paging.setSearch(req.getParameter("search"));
		}
		
		return paging;
	}

	@Override
	public void UpdatePlace(HttpServletRequest req) {

		// 1. 파일업로드 형태의 데이터가 맞는지 확인
		// enctype이 multipart/form-data가 맞는지 호가인
		boolean isMultipart = false;
		isMultipart = ServletFileUpload.isMultipartContent(req);

		// 1-1. multipart/form-data인코딩으로 전송되지 안았을 경우
		if (!isMultipart) {
			return;
		}
		// 1.2 여기 이후는 multipart/form-data로 요청된 상황임
		// 파일이 전송되었음

		// 2.업로드된 파일을 처리하는 아이템 팩토리 객체 생성

		// ItemFactory :업로드된 파일을 처리하는 방식을 정하는 클래스

		// FileItem : 클라이언트로부터 전송된 데이터를 객체화시킨 것

		// DiskFileItemFactory class
		// ->디스크기반(HDD)의 파일아이템 처리 API
		// ->업로드된 파일을 디스크에 임시 저장하고 후처리한다.
		DiskFileItemFactory factory = null;
		factory = new DiskFileItemFactory();

		// 3.업로드된 아이템이 용량이 적당히 작으면 메모리에서 처리
		int maxMem = 1 * 1024 * 1024;// 1MB
		factory.setSizeThreshold(maxMem);

		// 4.용량이 적당히 크면 임시파일을 만들어서 처리(디스크)
		ServletContext context = req.getServletContext();

		String path = context.getRealPath("tmp");

		File repository = new File(path);

		// TEST
		// System.out.println("repository:"+repository);

		factory.setRepository(repository);

		// 5.업로드 허용 용량 기준을 넘지 않을 경우에만 업로드 처리
		int maxFile = 10 * 1024 * 1024;// 10MB

		// 파일 업로드 객체 생성
		ServletFileUpload upload = null;
		upload = new ServletFileUpload(factory);

		// 0파일 업로드 용량제한 설정 : 10 MB

		upload.setFileSizeMax(maxFile);

		// ----- 파일 업로드 준비 완료------

		// 6. 업로드된 데이터 추출(파싱)
		// 임시 파일 업로드도 같이 수행함
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(req);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		// 7.파싱된 데이터 처리하기
		// items 리스트에 요청파라미터가 파싱되어있음

		// 요청정보의 형태 3가지
		// 1.빈 파일(용량이0인 파일)
		// 2.form-data (일반적인 요청파라미터)
		// 3.파일

		Iterator<FileItem> iter = items.iterator();

		PlaceDto place = new PlaceDto();
		PlaceDao placedao= new PlaceDaoImpl();
		PlaceService placeservice= new PlaceServiceImpl();
		PlaceFile placeFile = new PlaceFile();

		// 모든 요청정보 처리
		while (iter.hasNext()) {
			FileItem item = iter.next();

			// 1) 빈 파일 처리
			if (item.getSize() <= 0)
				continue;

			// 2) 일반적인 요청 데이터 처리
			if (item.isFormField()) {
				// form-data일 경우
				// key:value 쌍으로 전달된 요청 파라미터

				// key-getFieldName()
				// value-getString()

				// 기본 처리 방식
				/*
				 * out.println("--- 폼 필드 ---"+"<br>");
				 * out.println("키 : "+item.getFieldName()+"<br>");
				 * out.println("값 : "+item.getString()+"<br>");
				 */
				// key값에 따라 처리방식 다르게 하기
				String key = item.getFieldName();

				if ("place_number".equals(key)) {
					try {
						int place_number = (Integer.parseInt(item.getString("utf-8")));
						place.setPlace_number(place_number);
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}

				} else if ("place_name".equals(key)) {
					try {
						place.setPlace_name(item.getString("utf-8"));
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}

				} else if ("coordinate_lat".equals(key)) {
					try {
						place.setCoordinate_lat(Double.parseDouble(item.getString("utf-8")));
					} catch (NumberFormatException | UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} // key 값 비교 if
				} else if ("coordinate_lng".equals(key)) {
					try {
						place.setCoordinate_lng(Double.parseDouble(item.getString("utf-8")));
					} catch (NumberFormatException | UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} // key 값 비교 if
				} else if ("address".equals(key)) {
					try {
						place.setAddress(item.getString("utf-8"));
					} catch (NumberFormatException | UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} // key 값 비교 if
				} else if ("place_cate".equals(key)) {
					try {
						place.setPlace_cate(item.getString("utf-8"));
					} catch (NumberFormatException | UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} // key 값 비교 if
				} else if ("detail".equals(key)) {
					try {
						place.setDetail(item.getString("utf-8"));
					} catch (NumberFormatException | UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} // key 값 비교 if
				} else if ("db_web_site".equals(key)) {
					try {
						place.setDb_web_site(item.getString("utf-8"));
					} catch (NumberFormatException | UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} // key 값 비교 if
				} else if ("business_hours".equals(key)) {
					try {
						place.setBusiness_hours(item.getString("utf-8"));
					} catch (NumberFormatException | UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} // key 값 비교 if
				} else if ("tel_number".equals(key)) {
					try {
						place.setTel_number(item.getString("utf-8"));
					} catch (NumberFormatException | UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} // key 값 비교 if
				} else if ("place_information".equals(key)) {
					try {
						place.setPlace_information(item.getString("utf-8"));
					} catch (NumberFormatException | UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} // key 값 비교 if
				}
			} else {// 3)파일 처리
				// 업로드 파일 처리 방법 2가지
				// 1.웹 서버의 로컬 디스크에 저장
				// 파일의 정보는 DB에 기록

				// 2.DB의 테이블에 컬럼으로 저장

				// ---------------------------------

				// 로컬파일로 저장하고 DB에 기록하느나 방식으로 진행

				// --- UUID 생성 ---
				UUID uuid = UUID.randomUUID();// 랜덤 UID 생성

				String u = uuid.toString().split("-")[4];
				// ---------------------------

				// 로컬 파일 저장소에 파일 저장하기

				// 로컬 저장소 파일 객체
				File up = new File(context.getRealPath("upload"), item.getName() + "_" + u);

				// 파일의 경로는 "/upload"
				// 파일의 이름은 "원본명_uid"

				// System.out.println(up);

				// ---DB에 업로드 정보 기록하기---
				// 원본파일명 origin_name
				// 저장파일명 stored_name
				// ------------------------

				placeFile.setOriginname(item.getName());
				placeFile.setStoredname(item.getName() + "_" + u);
				placeFile.setFilesize((int) item.getSize());

				try {
					item.write(up);// 실제 업로드
					item.delete();// 임시 파일 삭제
				} catch (Exception e) {

					e.printStackTrace();
				}
				// -----------------------------

			} // 파일처리 if
		} // 요청파라미터 처리 while

		place.setPlace_number(Integer.parseInt(req.getParameter("place_number")));
		
		if (placeFile.getFilesize() != 0) {
			PlaceFile prevfile = placeservice.getfile(place);
			if (prevfile != null) {
				File prev = new File(req.getSession().getServletContext().getRealPath("upload"),
						prevfile.getStoredname());
				prev.delete();

				placedao.delete(prevfile);
			}
			
			placeFile.setPlace_number(place.getPlace_number());
			placedao.insertFile(placeFile);
			
		}
		
		placedao.updatePlace(place);
	}

	@Override
	public void placeDelete(HttpServletRequest req) {
		PlaceDto place =new PlaceDto();
		PlaceDao placedao= new PlaceDaoImpl();
		
		PlaceService placeservice= new PlaceServiceImpl();
		place.setPlace_number(Integer.parseInt(req.getParameter("place_number")));
		
		PlaceFile placeFile = placeservice.getfile(place);

		System.out.println("1"+req);
		System.out.println("2"+req.getSession());
		System.out.println("3"+req.getSession().getServletContext());
		System.out.println("4"+req.getSession().getServletContext().getRealPath("upload"));
		System.out.println("5"+placeFile);
		
//		System.out.println("6"+placeFile.getStoredname());
		if(placeFile !=null) {
			File prev
			= new File(
					req.getSession()
					.getServletContext()
					.getRealPath("upload"),
					placeFile.getStoredname());

			prev.delete();

			placedao.deletefile(placeFile);
			placedao.deleteplace(place);
		}else {
			placedao.deleteplace(place);
		}
		

	}

	@Override
	public Paging reportListgetPaging(HttpServletRequest req) {
		// 요청파라미터 curPage를 파싱한다
				String param = req.getParameter("curPage");
				int curPage = 0;
				if (param != null && !"".equals(param)) {
					curPage = Integer.parseInt(param);
				}
//				System.out.println("curPage: "+curPage);

				// Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환
				int totalCount = supervisordao.reportselectCntAll(req);
				System.out.println("totalcount:" + totalCount);
				// Paging 객체 생성
				Paging paging = new Paging(totalCount, curPage);
				
				if(req.getParameter("search")!=null&&!"".equals(req.getParameter("search"))) {
					paging.setSearch(req.getParameter("search"));
				}
				
				return paging;
	}

	@Override
	public List<Report> getreportList(Paging paging) {
	
		return supervisordao.getreportList(paging);
	}

	@Override
	public void DeleteReport(HttpServletRequest req) {
		String[] params= req.getParameterValues("check");
	
		Report report = new Report();

		for(String param : params) {
			System.out.println(param);

			report.setReportno(Integer.parseInt(param));

			supervisordao.reportdelete(report);

		}
		
	}

	@Override
	public void deleteCheckBoardno(String[] check) {
		supervisordao.deleteBoardList(check);
	}

	@Override
	public List<Board> getNoticeList(Paging paging) {
		
		return supervisordao.getNoticeList(paging);
	}

	@Override
	public Paging noticeListgetPaging(HttpServletRequest req) {
		// 요청파라미터 curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0;
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		//		System.out.println("curPage: "+curPage);

		// Board TB와 curPage 값을 이용한 Paging 객체를 생성하고 반환s
		int totalCount = supervisordao.noticeselectCntAll(req);
		
		System.out.println("totalcount:" + totalCount);
		// Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);

		if(req.getParameter("search")!=null&&!"".equals(req.getParameter("search"))) {
			paging.setSearch(req.getParameter("search"));
		}

		return paging;
	}

	@Override
	public void DeleteNotice(HttpServletRequest req) {
		String[] params= req.getParameterValues("check");

		Board board= new Board();

		for(String param : params) {
			System.out.println(param);

			board.setBoardno(Integer.parseInt(param));

			supervisordao.noticedelete(board);

		}
		
	}



	@Override
	public void UpdateNotice(HttpServletRequest req) {
		// 1. 파일업로드 형태의 데이터가 맞는지 확인
				// enctype이 multipart/form-data가 맞는지 호가인
				boolean isMultipart = false;
				isMultipart = ServletFileUpload.isMultipartContent(req);

				// 1-1. multipart/form-data인코딩으로 전송되지 안았을 경우
				if (!isMultipart) {
					return;
				}
				// 1.2 여기 이후는 multipart/form-data로 요청된 상황임
				// 파일이 전송되었음

				// 2.업로드된 파일을 처리하는 아이템 팩토리 객체 생성

				// ItemFactory :업로드된 파일을 처리하는 방식을 정하는 클래스

				// FileItem : 클라이언트로부터 전송된 데이터를 객체화시킨 것

				// DiskFileItemFactory class
				// ->디스크기반(HDD)의 파일아이템 처리 API
				// ->업로드된 파일을 디스크에 임시 저장하고 후처리한다.
				DiskFileItemFactory factory = null;
				factory = new DiskFileItemFactory();

				// 3.업로드된 아이템이 용량이 적당히 작으면 메모리에서 처리
				int maxMem = 1 * 1024 * 1024;// 1MB
				factory.setSizeThreshold(maxMem);

				// 4.용량이 적당히 크면 임시파일을 만들어서 처리(디스크)
				ServletContext context = req.getServletContext();

				String path = context.getRealPath("tmp");

				File repository = new File(path);

				// TEST
				// System.out.println("repository:"+repository);

				factory.setRepository(repository);

				// 5.업로드 허용 용량 기준을 넘지 않을 경우에만 업로드 처리
				int maxFile = 10 * 1024 * 1024;// 10MB

				// 파일 업로드 객체 생성
				ServletFileUpload upload = null;
				upload = new ServletFileUpload(factory);

				// 0파일 업로드 용량제한 설정 : 10 MB

				upload.setFileSizeMax(maxFile);

				// ----- 파일 업로드 준비 완료------

				// 6. 업로드된 데이터 추출(파싱)
				// 임시 파일 업로드도 같이 수행함
				List<FileItem> items = null;
				try {
					items = upload.parseRequest(req);
				} catch (FileUploadException e) {
					e.printStackTrace();
				}

				// 7.파싱된 데이터 처리하기
				// items 리스트에 요청파라미터가 파싱되어있음

				// 요청정보의 형태 3가지
				// 1.빈 파일(용량이0인 파일)
				// 2.form-data (일반적인 요청파라미터)
				// 3.파일

				Iterator<FileItem> iter = items.iterator();

				Board board = new Board();
				BoardFile uploadFile = new BoardFile();
				BoardFileDao boardfiledao = new BoardFileDaoImpl();

				// 모든 요청정보 처리
				while (iter.hasNext()) {
					FileItem item = iter.next();

					// 1) 빈 파일 처리
					if (item.getSize() <= 0)
						continue;

					// 2) 일반적인 요청 데이터 처리
					if (item.isFormField()) {
						// form-data일 경우
						// key:value 쌍으로 전달된 요청 파라미터

						// key-getFieldName()
						// value-getString()

						// 기본 처리 방식
						/*
						 * out.println("--- 폼 필드 ---"+"<br>");
						 * out.println("키 : "+item.getFieldName()+"<br>");
						 * out.println("값 : "+item.getString()+"<br>");
						 */
						// key값에 따라 처리방식 다르게 하기
						String key = item.getFieldName();

						if ("title".equals(key)) {
							try {
								String title = item.getString("utf-8");
								board.setTitle(title);
							} catch (UnsupportedEncodingException e) {
								e.printStackTrace();
							}

						} else if ("content".equals(key)) {
							try {
								board.setContent(item.getString("utf-8"));
							} catch (UnsupportedEncodingException e) {
								e.printStackTrace();
							}

						} else if ("boardno".equals(key)) {
							try {
								board.setBoardno(Integer.parseInt(item.getString("utf-8")));
							} catch (NumberFormatException | UnsupportedEncodingException e) {
								e.printStackTrace();
							} // key 값 비교 if
							
						} else if ("checkboard".equals(key)) {
							try {
								board.setCheckboard(item.getString("utf-8"));
							} catch (NumberFormatException | UnsupportedEncodingException e) {
								e.printStackTrace();
							} // key 값 비교 if
						}
						
					} else {// 3)파일 처리
						// 업로드 파일 처리 방법 2가지
						// 1.웹 서버의 로컬 디스크에 저장
						// 파일의 정보는 DB에 기록

						// 2.DB의 테이블에 컬럼으로 저장

						// ---------------------------------

						// 로컬파일로 저장하고 DB에 기록하느나 방식으로 진행

						// --- UUID 생성 ---
						UUID uuid = UUID.randomUUID();// 랜덤 UID 생성

						String u = uuid.toString().split("-")[4];
						// ---------------------------

						// 로컬 파일 저장소에 파일 저장하기

						// 로컬 저장소 파일 객체
						File up = new File(context.getRealPath("upload"), item.getName() + "_" + u);

						// 파일의 경로는 "/upload"
						// 파일의 이름은 "원본명_uid"

						// System.out.println(up);

						// ---DB에 업로드 정보 기록하기---
						// 원본파일명 origin_name
						// 저장파일명 stored_name
						// ------------------------

						uploadFile.setOriginname(item.getName());
						uploadFile.setStoredname(item.getName() + "_" + u);
						uploadFile.setFilesize((int) item.getSize());

						try {
							item.write(up);// 실제 업로드
							item.delete();// 임시 파일 삭제
						} catch (Exception e) {

							e.printStackTrace();
						}
						// -----------------------------

					} // 파일처리 if
				} // 요청파라미터 처리 while

				if (uploadFile.getFilesize() != 0) {
					BoardFile prevfile = boardfiledao.getfile(board);
					if (prevfile != null) {
						File prev = new File(req.getSession().getServletContext().getRealPath("upload"),
								prevfile.getStoredname());
						prev.delete();

						boardfiledao.delete(prevfile);
					}
					
					uploadFile.setBoardno(board.getBoardno());
//					board.setBoardno(board.getBoardno());
					boardfiledao.insert(uploadFile);
					
				}
				
				boardDao.update(board);
		
	}

	@Override
	public void deleteCheckNoticeBoardno(String[] check) {
		supervisordao.deleteNoticeList(check);
		
	}

	@Override
	public void deleteCheckuserno(String[] check) {
		supervisordao.deleteMemberList(check);
		
	}




}
