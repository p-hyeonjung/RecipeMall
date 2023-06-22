package recipeMall.recipe;
//댓글 기능 그냥빼는게 어떨지... => 원래는 레시피 상세페이지(specific.jsp) 밑에 들어감 
import java.sql.Date;

public class recipeReplyVO {
	private int replyNo;
	private int recipeNo;
	private String id;
	private String content;
	private Date writeDate;
}
