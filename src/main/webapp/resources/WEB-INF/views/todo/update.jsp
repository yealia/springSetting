<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-header"><h3 class="text-center font-weight-light my-4">Todo Add</h3></div>
                <div class="card-body">
                    <form action="/todo/update" method="post">
                        <%-- tno --%>
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" name="tno" id="tno" type="text" placeholder="Todo No" value="${todo.tno}" readonly/>
                                    <label for="title">No</label>
                                </div>
                            </div>
                        </div>
                        <%-- title --%>
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" name="title" id="title" type="text" value="${todo.title}" placeholder="Title"/>
                                    <label for="title">Title</label>
                                </div>
                            </div>
                        </div>
                        <%-- memo --%>
                        <div class="form-floating mb-3">
                            <textarea class="form-control" name="memo" id="memo" placeholder="Memo" style="height: 200px; resize: none;">${todo.memo}</textarea>
                            <label for="memo">Memo</label>
                        </div>
                        <%-- dueDate --%>
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <div class="form-floating mb-3 mb-md-0">
                                    <%--                        <input class="form-control" name="dueDate" id="dueDate" type="text" placeholder="" />--%>
                                    <%--                        <label for="inputPassword">Password</label>--%>
                                    <div class="form-floating input-group mb-0">
                                        <input type="text" name="dueDate" id="dueDate" class="datepicker_input form-control" value="${todo.dueDate}" placeholder="DD/MM/YYYY">
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
                                    <c:if test="${todo.complete}">
                                        <input class="form-check-input" name="complete" id="complete" type="checkbox" placeholder="Complete" value="${todo.complete}" checked/>
                                    </c:if>
                                    <c:if test="${!todo.complete}">
                                        <input class="form-check-input" name="complete" id="complete" type="checkbox" placeholder="Complete" value="${todo.complete}"/>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                        <%-- regDate --%>
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" name="regDate" id="regDate" type="text" value="${todo.regDate}" placeholder="Regist Date" readonly/>
                                    <label for="title">Regist Date</label>
                                </div>
                            </div>
                        </div>

                        <%-- modDate --%>
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" name="modDate" id="modDate" type="text" value="${todo.modDate}" placeholder="Modify Date" readonly/>
                                    <label for="title">Modify Date</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4 mb-6">
                            <%--                <div class="d-grid"><a class="btn btn-primary btn-block" href="login.html">Create Account</a></div>--%>
                            <div class="form-floating col-md-6 d-grid">
                                <button type="button" class="btn btn-success btn-block" onclick="location.href='/todo/list'">Go List</button>
                            </div>
                            <div class="form-floating col-md-6 d-grid">
                                <button type="submit" class="btn btn-primary btn-block">Modify</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../includes/footer.jsp" %>
<script>
    const getDatePickerTitle = elem => {
        // From the label or the aria-label
        const label = elem.nextElementSibling;
        let titleText = '';
        if (label && label.tagName === 'LABEL') {
            titleText = label.textContent;
        } else {
            titleText = elem.getAttribute('aria-label') || '';
        }
        return titleText;
    }

    const elems = document.querySelectorAll('.datepicker_input');
    for (const elem of elems) {
        const datepicker = new Datepicker(elem, {
            'format': 'yyyy-mm-dd', // UK format
            title: getDatePickerTitle(elem),
            autohide: true
        });
    }
</script>
