package dto;

public class Category {
	private int category_no;
	private String kind;
	private String title;
	private String createdate;
	
	private Cash cash;
	
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public Cash getCash() {
        return cash;
    }
    public void setCash(Cash cash) {
        this.cash = cash;
    }
	@Override
	public String toString() {
		return "Category [category_no=" + category_no + ", kind=" + kind + ", title=" + title + ", createdate="
				+ createdate + ", cash=" + cash + "]";
	}
	
}
