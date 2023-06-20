package recipeMall.shopping;

public class ProductFaqVO {
	private int prodFaqNo;
	private String prodTitle;
	private String prodContent;
	private String adminId;
	private String adminContent;
	private int prodCode;
	private int hasComent;
	private String id;
	
	
	public ProductFaqVO() {
		
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getProdFaqNo() {
		return prodFaqNo;
	}
	public void setProdFaqNo(int prodFaqNo) {
		this.prodFaqNo = prodFaqNo;
	}
	public String getProdTitle() {
		return prodTitle;
	}
	public void setProdTitle(String prodTitle) {
		this.prodTitle = prodTitle;
	}
	public String getProdContent() {
		return prodContent;
	}
	public void setProdContent(String prodContent) {
		this.prodContent = prodContent;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminContent() {
		return adminContent;
	}
	public void setAdminContent(String adminContent) {
		this.adminContent = adminContent;
	}
	public int getProdCode() {
		return prodCode;
	}
	public void setProdCode(int prodCode) {
		this.prodCode = prodCode;
	}
	public int getHasComent() {
		return hasComent;
	}
	public void setHasComent(int hasComent) {
		this.hasComent = hasComent;
	}
	
	
 }
