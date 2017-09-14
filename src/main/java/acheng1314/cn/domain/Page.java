package acheng1314.cn.domain;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

public class Page<T> implements Serializable {
    private int pageNum;
    private int pageSize;
    private int totalNum;
    /**
     * 查询数据列表
     */
    private List<T> data = Collections.emptyList();

    public Page(int num, int size) {
        this.pageNum = num;
        this.pageSize = size;
    }

    public Page() {
    }

    public int getTotalNum() {
        return totalNum;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        data.forEach((T var) -> sb.append(var.toString()).append("\n"));
        return "Page{" +
                "pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", totalNum=" + totalNum +
                ", data=[\n" + sb + "]\n" +
                '}';
    }
}
