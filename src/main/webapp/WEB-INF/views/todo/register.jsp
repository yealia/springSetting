<%--
  Created by IntelliJ IDEA.
  User: zerock
  Date: 2022-10-11
  Time: 오후 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp"%>
<main>
  <form id="actionForm" action="/todo/register" method="get">
    <input type="hidden" id="page" name="page" value="${pageRequestDTO.page}">
  </form>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-7">
        <div class="card shadow-lg border-0 rounded-lg mt-5">
          <div class="card-header"><h3 class="text-center font-weight-light my-4">Todo Register</h3></div>
          <div class="card-body">
            <form action="/todo/register" method="post">
              <%-- title --%>
              <div class="row mb-3">
                <div class="col-md-12">
                  <div class="form-floating mb-3 mb-md-0">
                    <input class="form-control" name="title" id="title" type="text" placeholder="Title" />
                    <label for="title">Title</label>
                  </div>
                </div>
              </div>
              <%-- memo --%>
              <div class="form-floating mb-3">
                <textarea class="form-control" name="memo" id="memo" placeholder="Memo" style="height: 200px;"></textarea>
                <label for="memo">Memo</label>
              </div>
              <%-- writer --%>
              <div class="row mb-3">
                <div class="col-md-12">
                  <div class="form-floating mb-3 mb-md-0">
                    <input class="form-control" name="writer" id="writer" type="text" placeholder="Writer" />
                    <label for="Writer">Writer</label>
                  </div>
                </div>
              </div>
              <%-- dueDate --%>
              <div class="row mb-3">
                <div class="col-md-12">
                  <div class="form-floating mb-3 mb-md-0">
                    <%--                        <input class="form-control" name="dueDate" id="dueDate" type="text" placeholder="" />--%>
                    <%--                        <label for="inputPassword">Password</label>--%>
                    <div class="form-floating input-group mb-0">
                      <input type="date" name="dueDate" id="dueDate" class="form-control">
                      <label for="dueDate">Due Date</label>
                    </div>
                  </div>
                </div>
              </div>

              <div class="row mt-4 mb-6">
                <%--                <div class="d-grid"><a class="btn btn-primary btn-block" href="login.html">Create Account</a></div>--%>
                <div class="form-floating col-md-6 d-grid">

                  <button type="button" class="btn btn-success btn-block listBtn" ><a href="/todo/list?page=${pageRequestDTO.page}">Go List</a></button>

                </div>
                <div class="form-floating col-md-6 d-grid">
                  <button type="submit" class="btn btn-primary btn-block">Register</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<script>

</script>
<%@include file="../includes/footer.jsp"%>