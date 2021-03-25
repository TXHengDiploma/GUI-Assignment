package Models;

public class Pagination {
	private int totalPages, resultPerPage, requestPage, startPage, endPage;
	private String url, targetDivId;

	public Pagination(){
		resultPerPage = 20;
	}

	public Pagination(int totalPages, int resultPerPage, int requestPage, String url, String targetDivId){
		this.totalPages = totalPages;
		this.resultPerPage = resultPerPage;
		this.requestPage = requestPage;
		this.url = url;
		this.targetDivId = targetDivId;
		if(totalPages <= 5){
			this.startPage = 1;
			this.endPage = totalPages;
		} else if (requestPage <= 3) {
			this.startPage = 1;
			this.endPage = 5;
		} else if (requestPage >= totalPages - 3 ) {
			this.startPage = totalPages - 4;
			this.endPage = totalPages;
		} else {
			this.startPage = requestPage - 2;
			this.endPage = requestPage + 2;
		}
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getRequestPage() {
		return requestPage;
	}

	public void setRequestPage(int requestPage) {
		this.requestPage = requestPage;
	}

	public int getResultPerPage() {
		return resultPerPage;
	}

	public void setResultPerPage(int resultPerPage) {
		this.resultPerPage = resultPerPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTargetDivId() {
		return targetDivId;
	}

	public void setTargetDivId(String targetDivId) {
		this.targetDivId = targetDivId;
	}

	public String generateNav(){
		String result = "<!-- Pagination for " + targetDivId + " -->\n<nav><ul class=\"pagination justify-content-center\">";

		result += "<li class=\"page-item "+ (requestPage == 1 ? "disabled" : "" ) +"\" data-pagination-target=\""+targetDivId+"\""+" data-pagination-url=\""+url+"&page="+(requestPage > 1 ? requestPage - 1 : 1 )+"\"><a class=\"page-link\">Previous</a></li>";
		
		for(int i = startPage; i <= endPage; i++){
			result += "<li class=\"page-item "+ (requestPage == i ? "disabled" : "" ) +"\" data-pagination-target=\""+targetDivId+"\""+" data-pagination-url=\""+url+"&page="+i+"\"><a class=\"page-link\">"+i+"</a></li>";
		}
		result += "<li class=\"page-item "+ (requestPage == totalPages ? "disabled" : "" ) +"\" data-pagination-target=\""+targetDivId+"\""+" data-pagination-url=\""+url+"&page="+(requestPage < totalPages ? requestPage + 1 : totalPages )+"\"><a class=\"page-link\">Next</a></li>";

		result += "</ul></nav>";
		return result;
	}
}
