package recipeMall.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RecipeService {
	RecipeDAO recipeDAO;
	
	public RecipeService() {
		recipeDAO=new RecipeDAO();
	}
	//레시피 조회하기
	public Map listRecipe(Map<String, Integer> pagingMap) {
		Map recipeMap=new HashMap();
		List<RecipeVO> recipeList=recipeDAO.selectAllRecipe(pagingMap);
		
		return recipeMap;
	}
	
	//글 추가 요청 서비스
	public void insertRecipe(RecipeVO recipeVO) {
		
		int recipeNo= recipeDAO.getNewRecipeNo();
		recipeDAO.insertNewRecipetbl(recipeVO);
		recipeDAO.insertNewRecipeInfotbl(recipeVO, recipeNo);
		
		//받는값 list 
		recipeDAO.insertNewMateTypetbl(recipeVO, recipeNo);
		recipeDAO.insertNewMatetbl(recipeVO, recipeNo);
		recipeDAO.insertNewSteptbl(recipeVO, recipeNo);
		
		// 이미지 이름 저장
		
		
	}
	//글 상세보기 서비스 
	public RecipeVO viewRecipe(int recipeNo) {
		RecipeVO recipeVO=null;
		RecipeInfoVO infoVO= null;
		MaterialtypeVO matetypeVO=null;
		MaterialVO mateVO=null;
		RecipeStepVO stepVO=null;
		
		recipeVO=recipeDAO.selectRecipetbl(recipeNo);
		infoVO=recipeDAO.selectInfotbl(recipeNo);
		matetypeVO=recipeDAO.selectMatetypetbl(recipeNo);
		mateVO=recipeDAO.selectMatetbl(recipeNo);
		stepVO=recipeDAO.selectSteptbl(recipeNo);
		recipeVO.setInfoVO(infoVO);
		recipeVO.setMatetypeVO(matetypeVO);
		recipeVO.setMateVO(mateVO);
		recipeVO.setStepVO(stepVO);
		
		
		return recipeVO;
	}
	
	
	//최대값 가져오기
	public int maxTypeNo() {
		int maxTypeNo = 0;
		
		maxTypeNo = recipeDAO.selectMaxTypeNo();
		
		return maxTypeNo;
	}
	
	// 이미지 저장할 폴더 이름에 넣을 새 글 번호 가져오기
	public int getNewNo() {
		int recipeNo=recipeDAO.getNewRecipeNo()+1;
		return recipeNo;
	}
	
	// 이미지 테이블에 이미지 이름 저장
	public void insertRecipeImg(String[] img, String id, int recipeNo) {
		int imgCate=0;	// 대표:1 스텝:2
		String image=null;
		for(int i=0; i<img.length; i++) {
			if(i==0) {	// 메인 이미지
				imgCate=1;
				image=img[i];
				recipeDAO.insertRecipeImg(imgCate, image, id, recipeNo);
			} else {	// 스텝 이미지
				imgCate=2;
				image=img[i];
				recipeDAO.insertRecipeImg(imgCate, image, id, recipeNo);
			}
		}
	}

}