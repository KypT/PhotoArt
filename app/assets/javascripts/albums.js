$(document).on('page:change', function()
{
    function saveOrder() {
        var order = getOrder();
        for (var i = 0; i < order.length; i++) {
            $.ajax({
                url: '/admin/albums/' + albumId + '/photos/' + order[i],
                type: 'PUT',
                data: {'sort': i}
            });
        }
    }

    function getOrder ()
    {
        return $('#drag-parent').children().toArray().map(function(val) { return val.getAttribute('data-id') });
    }

        if (document.getElementById("drag-parent"))
            Sortable.create(document.getElementById("drag-parent"), { animation: 200 });

    $('.save-order').click(saveOrder);

    var photoId = 0;

    $('#myModal').on('show.bs.modal', function (event)
    {
        photoId = event.relatedTarget.getAttribute('data-id');
        var photo = $('#photo-' + photoId).clone();

        $('#new-name').val(photos[photoId]['name']);

        $(this).find('.modal-body').html(photos[photoId]['medium']);
    });

    $('#change-name').unbind('click').click(function()
    {
        var newName = $('#new-name').val();
        $('#photo-' + photoId).find('h4').html(newName);

        $.ajax({
            url: '/admin/albums/' + albumId + '/photos/' + photoId ,
            type: 'PUT',
            data: {'name': newName}
        });
    });

    $('#make-cover').click(function()
    {
        $.ajax({
            url: '/admin/albums/' + albumId,
            type: 'PUT',
            data: {'album[cover]': photoId }
        }).done(function(data)
        {
            if (data = 'ok') {
                $('#make-cover').after('<div class="alert alert-success message" role="alert">Готово!</div>');
                setTimeout(function() { $('.message').fadeOut(); }, 2000);
            }
            else {
                $('#make-cover').after('<div class="alert alert-danger message" role="alert">Ошибка!</div>');
                setTimeout(function() { $('.message').fadeOut(); }, 2000);
            }
        });
    });

    if ($("#photo").length)
            $("#photo").fileinput({
            'browseLabel': 'Обзор',
            'cancelLabel': 'Отменить',
            'uploadLabel': 'Загрузить',
            'removeLabel': 'Удалить',
            'dropZoneTitle': 'Чтобы добавить фотографии в альбом, перетащите их сюда',
            'allowedFileTypes': ['image'],
            'uploadUrl': uploadUrl
        });

    $('.remove').click(function()
    {
        if (!confirm('Точно?')) return;

        var id = this.getAttribute('data-id');

        $.ajax({
            url: '/admin/albums/' + $('#album-id').val() + '/photos/' + $(this).attr('data-id') ,
            type: 'DELETE'
        }).done(function()
            {
                $('.photo-container[data-id=' + photoId + ']').fadeOut();
            }
        );
    });
});