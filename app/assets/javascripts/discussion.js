$(function() {

    var messages_bucket_size = 5;
    var $discussion = $('#discussion-modal');
    if ($discussion.length > 0) {
        $('.load-more').click(function() {
            var id = getParameterByName('id', this.href),
                offset = getParameterByName('offset', this.href);
            this.href = '/discussion.js?offset=' + (+offset + messages_bucket_size) + '&id=' + id;
        });

        $discussion.on('show.bs.modal', function (event) {
            var discussion_id = event.relatedTarget.getAttribute('data-id'),
                messages_count = event.relatedTarget.getAttribute('data-messages');
            $('#discussion_id').val(discussion_id);
            $('.load-more').css('display', messages_count > messages_bucket_size? 'block' : 'none')
                           .attr('href', '/discussion.js?offset=0&id=' + discussion_id);
            $.get('/discussion.js', {id: discussion_id});
        });

        $discussion.on('hidden.bs.modal', function (e) {
            $('.discussion-messages').html('');
        });

        $discussion.find('.discussion-form').on('ajax:success', function() {
            $('#message_content').val('');
        });
    }
});