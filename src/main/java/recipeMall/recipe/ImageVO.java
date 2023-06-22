package recipeMall.recipe;

public class ImageVO {
	private int imgNum;
	private int imgCate;
	private String imageName;
	private String id;
	private int target;
	
	public ImageVO() {
		// TODO Auto-generated constructor stub
	}

	public ImageVO(int imgNum, int imgCate, String imageName, String id, int target) {
		this.imgNum = imgNum;
		this.imgCate = imgCate;
		this.imageName = imageName;
		this.id = id;
		this.target = target;
	}

	public int getImgNum() {
		return imgNum;
	}

	public void setImgNum(int imgNum) {
		this.imgNum = imgNum;
	}

	public int getImgCate() {
		return imgCate;
	}

	public void setImgCate(int imgCate) {
		this.imgCate = imgCate;
	}

	public String getimageName() {
		return imageName;
	}

	public void setimageName(String imageName) {
		this.imageName = imageName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getTarget() {
		return target;
	}

	public void setTarget(int target) {
		this.target = target;
	}
	
	
	
}
