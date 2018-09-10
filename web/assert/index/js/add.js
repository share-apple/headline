$(function() {
    $('#ul-del').on('click', '.remove', function () {
        var id = $(this).closest('li').attr('data-id');
        // delete.php
        $.ajax({
            url: '/tadytitle/php/add.php',
            data: {
                action: 'delete',
                id: id
            },
            success: function (data) {
                if (data == '1') {
                    alert('删除成功');
                    location.reload();
                } else {
                    alert('网络出了点问题')
                }
            }
        })
    });
};