$(function()
{
    function saveOrder() {
        var order = getOrder();
        for (var i = 0; i < order.length; i++) {
            $.ajax({
                url: '/admin/albums/' + $('#album-id').val() + '/photos/' + order[i],
                type: 'PUT',
                data: {'sort': i}
            });
        }
    }

    function getOrder ()
    {
        return $('#drag-parent').children().toArray().map(function(val) { return val.getAttribute('data-id') });
    }

    Sortable.create(document.getElementById("drag-parent"), { animation: 200 });

    $('.save-order').click(saveOrder);
});
