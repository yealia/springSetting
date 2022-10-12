<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--jstl 추가 코드--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp"%>


<div class="container-fluid px-4">
    <h1 class="mt-4">Tables</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
        <li class="breadcrumb-item active">Tables</li>
    </ol>
    <div class="card mb-4">
        <div class="card-body">
            TODO List
        </div>
    </div>
    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            DataTable Example
            <a href="/todo/add"><button type="button" class="btn btn-primary float-end" aria-disabled="true">Add</button></a>
        </div>
        <div class="card-body">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Title</th>
                    <th scope="col">MEMO</th>
                    <th scope="col">Due Date</th>
                    <th scope="col">Complete</th>
                </tr>
                </thead>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:if test="${pageDTO.prev}">
                            <li class="page-item"><a class="page-link" href="/todo/list?page=${pageDTO.start -1}">Previous</a></li>
                        </c:if>
                        <c:forEach begin="${pageDTO.start}" end="${pageDTO.end}" var="num">
                            <li class="page-item"><a class="page-link" href="/todo/list?page=${num}${pageDTO.link}"> ${num} </a></li>
                        </c:forEach>
                            <c:if test="${pageDTO.next}">
                                <li class="page-item"><a class="page-link" href="/todo/list?page=${pageDTO.end  + 1}">Next</a></li>
                            </c:if>
                    </ul>
                </nav>
                <tbody>
                <%--item 으로 java 데이터를 받아서 var에다가 변수명을 붙여준다.--%>
                <c:forEach items="${dtoList}" var="dtoList">
                    <tr>
                        <th scope="row">${dtoList.tno} </th>
                        <td><a href="/todo/read?tno=${dtoList.tno}" style="text-decoration: none; color: black;"><c:out value="${dtoList.title}"/></a></td>
                        <td>${dtoList.memo} </td>
                        <td>${dtoList.dueDate} </td>
                        <td>${dtoList.complete ? "YES" : "NOT YET"} </td>
                    </tr>
                </c:forEach>
                </tbody>
<%--                <tfoot>--%>
<%--                <tr>--%>
<%--                    <td colspan="4">--%>
<%--                        <nav aria-label="...">--%>
<%--                            <ul class="pagination pagination-sm justify-content-center">--%>
<%--                                <c:forEach items="${pageDTO}" var="pageDTO" begin="${pageDTO.start}" end="${pageDTO.end}" step="1">--%>
<%--                                    <li class="page-item ${pageNum == page ? 'active' : ''}"><a class="page-link" href="${pageContext.request.contextPath}/todo/list?page=${pageDTO.page}">${pageNum}</a></li>--%>
<%--                                </c:forEach>--%>
<%--                            </ul>--%>
<%--                        </nav>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                </tfoot>--%>
            </table>

        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ${work} is ${result == 1 ? "success" : "fail"}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <%--                <button type="button" class="btn btn-primary">Save changes</button>--%>
            </div>
        </div>
    </div>
</div>
<script>
    let myModal = new bootstrap.Modal(document.querySelector('#exampleModal'));
    let work = "${work}";
    let result = "${result}";

    if(result == 1){
        myModal.show();
        //모달 출력 후 url 파라미터 값 제거
        history.replaceState({}, null, location.pathname);
    }
</script>

<%@ include file="../includes/footer.jsp"%>

