
$(function() {
    let  tbody=$('#tbody');
    let add=$('#add');
    let progress=$('#progress');
    $(document).ajaxStart(function () {
        progress.show();
    });
    $(document).ajaxComplete(function () {
        progress.hide();
    });

    tbody.on('blur','.form-control',function () {
        let id=$(this).closest('tr').attr('data-id');
        let k=$(this).attr('data-type');
        let v=$(this).val();
        $.ajax({
            url:'/admin.php?c=news&m=update',
            data:{
                id:id,
                k:k,
                v:v,
            }
        })
    });

    tbody.on('click','.remove',function () {
        let id=$(this).closest('tr').attr('data-id');
        console.log(id);
        $.ajax({
           url:'/admin.php?c=news&m=remove&&id='+id,
            success:function (data) {
                if(data==1){
                    location.reload();//刷新页面
                }else{
                    alert('网络延迟')
                }
            }
        })
    });


    add.on('click',function () {

        $.ajax({
             url:'/admin.php?c=news&m=add',
            success:function (data) {
                console.log(data);
                 if(data==1){
                     location.reload();

                }else{
                    alert('网络延迟')
                 }
             }
       })
   })
});