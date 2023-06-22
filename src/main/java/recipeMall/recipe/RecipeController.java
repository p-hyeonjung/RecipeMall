package recipeMall.recipe;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

@WebServlet("/recipe/*")
public class RecipeController extends HttpServlet {
	RecipeService recipeService;
	RecipeVO recipeVO;
	RecipeInfoVO recipeInfoVO;
	MaterialtypeVO mateTypeVO;
	MaterialVO mateVO;
	RecipeStepVO stepVO;
	ImageVO  imageVO;
	
	
	private static String RECIPE_IMG="C:\\phj\\recipe";//뭘로 지정해야하죠..?	//이미지 저장 위치
	public void init(ServletConfig config) throws ServletException{
		recipeService=new RecipeService();
		recipeVO=new RecipeVO();
		recipeInfoVO= new RecipeInfoVO();
		mateVO= new MaterialVO();
		mateTypeVO= new MaterialtypeVO();
		stepVO= new RecipeStepVO();
		imageVO= new ImageVO();
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	public void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 문자 인코딩 설정
		response.setContentType("text/html;charset=utf-8");
		String nextPage = "";
		PrintWriter out; 
		HttpSession session=request.getSession(false);
		String action=request.getPathInfo();
		System.out.println("요청이름 : "+action);
		try {
			List<RecipeVO> recipeList=new ArrayList<RecipeVO>();
			//페이징 -- 만들어야됨 
			if(action==null||action.equals("/recipe.do")) {
				String _section=request.getParameter("section");	//처음 실행시 기본값 null
				String _pageNum=request.getParameter("pageNum");
				int section=Integer.parseInt((_section == null)?"1":_section);
				int pageNum=Integer.parseInt((_pageNum == null)?"1":_pageNum);
				Map<String, Integer> pagingMap=new HashMap<String, Integer>();
				pagingMap.put("section", section);
				pagingMap.put("pageNum", pageNum);
				Map recipeMap=recipeService.listRecipe(pagingMap);	//RecipeService에 생성해야함
				recipeMap.put("section", section);
				recipeMap.put("pageNum", pageNum);
				request.setAttribute("recipeMap", recipeMap);
				nextPage="/views/community/recipe.jsp";
				
				
			//best 만들어야함 	
			}else if(action.equals("/best.do")) {
				
			
				
			}else if (action.equals("/insert.do")){
				
				nextPage="/views/community/insert.jsp";
			
			}//이미지만 넣으면됨 
			else if(action.equals("/recinsert.do")) {
				int recipeNo=0; 
				Map<String, Object> recipeMap=upload(request, response);
				String title=(String)recipeMap.get("title");
				String intro=(String)recipeMap.get("intro");
				String videoLink =(String)recipeMap.get("link");
				//String mainImg=recipeMap.get("rec_file");
				String cate=(String)recipeMap.get("cate");
				String infoServ =(String)recipeMap.get("serv");
				String infoTime=(String)recipeMap.get("time");
				String infoDiff =(String)recipeMap.get("diff");
				
				int maxTypeNo = recipeService.maxTypeNo();
				
				List matetypeNameList = (List)recipeMap.get("matetypeList");
				List matetypeNoListTemp=(List)recipeMap.get("matetypeNoList");
				List matetypeNoList1 = new ArrayList();
				List matetypeNoList2 = new ArrayList();
				int tempNo=0;
				int cnt=0;
				for(int k=0; k<matetypeNoListTemp.size(); k++) {
					int typeNo = Integer.parseInt(matetypeNoListTemp.get(k).toString());
					if(tempNo == 0) {
						tempNo = typeNo;
						matetypeNoList1.add(k,maxTypeNo);
						matetypeNoList2.add(cnt,maxTypeNo);
						cnt++;
					}else {
						if(tempNo == typeNo) {
							matetypeNoList1.add(k,maxTypeNo);
						}else {
							tempNo = typeNo;
							maxTypeNo+=1;
							matetypeNoList1.add(k,maxTypeNo);
							matetypeNoList2.add(cnt,maxTypeNo);
							cnt++;
						}
					}
				}
				List<MaterialtypeVO> MaterialtypeList = new ArrayList<>();
				for(int i=0;i<matetypeNameList.size();i++) {
					MaterialtypeVO mateTypeVO = new MaterialtypeVO();
					mateTypeVO.setMatetypeName(matetypeNameList.get(i).toString());
					mateTypeVO.setMatetypeNo(Integer.parseInt(matetypeNoList2.get(i).toString()));
					MaterialtypeList.add(mateTypeVO);
				}
				mateTypeVO.setMaterialtypeList(MaterialtypeList);
				
				List mateNameList=(List)recipeMap.get("mate_nameList");
				List mateAmountList=(List)recipeMap.get("mate_amountList");
				List<MaterialVO> MaterialList = new ArrayList<>();
				for(int i=0;i<mateNameList.size();i++) {
					MaterialVO mateVO = new MaterialVO();
					mateVO.setMateName(mateNameList.get(i).toString());
					mateVO.setMateAmount(mateAmountList.get(i).toString());
					mateVO.setMatetypeNo(Integer.parseInt(matetypeNoList1.get(i).toString()));
					MaterialList.add(mateVO);
				}
				mateVO.setMaterialList(MaterialList);
				
				List recipeStepExList=(List)recipeMap.get("step_exList");
				List<RecipeStepVO> recipeStepList = new ArrayList<>();
				for(int i=0;i<recipeStepExList.size();i++) {
					RecipeStepVO recipeStepVO = new RecipeStepVO();
					recipeStepVO.setStepEx(recipeStepExList.get(i).toString());
					recipeStepList.add(recipeStepVO);
				}
				stepVO.setRecipeStepList(recipeStepList);
				
				String tip=(String)recipeMap.get("tip");
				
				
				//글쓰는 작성자 id 어떻게 받아오나요..
				//String id=request.getParameter("log_id");	// input hidden으로 넘긴 아이디 받기
				String id=(String)session.getAttribute("log_id");
				System.out.println("id: "+id);
				recipeVO.setId(id); 
				
				recipeVO.setCntLike(0);
				
				recipeVO.setRecipeTitle(title);
				recipeVO.setRecipeIntro(intro);
				recipeVO.setVideoLink(videoLink);
				recipeVO.setCate(cate);
				
				recipeInfoVO.setInfoServ(infoServ);
				recipeInfoVO.setInfoTime(infoTime);
				recipeInfoVO.setInfoDiff(infoDiff);
				recipeVO.setInfoVO(recipeInfoVO);
				
				//리스트 받아오기 - 묶음테이블
				recipeVO.setMatetypeVO(mateTypeVO);
				//리스트 받아오기 - 재료테이블
				recipeVO.setMateVO(mateVO);
				//리스트 받아오기 - 순서테이블
				recipeVO.setStepVO(stepVO);
				
				recipeNo=recipeService.getNewNo();
				
				//이미지 세팅부분 일단 주석처리 해놓음
				int count=(Integer)recipeMap.get("count");	// 이미지 개수 받아옴
				// 메인 이미지
				String mainImg=(String)recipeMap.get("rec_file");
				String[] img=new String[count];
				if (mainImg !=null && mainImg.length()!=0) {
					imgMove(id, recipeNo, mainImg);
					img[0]=mainImg;
				}
				// 이미지 개수만큼 for문 실행
				for(int i=1; i<count; i++) {
					String imgName="rec_file_step"+i;
					String imgFileName=(String)recipeMap.get(imgName);
					if (imgFileName !=null && imgFileName.length()!=0) {
						imgMove(id, recipeNo, imgFileName);
						img[i]=imgFileName;
					}
				}
				
				for(int i=0; i<img.length; i++) {
					System.out.println("이미지 이름: "+img[i]);
				}
				// 이미지 테이블에 이미지 이름 입력
				recipeService.insertRecipeImg(img, id, recipeNo);	// 이미지 이름 배열, 아이디, 레시피 번호
				
				//recipeVO.setImageFileName(imageFileName);
				
				
				//새 글 추가시 이미지를 첨부한 경우에만 수행 
				/*if (mainImg !=null && mainImg.length()!=0) {
					File srcFile=new File(RECIPE_IMG+"\\temp\\"+mainImg);
					File destDir=new File(RECIPE_IMG+"\\"+recipeNo);
					destDir.mkdirs();//폴더만드는 메소드 
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					srcFile.delete();
				}*/
				recipeService.insertRecipe(recipeVO);
				out=response.getWriter();
				out.print("<script>");
				out.print("alert('새글을 추가했습니다.');");
				//out.print("location.href='"+request.getContextPath()+"/community/recipe.do'");
				out.print("</script>");
				return;
			
				
			}//상세페이지 보기 - 완성된거임 
			else if(action.equals("/specific.do")) {
				String recipeNo=request.getParameter("recipeNo");
				recipeVO=recipeService.viewRecipe(Integer.parseInt(recipeNo));
				request.setAttribute("recipe", recipeVO);
				
				//리스트 받아오기 - 묶음테이블
				List mateType= recipeVO.getMatetypeVO().getMaterialtypeList();
				for (int i = 0; i < mateType.size(); i++) {
					System.out.println("matetypeList : "+mateType.get(i));
				}
				request.setAttribute("mateTypeList", mateType);
				
				//리스트 받아오기 - 재료테이블
				List mateName = recipeVO.getMateVO().getMaterialList();
				request.setAttribute("materialList", mateName);
				
				//리스트 받아오기 - 순서테이블
				List stepEx = recipeVO.getStepVO().getRecipeStepList();
				request.setAttribute("stepExList", stepEx);
				
				nextPage="/views/community/specific.jsp";
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);	
			dispatcher.forward(request, response);
		} catch (Exception e) {
			System.out.println("recipeController 요청 에러");
			e.printStackTrace();
		}
	}
	
	// temp에 저장된 이미지 다른 폴더로 옮기는 함수
	private void imgMove(String id, int recipeNo, String imgName){
		File srcFile=new File(RECIPE_IMG+"\\temp\\"+imgName);
		File destDir=new File(RECIPE_IMG+"\\"+id+"\\"+recipeNo);	// 유저 이름 폴더 아래에 레시피 글번호 폴더 객체 생성
		destDir.mkdirs();//폴더만드는 메소드 
		try {
			FileUtils.moveFileToDirectory(srcFile, destDir, true);
		} catch (IOException e) {
			System.out.println("업로드한 이미지 이동 중 오류 발생");
			e.printStackTrace();
		}
		srcFile.delete();
	}
	
	 //이미지 파일 업로드 + 새글 관련 정보 저장
		private Map<String, Object> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			Map<String, Object> recipeMap = new HashMap<String, Object>();
			String encoding="utf-8";
			//이미지파일 업로드 관련된 부분만 수정할것 
			java.io.File currentDirPath = new java.io.File(RECIPE_IMG);
			DiskFileItemFactory factory=new DiskFileItemFactory();
			factory.setRepository(currentDirPath);
			factory.setSizeThreshold(1024*1024);
			ServletFileUpload upload=new ServletFileUpload(factory); 
			int count=0;	// 업로드한 이미지 개수
			try {
				List items=upload.parseRequest(request);
				int matetypeNo=0;
				for (int i = 0; i < items.size(); i++) {
					FileItem fileItem=(FileItem)items.get(i);
					if (fileItem.isFormField()) {
						String fieldName = fileItem.getFieldName();
						String fieldValue = fileItem.getString(encoding);
						String listFieldName = fieldName + "List";
						if (fieldName.equals("matetype")){
							if (matetypeNo==0) {
								 matetypeNo = 1;
							}else {
								matetypeNo++;
							}
						}
						if (fieldName.equals("matetype") || fieldName.equals("mate_name") || fieldName.equals("mate_amount") || fieldName.equals("step_ex")) {
						    List<String> fieldValueList = (List<String>) recipeMap.get(listFieldName); //기존꺼는 계속 리스트를 생성하게되서 이렇게 변경함 
							if ( fieldName.equals("mate_name")) {
								System.out.println("matetypeNo : " +matetypeNo);
								List matetypeNoList = (List) recipeMap.get("matetypeNoList"); 
								if (matetypeNoList==null) {
									matetypeNoList = new ArrayList();
									recipeMap.put("matetypeNoList", matetypeNoList);
								}
								matetypeNoList.add(matetypeNo);
							}
						    if (fieldValueList == null) {
						        fieldValueList = new ArrayList<>();
						        recipeMap.put(listFieldName, fieldValueList);
						    }
						    System.out.println(fieldName + ": "+fieldValue);
						    fieldValueList.add(fieldValue);
						}
						recipeMap.put(fileItem.getFieldName(),fileItem.getString(encoding));
					}// ***********위에는 건들거 없고 이 부분만 수정해서 사진파일 받으면됨 
					else  { 
						System.out.println("매개변수 이름 : " +fileItem.getFieldName());
						System.out.println("파일(이미지)이름 : "+fileItem.getName());
						System.out.println("이미지 크기 : "+ fileItem.getSize()+"bytes");
						if (fileItem.getSize()>0) {
							int idx=fileItem.getName().lastIndexOf("\\");
							if (idx==-1) {
								idx=fileItem.getName().lastIndexOf("/");
							}
							String fileName=fileItem.getName().substring(idx+1);
							recipeMap.put(fileItem.getFieldName(),fileName);
							File uploadFile= new File(currentDirPath+"\\temp\\"+fileName);
							fileItem.write(uploadFile);
							count++;	// 업로드 할 때마다 증가
						}
					}
				}
				recipeMap.put("count", count);	// 이미지 개수 맵에 넣음
			} catch (Exception e) {
				System.out.println("파일 업로드 중 에러!!");
				e.printStackTrace();
			}
			return recipeMap;
		}

}
