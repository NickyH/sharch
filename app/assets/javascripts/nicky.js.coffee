class Home
  @document_ready: ->
    $('#mainheader').hide().fadeIn( 4000 )
    $('.mysubheader').hide().slideDown( 4000 )
    $('.mysubheader2').hide().fadeIn( 4000 )

    window = $(window)
    window.scroll(scroll)

    $('.project-headers').on('click', 'a[data-project-name]', Home.show_project)

  scroll = ->
  yPos = ($window.scrollTop())
  $("#arrowhold").css "opacity", 100 / (yPos * 60 + 100)
  $(document).height() - yPos - 440 <= 0


  @show_project: ->
    project = $(this).data('project-name')
    settings =
      dataType: 'script'
      type: "get"
      url: "/home/#{project}"
    $.ajax(settings)

  @scroll_page: ->
    if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
      $target = $(@hash)
      $target = $target.length and $target or $("[name=" + @hash.slice(1) + "]")
      if $target.length
        targetOffset = $target.offset().top
        $("html,body").animate
          scrollTop: targetOffset
        , 1000
        false

$(document).ready(Home.document_ready)


# $('.moviez').click(Home.show_moviez)
#     $('.flickr').click(Home.show_flickr)
#     $('.team8').click(Home.show_team8)
#     $('.interviewr').click(Home.show_interviewr)