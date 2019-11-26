package place.service.impl;

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

import place.dao.face.CommentDao;
import place.dao.face.PlaceDao;
import place.dao.impl.CommentDaoImpl;
import place.dao.impl.PlaceDaoImpl;
import place.dto.Comment;
import place.dto.PlaceDto;
import place.dto.PlaceFile;
import place.service.face.PlaceService;


public class PlaceServiceImpl implements PlaceService {
	
	PlaceDao placeDao = new PlaceDaoImpl();
	CommentDao commentDao = new CommentDaoImpl();
	
	@Override
	public void write(HttpServletRequest req) {
		// TODO Auto-generated method stub
		PlaceDto place = new PlaceDto();
		
		PlaceFile placeFile = new PlaceFile();
		
		// TODO Auto-generated method stub
		//응답 객체 Content-type 설정
//				resp.setContentType("text/html; charset=UTF-8");
				String place_name=null;
				String place_information=null;
				int place_number=0;
				Double coordinate_lat=0.0;
				Double coordinate_lng=0.0;
				String address=null;
				String place_cate=null;
				String detail=null;
				String db_web_site=null;
				String business_hours=null;
				String tel_number=null;
				//응답 객체 출력 스트림 얻기
			
				
				//1.파일업로드 형태의 데이터가 맞는지 확인
				// enctype 이 multipart/form-data 가 맞는지 확인
				
				boolean isMultipart= false;
				isMultipart =ServletFileUpload.isMultipartContent(req);
				
				//1-1 .multipart/form-data 인코딩으로 전송되지 않았을 경우
			
				
				//1.2 여기 이후는 multipart/form-data 로 요청된 상황임
				// 파일이 전송되었음
				
				//2.업로드된 파일을 처리하는 아이템 팩토리 객체 생성
				
				// Itemfactory: 업로드된 파일을 처리하는 방식을 정하는 클래스
				
				//FileItem: 클라이언트로부터 전송된 데이터를 객체화 시킨것
				
				//DiskFileItemFactory class
				//-> 디스크 기반(HDD) 의 파일 아이템 처리 API
				// -> 업로드된 파일을 디스크에 임시 저장하고 후처리한다
				DiskFileItemFactory factory = null;
				factory = new DiskFileItemFactory();
				                           
				//3. 업로드된 아이템이 용량이 적당히 작으면 메모리에서 처리
				int maxMem =1*1024*1024;//1MB
				factory.setSizeThreshold(maxMem);
				//4. 용량이 적당히 크면 임시 파일을 만들어서 처리(디스크)
				
				ServletContext context= req.getServletContext();
				
				String path = context.getRealPath("tmp");
				
				File repository = new File(path);
				
				//TEST
//				System.out.println("repository:"+ repository);
				
				factory.setRepository(repository);
				//5. 업로드 허용 용량 기준을 넘지 않을 경우에만 업로드 처리
				int maxFile = 10*1024*1024;//10mb
				
				//파일 업로드 객체 생성
				ServletFileUpload upload =null;
				upload = new ServletFileUpload(factory);
				
				//파일 업로드 용량 제한 설정 : 10MB
				upload.setFileSizeMax(maxFile);
				
				//---------파일 업로드 준비 완료-------------
				
				
				//6. 업로드된 데이터 추출 (파싱)
				// 임시 파일 업로드도 같이 수행함
				List<FileItem> items= null;
				try {
					items=upload.parseRequest(req);
				} catch (FileUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//7.파싱된 데이터 처리하기
				//items 리스트에 요청파라미터가 파싱되어있음
				
				//요청정보의 형태 3가지
				//	1.빈파일(용량이 0인 파일)
				//  2.form-data(일반적인 요청파라미터)
				//  3. 파일
				
				Iterator<FileItem> iter= items.iterator();
				
				//모든 요청정보 처리
				while(iter.hasNext()) {
					
					FileItem item= iter.next();
					//1) 빈파일 처리
					if(item.getSize()<=0)continue;
					//2) 일반적인 요청 데이터 처리
					if(item.isFormField()) {
						//form-data일경우
						//	key:value 쌍으로 전달된 요청 파라미터
						
						//key - getFiledName()
						//value - getString()
						
						
//						//기본 처리 방식
//						out.println("---폼필드---"+"<br>");
//						out.println("키:"+item.getFieldName()+"<br>");
//						out.println("값:"+item.getString()+"<br>");
					//key값에 따라 처리방식 다르게 하기
						String key =item.getFieldName();
						
						if("place_number".equals(key)) {
							try {
								place_number=Integer.parseInt(item.getString("utf-8"));
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
						}else if ("place_name".equals(key)) {
							try {
								place_name=item.getString("utf-8");
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}else if ("coordinate_lat".equals(key)) {
							try {
								coordinate_lat=Double.parseDouble(item.getString("utf-8"));
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}else if ("coordinate_lng".equals(key)) {
							try {
								coordinate_lng=Double.parseDouble(item.getString("utf-8"));
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}else if ("address".equals(key)) {
							try {
								address=item.getString("utf-8");
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}else if ("place_cate".equals(key)) {
							try {
								place_cate=item.getString("utf-8");
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}else if ("detail".equals(key)) {
							try {
								detail=item.getString("utf-8");
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}else if ("db_web_site".equals(key)) {
							try {
								db_web_site=item.getString("utf-8");
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}else if ("business_hours".equals(key)) {
							try {
								business_hours=item.getString("utf-8");
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}else if ("tel_number".equals(key)) {
							try {
								tel_number=item.getString("utf-8");
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}else if ("place_information".equals(key)) {
							try {
								place_information=item.getString("utf-8");
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}


						
					}else {//3)파일 처리
						//업로드 파일 처리 방법 2가지
						//	1.웹 서버의 로컬 디스크에 저장
						//	파일의 정보는 DB에 기록
						
						//	2. DB의 컬럼으로 저장
						//-------------------------
						//로컬파일로 저장하고 DB 에 기록하는 방식으로 진행
						
						//UUid 생성
						UUID uuid =UUID.randomUUID();//랜덤 UID생성
						
						//12자리 UID 얻기
						String u = uuid.toString().split("-")[4];
						
						//-----------------------
						
						//로컬 파일 저장소에 파일 저장하기
						
						//로컬 저장소 파일 객체
						File up = new File(
								context.getRealPath("upload"),
								item.getName()+"_"+u);
						//파일의 경로는 "/upload"
						//파일의 이름은 "원본명_uid"
//						System.out.println(up);
						
						//DB에 업로드 정보 기록하기-----
						// 파일번호 fileno
						//원본 파일명 origin_name
						//저장파일명 stored_name
//						uploadFile.setBoardno(bor.getBoardno());
						placeFile.setOriginname(item.getName());
						placeFile.setStoredname(item.getName()+"_"+u);
						placeFile.setFilesize((int)item.getSize());
				
						
						
						//DAO 를 통해 DB에 INSERT
//						BoardDao boardDao= new BoardDaoImpl();
//						int next =boardDao.selectBoardno();
//						uploadFile.setBoardno(next);
//						boardDao.insertFile(uploadFile);
						//-------------------
						
						
						
						
						
						
						//--처리가 완료된 파일 업로드 하기
						// 로컬 저장소에 실제 저장
						
						try {
							item.write(up);//실제업로드
							item.delete();//임시파일삭제
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						//------------------------------------------
						//
						
						
					}//파일처리 if
				
				}//요청 파라미터 처리 while
				
//				HttpSession session =null;
//				session =req.getSession();
//				bor.setBoardno(boardDao.selectBoardno());
//				bor.setTitle(title);
//				bor.setContent(content);
//				bor.setId((String)session.getAttribute("usernick"));
//				
//				
//				uploadFile.setBoardno(bor.getBoardno());
//				
//				boardDao.insertFile(uploadFile);
				
				//-----------------
				
				place.setPlace_number(placeDao.selectPlace_num());
				place.setPlace_name(place_name);
				place.setCoordinate_lat(coordinate_lat);
				place.setCoordinate_lng(coordinate_lng);
				place.setAddress(address);
				place.setPlace_cate(place_cate);
				place.setDetail(detail);
				place.setDb_web_site(db_web_site);
				place.setBusiness_hours(business_hours);
				place.setTel_number(tel_number);
				place.setPlace_information(place_information);
				
				write(place);
				
				placeFile.setPlace_number(place.getPlace_number());
				
				placeDao.insertFile(placeFile);
				
		
	}
	
	public void write(PlaceDto place) {
			placeDao.insert(place);
	};
	
	@Override
	public PlaceDto getPlace_number(HttpServletRequest req) {
		String param=req.getParameter("place_number");
		if(param==null) return null;
		
		int place_number =Integer.parseInt(param);
		
		PlaceDto place = new PlaceDto();
		place.setPlace_number(place_number);
		
		
		
		return place;
	}
	@Override
	public PlaceDto view(PlaceDto place) {
		
		return placeDao.selectPlace(place);
	}
	
	@Override
	public PlaceFile getfilePlace_number(HttpServletRequest req) {
		String param=req.getParameter("place_number");
		if(param==null) return null;
		
		int place_number =Integer.parseInt(param);
		
		PlaceFile placefile=new PlaceFile();
		placefile.setPlace_number(place_number);
		
		return placefile;
	}
	
	@Override
	public PlaceFile fileview(PlaceFile placefile) {
		// TODO Auto-generated method stub
		return placeDao.selectfile(placefile);
	}
	
	@Override
	public boolean deleteComment(Comment comment) {
		commentDao.deleteComment(comment); 
		
		if( commentDao.countComment(comment) > 0 ) {
			return false;
		} else {
			return true;
		}

	}
	
	@Override
	public Comment getComment(HttpServletRequest req) {
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String place_number = (String) req.getParameter("place_number");
		String userno = (String) req.getParameter("userno");
		String content = (String) req.getParameter("content");
		
		Comment comment = new Comment();
		comment.setPlace_number( Integer.parseInt(place_number) );
		comment.setUserno(Integer.parseInt(userno));
		comment.setContent(content);
		
		return comment;
	}
	@Override
	public List getCommentList(PlaceDto place) {
		return commentDao.selectComment(place);
	}
	@Override
	public void insertComment(Comment comment) {
		commentDao.insertComment(comment);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
