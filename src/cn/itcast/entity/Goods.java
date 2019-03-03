package cn.itcast.entity;

public class Goods {
	private Integer gid;
	private String modelNo;//款号
	private String name;//品名
	private String color;//颜色
	private String size;//尺码
	private Double price;//价格
	private String img;//图片
	private Integer inventory;//库存
	private String dcb;//描述
	
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getModelNo() {
		return modelNo;
	}
	public void setModelNo(String modelNo) {
		this.modelNo = modelNo;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Integer getInventory() {
		return inventory;
	}
	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}
	public String getDcb() {
		return dcb;
	}
	public void setDcb(String dcb) {
		this.dcb = dcb;
	}
	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", modelNo=" + modelNo + ", name=" + name + ", color=" + color + ", size=" + size
				+ ", price=" + price + ", img=" + img + ", inventory=" + inventory + ", dcb=" + dcb + "]";
	}
	
}
