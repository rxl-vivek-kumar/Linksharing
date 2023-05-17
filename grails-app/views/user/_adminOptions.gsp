<g:if test="${session.currentUser.isAdmin}">
    <a class="dropdown-item" href="/Admin/userList">Users</a>
    <a class="dropdown-item" href="/Admin/topicList">Topics</a>
    <a class="dropdown-item" href="/Admin/postList">Posts</a>
</g:if>