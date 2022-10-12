<%--
  Created by IntelliJ IDEA.
  User: zerock
  Date: 2022-10-11
  Time: 오후 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>
<main>
  <div class="container-fluid px-4">
    <h1 class="mt-4">Todo READ</h1>
    <ol class="breadcrumb mb-4">
      <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
      <li class="breadcrumb-item active">TODO READ</li>
    </ol>
    <div class="card mb-4">
      <div class="card-body">
        ${reqDTO}
      </div>
    </div>
    <div class="card mb-4">
      <div class="card-header">
        <i class="fas fa-table me-1"></i>
        Todo Modify
      </div>
      <div class="card-body">
        <form id="actionForm" action="/todo/modify" method="post">
          <%-- tno --%>
          <div class="row mb-3">
            <div class="col-md-12">
              <div class="form-floating mb-3 mb-md-0">
                <input class="form-control" name="tno" id="tno" type="text" placeholder="Todo No"
                       value="${dto.tno}" readonly/>
                <label for="title">No</label>
              </div>
            </div>
          </div>
          <%-- title --%>
          <div class="row mb-3">
            <div class="col-md-12">
              <div class="form-floating mb-3 mb-md-0">
                <input class="form-control" name="title" id="title" type="text" value="${dto.title}"
                       placeholder="Title"/>
                <label for="title">Title</label>
              </div>
            </div>
          </div>
          <%-- writer --%>
          <div class="row mb-3">
            <div class="col-md-12">
              <div class="form-floating mb-3 mb-md-0">
                <input class="form-control" name="writer" id="writer" type="text" value="${dto.writer}"
                       placeholder="writer"/>
                <label for="writer">Writer</label>
              </div>
            </div>
          </div>
          <%-- memo --%>
          <div class="form-floating mb-3">
                        <textarea class="form-control" name="memo" id="memo" placeholder="Memo"
                                  style="height: 200px; resize: none;">${dto.memo}</textarea>
            <label for="memo">Memo</label>
          </div>
          <%-- dueDate --%>
          <div class="row mb-3">
            <div class="col-md-12">
              <div class="form-floating mb-3 mb-md-0">
                <%--                        <input class="form-control" name="dueDate" id="dueDate" type="text" placeholder="" />--%>
                <%--                        <label for="inputPassword">Password</label>--%>
                <div class="form-floating input-group mb-0">
                  <input type="text" name="dueDate" id="dueDate" class="datepicker_input form-control"
                         value="${dto.dueDate}" placeholder="DD/MM/YYYY">
                  <label for="dueDate">Due Date</label>
                </div>
              </div>
            </div>
          </div>

          <%-- complete --%>
          <div class="row mb-3">
            <div class="col-md-12">
              <div class="">
                <label for="title">IsComplete</label>
                <c:if test="${dto.complete}">
                  <input class="form-check-input" name="complete" id="complete" type="checkbox"
                         placeholder="Complete" value="${dto.complete}" checked/>
                </c:if>
                <c:if test="${!dto.complete}">
                  <input class="form-check-input" name="complete" id="complete" type="checkbox"
                         placeholder="Complete" value="${dto.complete}"/>
                </c:if>
              </div>
            </div>
          </div>

          <%-- regDate --%>
          <div class="row mb-3">
            <div class="col-md-12">
              <div class="form-floating mb-3 mb-md-0">
                <input class="form-control" name="regDate" id="regDate" type="text"
                       value="${dto.regDate}" placeholder="Regist Date" readonly/>
                <label for="title">Regist Date</label>
              </div>
            </div>
          </div>

          <%-- modDate --%>
          <div class="row mb-3">
            <div class="col-md-12">
              <div class="form-floating mb-3 mb-md-0">
                <input class="form-control" name="modDate" id="modDate" type="text"
                       value="${dto.modDate}" placeholder="Modify Date" readonly/>
                <label for="title">Modify Date</label>
              </div>
            </div>
          </div>

          <button type="button" class="btn btn-danger delBtn">DEL</button>
          <button type="button" class="btn btn-warning modBtn">MOD</button>
          <button type="button" class="btn btn-primary listBtn">LIST</button>
        </form>

        <script>

          const actionForm = document.querySelector("#actionForm")

          document.querySelector(".listBtn").addEventListener("click", (e) => {

            const page = ${reqDTO.page}
                    self.location = `/todo/list?page=\${page}`

          }, false)

          document.querySelector(".delBtn").addEventListener("click", (e) => {

            e.preventDefault()
            e.stopPropagation()

            actionForm.action = "/todo/remove"
            actionForm.method = "post"
            actionForm.submit()

          }, false)

          document.querySelector(".modBtn").addEventListener("click", (e) => {

            e.preventDefault()
            e.stopPropagation()

            actionForm.action = "/todo/modify"
            actionForm.method = "post"
            actionForm.submit()

          }, false)



        </script>


      </div>
    </div>
  </div>
</main>
<%@include file="../includes/footer.jsp" %>