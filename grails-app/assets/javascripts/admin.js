$(document).ready(function() {
    $('#userTable').dataTable({
        "ordering": true,
        "paging": true,
        "lengthMenu": [20, 40, 60, 80, 100],
        "pageLength": 20,
        "searching": true,
        "order": [[ 0, "asc" ],[1,"asc"],[2,"asc"],[3,"asc"],[4,"asc"]],

    });
});

$(document).ready(function() {
    $('#topicTable').dataTable({
        "ordering": true,
        "paging": true,
        "lengthMenu": [20, 40, 60, 80, 100],
        "pageLength": 20,
        "searching": true,
        "order": [[ 0, "asc" ],[1,"asc"],[2,"asc"],[3,"asc"],[4,"asc"]],

    });
});
$(document).ready(function() {
    $('#postTable').dataTable({
        "ordering": true,
        "paging": true,
        "lengthMenu": [20, 40, 60, 80, 100],
        "pageLength": 20,
        "searching": true,
        "order": [[ 0, "asc" ],[1,"asc"],[2,"asc"],[3,"asc"],[4,"asc"],[5,"desc"],[6,"desc"]],

    });
});

function editUserStance(userId,isActive){
    $(document).ready(function() {
        $('.activate-deactivate_'+userId).click(function() {
            isActive=!isActive
            $.ajax({
                url: '/admin/editUserStance',
                type: 'POST',
                data: {
                    userId: userId,
                },
                success: function(response) {
                    var linkText = isActive ? 'Deactivate' : 'Activate';
                    $('#activate-deactivate_'+userId).text(linkText);
                    $('#activate-deactivate_'+userId).data('data-isActive', isActive);
                    $('#isActive_'+userId).text(isActive);
                },
                error: function(xhr) {

                }
            });

            return true;
        });
    });
}

function deleteTopic(topicId){
    $(document).ready(function() {
        $('.delete_'+topicId).click(function() {
            $.ajax({
                url: '/Admin/deleteTopic',
                type: 'POST',
                data: {topicId: topicId},
                success: function(response) {
                    $('#deleteTopic_'+topicId).closest('tr').remove();
                },
                error: function(xhr) {
                    alert('Error: ' + xhr.status);
                }
            });
        });
    });
}

function deletePost(postId){
    $(document).ready(function() {
        $('.delete_'+postId).click(function() {
            $.ajax({
                url: '/Admin/deletePost',
                type: 'POST',
                data: {postId: postId},
                success: function(response) {
                    $('#deletePost_'+postId).closest('tr').remove();
                },
                error: function(xhr) {
                    alert('Error: ' + xhr.status);
                }
            });
        });
    });
}