package recipeMall.recipe;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.swing.plaf.synth.SynthStyleFactory;

import recipeMall.user.UserVO;

public class RecipeDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public RecipeDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB 연결 오류");
		}
	}
	
	//레시피 전체 조회하기 메소드 
	public List<RecipeVO> selectAllRecipe(Map<String, Integer> pagingMap) {
		List<RecipeVO> recipeList = new ArrayList<RecipeVO>();
		int section = pagingMap.get("section");
		int pageNum = pagingMap.get("pageNum");
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT ROWNUM AS recNum, rt.recipeNo, rt.recipeTitle, rt.cntLike, it.imageName, ut.nikName FROM recipetbl rt, usertbl ut, imagetbl it WHERE rownum BETWEEN (?-1)*100+(?-1)*10+1 AND (?-1)*100+?*10";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, section);
			pstmt.setInt(2, pageNum);
			pstmt.setInt(3, section);
			pstmt.setInt(4, pageNum);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int recipeNo=rs.getInt("recipeNo");
				String recipeTitle=rs.getString("recipeTitle");
				String imageName=rs.getString("imageName");
				int cntLike=rs.getInt("cntLike");
				String nikName=rs.getString("nikName");
				RecipeVO recipeVO = new RecipeVO();
				UserVO userVO = new UserVO();
				ImageVO imageVO= new ImageVO();
				recipeVO.setRecipeNo(recipeNo);
				recipeVO.setRecipeTitle(recipeTitle);
				recipeVO.setCntLike(cntLike);
				userVO.setNikName(nikName);
				if (rs.getInt("imgCate") == 1) {
			        imageVO.setimageName(imageName);
			        recipeVO.setImgVo(imageVO);
			    }
				recipeVO.setUserVO(userVO);
				recipeList.add(recipeVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("레시피 목록 조회 중 에러");
			e.printStackTrace();
		}
		return recipeList;
	}
	
	//레시피 목록 수
	   public int selectToRecipe() {
	      int totCount = 0;
	      try {
	         conn = dataFactory.getConnection();
	         String query = "select count(*) from recipetbl where recipeTitle IS NOT NULL AND recipeTitle <> ''";
	         pstmt = conn.prepareStatement(query);
	         ResultSet rs = pstmt.executeQuery();
	         if (rs.next()) {
	            totCount = rs.getInt(1);
	         }
	         pstmt.close();
	         rs.close();
	         conn.close();
	      } catch (Exception e) {
	         System.out.println("전체 글 목록 수 처리중 에러");
	         e.printStackTrace();
	      }
	      return totCount;
	   }

// 글번호 생성 메소드 여기서 글번호 생성한다. 어차피 입력하는데니까 가져올필요가업잖아 
	public int getNewRecipeNo() {
		int _recipeNo=1;
		try {
			conn=dataFactory.getConnection();
			//max함수를 이용해서 가장 큰 번호를 조회
			String query="select max(recipeNo) from recipetbl";
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			if (rs.next()) {
				_recipeNo=rs.getInt(1)+1;
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("글번호 생성중 에러!!");
			e.printStackTrace();
		}
		return _recipeNo;
	}
	//새 글 추가 - recipetbl 추가 
	public int  insertNewRecipetbl(RecipeVO recipeVO) {
		int recipeNo=getNewRecipeNo()+1; 
		try {
			conn=dataFactory.getConnection();
			// ?? fk 로 받는 컬럼들은 참조되는 테이블에 있어야 참조할수 있으니까 먼저 생성
			String title = recipeVO.getRecipeTitle();
			String intro=recipeVO.getRecipeIntro();
			String videolink=recipeVO.getVideoLink();
			String cate=recipeVO.getCate();
			String tip=recipeVO.getRecipeTip();
			String id=recipeVO.getId();
			int cntLike=recipeVO.getCntLike();
			
			
			String recipetbl_query="insert into recipetbl(recipeNo, recipeTitle, recipeIntro, videoLink, cate, recipeTip, id, cntLike) values(?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(recipetbl_query);
			pstmt.setInt(1, recipeNo);
			pstmt.setString(2, title);
			pstmt.setString(3, intro);
			pstmt.setString(4, videolink);
			pstmt.setString(5, cate);
			pstmt.setString(6, tip);
			pstmt.setString(7, id);
			pstmt.setInt(8, cntLike);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
			//imgtbl  추가 => 보류... 	
			System.out.println("recipetbl 추가 완료");		
		} catch (Exception e) {
			System.out.println("recipetbl 추가중 에러!!");
			e.printStackTrace();
		}
		return recipeNo;
	}
	
	
	//새 글 추가 - recipeInfotbl 추가 
	public void insertNewRecipeInfotbl(RecipeVO recipeVO, int recipeNo){
		String serv=recipeVO.getInfoVO().getInfoServ();
		String time=recipeVO.getInfoVO().getInfoTime();
		String diff= recipeVO.getInfoVO().getInfoDiff();
		try {
			conn=dataFactory.getConnection();
			//(SELECT COALESCE(MAX(infoNo), 1) => infoNo 컬럼에 아무값도 없을땐 1을 넣는다 
			String infotbl_query = "INSERT INTO recipeInfotbl (recipeInfoNo, recipeNo, infoServ, infoTime, infoDiff) VALUES ((SELECT COALESCE(MAX(recipeInfoNo) + 1 , 1)  FROM recipeInfotbl),?, ?, ?, ?)";
			pstmt=conn.prepareStatement(infotbl_query);
			pstmt.setInt(1, recipeNo);
			pstmt.setString(2, serv);
			pstmt.setString(3, time);
			pstmt.setString(4, diff);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			System.out.println("recipeinfotbl 추가 완료");	
		} catch (Exception e) {
			System.out.println("infotbl추가중 에러");
			e.printStackTrace();
		}
		
	}
	
	//새 글 추가 - matetypetbl 추가 
		public void insertNewMateTypetbl(RecipeVO recipeVO, int recipeNo){
			List<MaterialtypeVO> MaterialtypeList = recipeVO.getMatetypeVO().getMaterialtypeList();
			try {
				conn=dataFactory.getConnection();
				for(int i=0; i<MaterialtypeList.size(); i++) {
					String mateType_query="insert into materialTypetbl(matetypeNo ,recipeNo, mateTypeName ) values  (?,?, ?)";
					pstmt=conn.prepareStatement(mateType_query);
					pstmt.setInt(1, MaterialtypeList.get(i).getMatetypeNo());
					pstmt.setInt(2, recipeNo);
					pstmt.setString(3,MaterialtypeList.get(i).getMatetypeName());
					pstmt.executeUpdate();
				}
				pstmt.close();
				conn.close();
				System.out.println("matetypetbl 추가 완료");	
			} catch (Exception e) {
				System.out.println("matetypetbl추가중 에러");
				e.printStackTrace();
			}	
		}		
	//새 글 추가 - matetbl 추가 
	public void insertNewMatetbl(RecipeVO recipeVO, int recipeNo){
		List<MaterialVO> MaterialList = recipeVO.getMateVO().getMaterialList();
		try {
			conn=dataFactory.getConnection();
			for(int i=0; i<MaterialList.size(); i++) {
				String mate_query="insert into materialtbl(mateNo,recipeNo,matetypeNo,mateName,mateAmount) values ((SELECT COALESCE(MAX(mateNo)+ 1 , 1) FROM materialtbl), ?, ?, ?, ?)";
				pstmt=conn.prepareStatement(mate_query);
				pstmt.setInt(1, recipeNo);
				pstmt.setInt(2, MaterialList.get(i).getMatetypeNo());
				pstmt.setString(3, MaterialList.get(i).getMateName());
				pstmt.setString(4, MaterialList.get(i).getMateAmount());
				pstmt.executeUpdate();
			}
			pstmt.close();
			conn.close();	
			System.out.println("matetbl 추가 완료");	
		} catch (Exception e) {
			System.out.println("materialtbl추가중 에러");
			e.printStackTrace();
		}
	}
	//새 글 추가 - steptbl 추가 
	public void insertNewSteptbl(RecipeVO recipeVO, int recipeNo){
		int stepSe=recipeVO.getStepVO().getStepSe();
		List<RecipeStepVO> recipeStepList = recipeVO.getStepVO().getRecipeStepList();
		try {
			for(int i=0; i<recipeStepList.size(); i++) {
				conn=dataFactory.getConnection();
				String step_query="insert into recipeSteptbl(recipeStepNo,recipeNo,stepSe,stepEx) values ((SELECT COALESCE(MAX(recipeStepNo)+ 1, 1)  FROM recipeSteptbl),?,?,?)";
				pstmt=conn.prepareStatement(step_query);
				pstmt.setInt(1, recipeNo);
				pstmt.setInt(2, i+1);
				pstmt.setString(3, recipeStepList.get(i).getStepEx());
				pstmt.executeUpdate();
			}
			
			pstmt.close();
			conn.close();
			System.out.println("steptbl 추가 완료");	
		} catch (Exception e) {
			System.out.println("steptbl추가중 에러");
			e.printStackTrace();
		}
		
	}
	
	// 새 글 이미지 이름 저장
	public void insertRecipeImg(int imgCate, String image, String id, int recipeNo) {
		try {
			conn=dataFactory.getConnection();
			String query="insert into imagetbl(imgnum, imgcate, imagename, id, target) values(imgnum_seq.nextval,?,?,?,?)";
			pstmt=conn.prepareStatement(query);
			System.out.println("imgCate: "+imgCate);
			pstmt.setInt(1, imgCate);
			System.out.println("image: "+image);
			pstmt.setString(2, image);
			System.out.println("id: "+id);
			pstmt.setString(3, id);
			System.out.println("recipeNo: "+recipeNo);
			pstmt.setInt(4, recipeNo);
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("이미지 이름 저장 중 오류 발생");
			e.printStackTrace();
		}
	}
		
	//*****상세보기 시작 	
	//레시피 상세보기 - recipetbl
	public RecipeVO selectRecipetbl(int recipeNo) {
		RecipeVO recipeVO=new RecipeVO();
		try {
			System.out.println("보여줄 recipeNo:"+recipeNo);
			conn=dataFactory.getConnection();
			String query="select recipeNo, recipeTitle, recipeIntro, videoLink, cate, recipeTip, id, writeDate from recipetbl where recipeNo=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, recipeNo);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			int _recipeNo=rs.getInt("recipeNo");
			String title=rs.getString("recipeTitle");
			String intro =rs.getString("recipeIntro");
			String videoLink =rs.getString("videoLink");
			String cate =rs.getString("cate");
			String tip =rs.getString("recipeTip");
			String id=rs.getString("id");
			Date writeDate=rs.getDate("writeDate");
			
			recipeVO.setRecipeNo(_recipeNo);
			recipeVO.setRecipeTitle(title);
			recipeVO.setRecipeIntro(intro);
			recipeVO.setVideoLink(videoLink);
			recipeVO.setCate(cate);
			recipeVO.setRecipeTip(tip);
			recipeVO.setId(id);
			recipeVO.setWriteDate(writeDate);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("recipetbl 상세 구현 중 에러!!");
			e.printStackTrace();
		}
		return recipeVO;
	}
	//레시피 상세보기 - infotbl
	public RecipeInfoVO selectInfotbl(int recipeNo) {
		RecipeInfoVO infoVO=new RecipeInfoVO();
		try {
			conn=dataFactory.getConnection();
			String query="select recipeNo, recipeInfoNo, infoServ, infoTime, infoDiff from recipeInfotbl where recipeNo=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, recipeNo);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			int _recipeNo=rs.getInt("recipeNo");
			String infoServ =rs.getString("infoServ");
			String infoTime =rs.getString("infoTime");
			String infoDiff =rs.getString("infoDiff");
			
			infoVO.setInfoServ(infoServ);
			infoVO.setInfoTime(infoTime);
			infoVO.setInfoDiff(infoDiff);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("infotbl 상세 구현 중 에러!!");
			e.printStackTrace();
		}
		return infoVO;
	}
	
	//레시피 상세보기 - matetypetbl
	public MaterialtypeVO selectMatetypetbl(int recipeNo) {
		List<MaterialtypeVO> MaterialtypeList = new ArrayList<>();
		MaterialtypeVO matetypeVO = new MaterialtypeVO();
		try {
			conn=dataFactory.getConnection();
			String query="select recipeNo, matetypeNo, matetypeName from materialTypetbl where recipeNo=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, recipeNo);
			ResultSet rs=pstmt.executeQuery();
			while (rs.next()) {
				MaterialtypeVO TempmatetypeVO = new MaterialtypeVO();
				TempmatetypeVO.setRecipeNo(recipeNo);
				TempmatetypeVO.setMatetypeNo(rs.getInt("matetypeNo"));
				TempmatetypeVO.setMatetypeName(rs.getString("matetypeName"));
				MaterialtypeList.add(TempmatetypeVO);
			}
			matetypeVO.setMaterialtypeList(MaterialtypeList);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("matetypetbl 상세 구현 중 에러!!");
			e.printStackTrace();
		}
		return matetypeVO;
	}
	
	//레시피 상세보기 - matetbl
	public MaterialVO selectMatetbl(int recipeNo) {
		List<MaterialVO> mateVoList = new ArrayList<>();
		MaterialVO mateVO= new MaterialVO();
		try {
			conn=dataFactory.getConnection();
			String query="select recipeNo, matetypeNo, mateName, mateAmount from materialtbl where recipeNo=? ";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, recipeNo);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				MaterialVO TempmateVO = new MaterialVO();
				TempmateVO.setRecipeNo(recipeNo);
				TempmateVO.setMatetypeNo(rs.getInt("matetypeNo"));
				TempmateVO.setMateName(rs.getString("mateName"));
				TempmateVO.setMateAmount(rs.getString("mateAmount"));
				mateVoList.add(TempmateVO);
			}
			mateVO.setMaterialList(mateVoList);
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("matetbl 상세 구현 중 에러!!");
			e.printStackTrace();
		}
		return mateVO;
	}
	
	//레시피 상세보기 - steptbl
	public RecipeStepVO selectSteptbl(int recipeNo) {
		List<RecipeStepVO> recipeStepList = new ArrayList<>();
		RecipeStepVO stepVO = new RecipeStepVO();
		try {
			conn=dataFactory.getConnection();
			String query="select recipeStepNo, stepSe, recipeNo, stepEx from recipeSteptbl where recipeNo=? ";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, recipeNo);
			ResultSet rs=pstmt.executeQuery();
			List<String> stepEx = new ArrayList<>();
			while(rs.next()) {
				RecipeStepVO TempstepVO = new RecipeStepVO();
				TempstepVO.setRecipeNo(recipeNo);
				TempstepVO.setRecipeStepNo(rs.getInt("recipeStepNo"));
				TempstepVO.setStepEx(rs.getString("stepEx"));
				TempstepVO.setStepSe(rs.getInt("stepSe"));
				recipeStepList.add(TempstepVO);
			}
			stepVO.setRecipeStepList(recipeStepList);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("steptbl 상세 구현 중 에러!!");
			e.printStackTrace();
		}
		return stepVO;
	}
	
	public int selectMaxTypeNo() {
		int num = 0;
		
		try {
			conn=dataFactory.getConnection();
			String query="select max(matetypeNo)+1 as maxNo from materialTypetbl";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				num = rs.getInt("maxNo");
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("selectMaxTypeNo 상세 구현 중 에러!!");
			e.printStackTrace();
		}
		
		return num;
	}
}
